import 'dart:io';

import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:indidus_password_manager/init_const.dart';
import 'package:indidus_password_manager/src/lib/model.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';
import 'package:indidus_password_manager/src/rust/models/financial_cards.dart';
import 'package:indidus_password_manager/src/rust/models/identity_cards.dart';
import 'package:indidus_password_manager/src/rust/models/logins.dart';
import 'package:indidus_password_manager/src/rust/models/notes.dart';

class LoginRestore {
  final Login login;
  final bool isRestored;
  final bool isFailed;
  final String? failedReason;
  final bool isNewerVersionPresentInDB;

  LoginRestore({
    required this.login,
    required this.isRestored,
    required this.isFailed,
    required this.failedReason,
    required this.isNewerVersionPresentInDB,
  });
}

class IdentityCardRestore {
  final IdentityCard id;
  final bool isRestored;
  final bool isFailed;
  final String? failedReason;
  final bool isNewerVersionPresentInDB;

  IdentityCardRestore({
    required this.id,
    required this.isRestored,
    required this.isFailed,
    required this.failedReason,
    required this.isNewerVersionPresentInDB,
  });
}

class FinancialCardRestore {
  final FinancialCard card;
  final bool isRestored;
  final bool isFailed;
  final String? failedReason;
  final bool isNewerVersionPresentInDB;

  FinancialCardRestore({
    required this.card,
    required this.isRestored,
    required this.isFailed,
    required this.failedReason,
    required this.isNewerVersionPresentInDB,
  });
}

class NoteRestore {
  final Note note;
  final bool isRestored;
  final bool isFailed;
  final String? failedReason;
  final bool isNewerVersionPresentInDB;

  NoteRestore({
    required this.note,
    required this.isRestored,
    required this.isFailed,
    required this.failedReason,
    required this.isNewerVersionPresentInDB,
  });
}

class RestoreResult {
  final bool isFailed;
  final String? failedReason;
  final bool isFileNotSelected;
  final bool isRestored;

  final List<LoginRestore> loginRestores;
  final List<IdentityCardRestore> idRestores;
  final List<FinancialCardRestore> cardRestores;
  final List<NoteRestore> noteRestores;

  RestoreResult({
    this.isFailed = false,
    this.failedReason,
    this.isFileNotSelected = false,
    this.isRestored = false,
    this.loginRestores = const [],
    this.idRestores = const [],
    this.cardRestores = const [],
    this.noteRestores = const [],
  });
}

class BackupRestoreManager {
  Future<String?> backup() async {
    // Get all the logins from the database
    var logins = await listLogin(query: getSearchQuery(null, null));
    // for (var i = 0; i < logins.length; i++) {
    //   logins[i] = await logins[i].decrypt();
    // }
    // Get all the identity cards from the database
    var ids = await listIdentityCard(query: getSearchQuery(null, null));
    // Get all the financial cards from the database
    var cards = await listFinancialCard(query: getSearchQuery(null, null));
    // for (var i = 0; i < cards.length; i++) {
    //   cards[i] = await cards[i].decrypt();
    // }
    // Get all the notes from the database
    var notes = await listNote(query: getSearchQuery(null, null));

    var model = Models(
      version: appVersion,
      logins: logins,
      ids: ids,
      cards: cards,
      notes: notes,
    );
    var path = await getDownloadDirectoryPath();

    if (path != null) {
      // Create a json string from the model
      var jsonString = model.toJson();
      // Create a file name
      var now = DateTime.now();
      var fileName =
          "${now.year}_${now.month}_${now.day}_${now.hour}_${now.minute}_${now.second}_indidus_password_backup.json";
      // Save the model to the file system
      path = join(path, fileName);
      // Save to file
      var file = File(path);
      var x = await file.writeAsString(jsonString, flush: true);
      return x.path.toString();
    }
    return null;
  }

  // It will return null if no file was selected or json
  // Else it will return all the failed backup items
  Future<RestoreResult> restoreBackup() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      allowMultiple: false,
      dialogTitle: 'Select the backup file to restore.',
    );
    if (result == null) {
      return RestoreResult(isFileNotSelected: true);
    }

    File file = File(result.files.single.path!);
    var jsonString = "";
    try {
      jsonString = await file.readAsString();
    } catch (e) {
      return RestoreResult(
        isFailed: true,
        failedReason: "Failed to read the file",
      );
    }

    Models model;
    try {
      model = Models.fromJson(jsonString);
    } catch (e) {
      return RestoreResult(
        isFailed: true,
        failedReason: "Failed to parse the json file",
      );
    }
    return await restoreModel(model);
  }

  // It will return all failed items that failed to be restored
  Future<RestoreResult> restoreModel(Models model) async {
    var result = RestoreResult(
      loginRestores: await restoreLogins(model.logins),
      idRestores: await restoreIdentityCards(model.ids),
      cardRestores: await restoreFinancialCards(model.cards),
      noteRestores: await restoreNotes(model.notes),
    );

    return result;
  }

  // returns all the logins which are failed to be restored
  Future<List<LoginRestore>> restoreLogins(List<Login> logins) async {
    List<LoginRestore> failedLogins = [];
    for (var login in logins) {
      if (login.id != null) {
        try {
          var dbLogin = await getLogin(id: login.id!);

          // Check the two instance of Login are the same or not
          // If it is not the same, then update the login
          if (dbLogin != login) {
            // Check the create & update timestamp for to get the latest
            if (dbLogin.updatedAt != null) {
              if (dbLogin.updatedAt!.isBefore(login.updatedAt!)) {
                // Update the login
                try {
                  await putLogin(id: login.id!, data: login);
                } catch (e) {
                  // Update Crash, return false
                  failedLogins.add(LoginRestore(
                    login: login,
                    isRestored: false,
                    isFailed: true,
                    failedReason: e.toString(),
                    isNewerVersionPresentInDB: false,
                  ));
                }
              }
            } else {
              failedLogins.add(LoginRestore(
                login: login,
                isRestored: false,
                isFailed: false,
                failedReason: null,
                isNewerVersionPresentInDB: true,
              ));
            }
          }
        } catch (e) {
          // Login not found, post a login to save
          try {
            await postLogin(data: login);
            failedLogins.add(LoginRestore(
              login: login,
              isRestored: true,
              isFailed: false,
              failedReason: null,
              isNewerVersionPresentInDB: false,
            ));
          } catch (e) {
            // Update Crash, return false
            failedLogins.add(LoginRestore(
              login: login,
              isRestored: false,
              isFailed: true,
              failedReason: e.toString(),
              isNewerVersionPresentInDB: false,
            ));
          }
        }
      } else {
        // Create a new login
        try {
          await postLogin(data: login);
          failedLogins.add(LoginRestore(
            login: login,
            isRestored: true,
            isFailed: false,
            failedReason: null,
            isNewerVersionPresentInDB: false,
          ));
        } catch (e) {
          // Update Crash, return false
          failedLogins.add(LoginRestore(
            login: login,
            isRestored: false,
            isFailed: true,
            failedReason: e.toString(),
            isNewerVersionPresentInDB: false,
          ));
        }
      }
    }

    return failedLogins;
  }

  // returns all the identity cards which are failed to be restored
  Future<List<IdentityCardRestore>> restoreIdentityCards(
      List<IdentityCard> ids) async {
    List<IdentityCardRestore> failedIds = [];
    for (var id in ids) {
      if (id.id != null) {
        try {
          var dbId = await getIdentityCard(id: id.id!);

          // Check the two instance of identity card are the same or not
          // If it is not the same, then update the identity card
          if (dbId != id) {
            // Check the create & update timestamp for to get the latest
            if (dbId.updatedAt != null) {
              if (dbId.updatedAt!.isBefore(id.updatedAt!)) {
                // Update the identity card
                try {
                  await putIdentityCard(id: id.id!, data: id);
                } catch (e) {
                  // Update Crash, return false
                  failedIds.add(IdentityCardRestore(
                    id: id,
                    isRestored: false,
                    isFailed: true,
                    failedReason: e.toString(),
                    isNewerVersionPresentInDB: false,
                  ));
                }
              }
            } else {
              failedIds.add(IdentityCardRestore(
                id: id,
                isRestored: false,
                isFailed: false,
                failedReason: null,
                isNewerVersionPresentInDB: true,
              ));
            }
          }
        } catch (e) {
          // Login not found, post a identity card to save
          try {
            await postIdentityCard(data: id);
            failedIds.add(IdentityCardRestore(
              id: id,
              isRestored: true,
              isFailed: false,
              failedReason: null,
              isNewerVersionPresentInDB: false,
            ));
          } catch (e) {
            // Update Crash, return false
            failedIds.add(IdentityCardRestore(
              id: id,
              isRestored: false,
              isFailed: true,
              failedReason: e.toString(),
              isNewerVersionPresentInDB: false,
            ));
          }
        }
      } else {
        // Create a new identity card
        try {
          await postIdentityCard(data: id);
          failedIds.add(IdentityCardRestore(
            id: id,
            isRestored: true,
            isFailed: false,
            failedReason: null,
            isNewerVersionPresentInDB: false,
          ));
        } catch (e) {
          // Update Crash, return false
          failedIds.add(IdentityCardRestore(
            id: id,
            isRestored: false,
            isFailed: true,
            failedReason: e.toString(),
            isNewerVersionPresentInDB: false,
          ));
        }
      }
    }

    return failedIds;
  }

  // returns all the financial cards which are failed to be restored
  Future<List<FinancialCardRestore>> restoreFinancialCards(
      List<FinancialCard> cards) async {
    List<FinancialCardRestore> failedCards = [];
    for (var card in cards) {
      if (card.id != null) {
        try {
          var dbCard = await getFinancialCard(id: card.id!);

          // Check the two instance of financial card are the same or not
          // If it is not the same, then update the financial card
          if (dbCard != card) {
            // Check the create & update timestamp for to get the latest
            if (dbCard.updatedAt != null) {
              if (dbCard.updatedAt!.isBefore(card.updatedAt!)) {
                // Update the financial card
                try {
                  await putFinancialCard(id: card.id!, data: card);
                } catch (e) {
                  // Update Crash, return false
                  failedCards.add(FinancialCardRestore(
                    card: card,
                    isRestored: false,
                    isFailed: true,
                    failedReason: e.toString(),
                    isNewerVersionPresentInDB: false,
                  ));
                }
              }
            } else {
              failedCards.add(FinancialCardRestore(
                card: card,
                isRestored: false,
                isFailed: false,
                failedReason: null,
                isNewerVersionPresentInDB: true,
              ));
            }
          }
        } catch (e) {
          // Login not found, post a financial card to save
          try {
            await postFinancialCard(data: card);
            failedCards.add(FinancialCardRestore(
              card: card,
              isRestored: true,
              isFailed: false,
              failedReason: null,
              isNewerVersionPresentInDB: false,
            ));
          } catch (e) {
            // Update Crash, return false
            failedCards.add(FinancialCardRestore(
              card: card,
              isRestored: false,
              isFailed: true,
              failedReason: e.toString(),
              isNewerVersionPresentInDB: false,
            ));
          }
        }
      } else {
        // Create a new financial card
        try {
          await postFinancialCard(data: card);
          failedCards.add(FinancialCardRestore(
            card: card,
            isRestored: true,
            isFailed: false,
            failedReason: null,
            isNewerVersionPresentInDB: false,
          ));
        } catch (e) {
          // Update Crash, return false
          failedCards.add(FinancialCardRestore(
            card: card,
            isRestored: false,
            isFailed: true,
            failedReason: e.toString(),
            isNewerVersionPresentInDB: false,
          ));
        }
      }
    }

    return failedCards;
  }

  // returns all the notes which are failed to be restored
  Future<List<NoteRestore>> restoreNotes(List<Note> notes) async {
    List<NoteRestore> failedNotes = [];
    for (var note in notes) {
      if (note.id != null) {
        try {
          var dbNote = await getNote(id: note.id!);

          // Check the two instance of note are the same or not
          // If it is not the same, then update the note
          if (dbNote != note) {
            // Check the create & update timestamp for to get the latest
            if (dbNote.updatedAt != null) {
              if (dbNote.updatedAt!.isBefore(note.updatedAt!)) {
                // Update the note
                try {
                  await putNote(id: note.id!, data: note);
                } catch (e) {
                  // Update Crash, return false
                  failedNotes.add(NoteRestore(
                    note: note,
                    isRestored: false,
                    isFailed: true,
                    failedReason: e.toString(),
                    isNewerVersionPresentInDB: false,
                  ));
                }
              }
            } else {
              failedNotes.add(NoteRestore(
                note: note,
                isRestored: false,
                isFailed: false,
                failedReason: null,
                isNewerVersionPresentInDB: true,
              ));
            }
          }
        } catch (e) {
          // Login not found, post a note to save
          try {
            await postNote(data: note);
            failedNotes.add(NoteRestore(
              note: note,
              isRestored: true,
              isFailed: false,
              failedReason: null,
              isNewerVersionPresentInDB: false,
            ));
          } catch (e) {
            // Update Crash, return false
            failedNotes.add(NoteRestore(
              note: note,
              isRestored: false,
              isFailed: true,
              failedReason: e.toString(),
              isNewerVersionPresentInDB: false,
            ));
          }
        }
      } else {
        // Create a new note
        try {
          await postNote(data: note);
          failedNotes.add(NoteRestore(
            note: note,
            isRestored: true,
            isFailed: false,
            failedReason: null,
            isNewerVersionPresentInDB: false,
          ));
        } catch (e) {
          // Update Crash, return false
          failedNotes.add(NoteRestore(
            note: note,
            isRestored: false,
            isFailed: true,
            failedReason: e.toString(),
            isNewerVersionPresentInDB: false,
          ));
        }
      }
    }

    return failedNotes;
  }
}
