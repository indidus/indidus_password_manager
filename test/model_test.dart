import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:indidus_password_manager/src/lib/model.dart';
import 'package:indidus_password_manager/src/rust/models/financial_cards.dart';
import 'package:indidus_password_manager/src/rust/models/identity_cards.dart';
import 'package:indidus_password_manager/src/rust/models/logins.dart';
import 'package:indidus_password_manager/src/rust/models/notes.dart';

void main() {
  group('fromModel & toJson', () {
    test('Sould convert into JSON string', () {
      // arrange
      var model = Models(
        cards: [
          // All the fields
          FinancialCard(
            id: '1234567890123456',
            createdAt: DateTime.now(),
            createdBy: 'JHON_DOE',
            updatedAt: DateTime.now(),
            updatedBy: 'JHON_DOE',
            name: 'Card 1',
            cardNumber: '1234567890123456',
            cvv: '123',
            cardHolderName: 'John Doe',
            expiryDate: '12/20',
          ),
          // Only required fields
          const FinancialCard(
            name: 'Card 2',
            cardNumber: '12345678901234561',
            cardHolderName: 'John Doe1',
          ),
          // Random fields
          FinancialCard(
            id: '1234567890123456',
            createdAt: DateTime.now(),
            createdBy: 'JHON_DON',
            name: 'Card 3',
            cardNumber: '12345678901234562',
            cardHolderName: 'John Doe2',
          ),
        ],
        notes: [
          Note(
            id: '1234567890123456',
            createdAt: DateTime.now(),
            createdBy: 'JHON_DOE',
            updatedAt: DateTime.now(),
            updatedBy: 'JHON_DOE',
            name: 'Note 1',
            note: 'This is a note',
          ),
          const Note(
            name: 'Note 2',
          ),
          Note(
            id: '1234567890123456',
            createdAt: DateTime.now(),
            createdBy: 'JHON_DOE',
            name: 'Note 3',
            note: 'This is a note',
          ),
        ],
        logins: [
          Login(
            id: '1234567890123456',
            createdAt: DateTime.now(),
            createdBy: 'JHON_DOE',
            updatedAt: DateTime.now(),
            updatedBy: 'JHON_DOE',
            name: 'Login 1',
            username: 'john_doe',
            password: '1234567890123456',
            note: 'This is a note',
            passwordHint: 'This is a hint',
            url: 'http://example.com',
          ),
          const Login(
            name: 'name',
            username: 'username',
          ),
          Login(
            id: '1234567890123456',
            createdAt: DateTime.now(),
            createdBy: 'JHON_DOE',
            name: 'Login 3',
            username: 'john_doe',
            password: '1234567890123456',
          ),
        ],
        ids: [
          IdentityCard(
            id: '1234567890123456',
            createdAt: DateTime.now(),
            createdBy: 'JHON_DOE',
            updatedAt: DateTime.now(),
            updatedBy: 'JHON_DOE',
            name: 'ID 1',
            identityCardNumber: '1234567890123456',
            identityCardType: 'ID',
            nameOnCard: 'John Doe',
            country: 'India',
            issueDate: '12/20',
            expiryDate: '12/29',
            state: 'Karnataka',
          ),
          const IdentityCard(
            name: 'ID 2',
            identityCardNumber: '12345678901234561',
            nameOnCard: 'John Doe1',
          ),
          IdentityCard(
            id: '1234567890123456',
            createdAt: DateTime.now(),
            createdBy: 'JHON_DOE',
            name: 'ID 3',
            identityCardNumber: '12345678901234562',
            nameOnCard: 'John Doe2',
          ),
        ],
      );

      // act
      final json = model.toJson();
      expect(json.runtimeType, String);
      expect(json, isA<String>());

      // assert
      const jsonCodec = JsonCodec();
      var result = jsonCodec.decode(json);
      expect(result['cards'].first['name'], 'Card 1');
      expect(result['cards'].first['card_number'], '1234567890123456');
      expect(result['cards'].first['cvv'], '123');
      expect(result['cards'].first['card_holder_name'], 'John Doe');
      expect(result['cards'].first['expiry_date'], '12/20');

      final jsonModel = Models.fromJson(json);

      expect(model == jsonModel, true);

      // Match the original model with the jsonModel
      expect(jsonModel.cards, isA<List<FinancialCard>>());
      expect(jsonModel.cards.length, model.cards.length);
      expect(jsonModel.cards[0].name, model.cards[0].name);
      expect(jsonModel.cards[0].cardNumber, model.cards[0].cardNumber);
      expect(jsonModel.cards[0].cvv, model.cards[0].cvv);
      expect(jsonModel.cards[0].cardHolderName, model.cards[0].cardHolderName);
      expect(jsonModel.cards[0].expiryDate, model.cards[0].expiryDate);
      expect(jsonModel.cards[1].cardHolderName, model.cards[1].cardHolderName);
      expect(jsonModel.cards[1].cardNumber, model.cards[1].cardNumber);
      expect(jsonModel.cards[1].name, model.cards[1].name);
      expect(jsonModel.cards[1].cvv, model.cards[1].cvv);
      expect(jsonModel.cards[1].expiryDate, model.cards[1].expiryDate);
      expect(jsonModel.cards[2].cardHolderName, model.cards[2].cardHolderName);
      expect(jsonModel.cards[2].cardNumber, model.cards[2].cardNumber);
      expect(jsonModel.cards[2].name, model.cards[2].name);
      expect(jsonModel.cards[2].cvv, model.cards[2].cvv);
      expect(jsonModel.cards[2].expiryDate, model.cards[2].expiryDate);
    });
  });
}
