import 'package:flutter_test/flutter_test.dart';
import 'package:indidus_password_manager/src/lib/storage.dart';
import 'package:indidus_password_manager/src/rust/frb_generated.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await RustLib.init();
  });
  // testWidgets('Can call rust function', (WidgetTester tester) async {
  //   await tester.pumpWidget(const MyApp());
  //   expect(find.textContaining('Result: `Hello, Tom!`'), findsOneWidget);
  // });

  testWidgets('SecureStorage', (WidgetTester tester) async {
    await SecureStorage.init();
    var dataList = [
      MyData(
        0,
        'Hello! Cześć! 你好! ご挨拶！Привет! ℌ𝔢𝔩𝔩𝔬! 🅗🅔🅛🅛🅞!',
      ),
      MyData(
        1,
        'Some other data',
      ),
      MyData(
        2,
        'Benjamin Franklin said: "In this world nothing can be said to be certain, except death and taxes."',
      ),
      MyData(
        3,
        'The quick brown fox jumps over the lazy dog',
      ),
      MyData(
        4,
        '1234567890',
      ),
      MyData(
        5,
        'बेंजामिन फ्रैंकलिन ने कहा: "इस दुनिया में मृत्यु और करों को छोड़कर कुछ भी निश्चित नहीं कहा जा सकता है।"',
      ),
      MyData(
        6,
        'বেঞ্জামিন ফ্র্যাঙ্কলিন বলেছিলেন: "এই পৃথিবীতে মৃত্যু এবং কর ছাড়া কিছুই নিশ্চিত বলা যায় না।"',
      ),
      MyData(
        7,
        'Benjamin Franklin disse: “Neste mundo nada pode ser considerado certo, exceto a morte e os impostos”.',
      ),
      MyData(
        8,
        'قال بنجامين فرانكلين: "في هذا العالم لا يوجد شيء مؤكد، باستثناء الموت والضرائب".',
      ),
      MyData(
        9,
        'Benjamin Franklin jupax akham sänwa: “Aka pachanx janiw kunas chiqaw sañjamäkiti, jan ukasti jiwañampi ukat impuestonakampikiw sañjamäkiti” sasa.',
      ),
      MyData(
        10,
        'Benjamin Franklin a spus: „În această lume, nimic nu poate fi spus sigur, cu excepția morții și a impozitelor”.',
      ),
      MyData(
        11,
        'ベンジャミン・フランクリンは「この世では、死と税金以外に確かなことは何もない」と言いました。',
      ),
      MyData(
        12,
        'Benjamin Franklin bin se: "Insay dis wɔl, dɛn nɔ go se natin fɔ tru, pas day ɛn taks."',
      ),
      MyData(
        13,
        'பெஞ்சமின் ஃபிராங்க்ளின் கூறினார்: "இந்த உலகில் மரணம் மற்றும் வரிகளைத் தவிர வேறு எதையும் உறுதியாகக் கூற முடியாது."',
      ),
      MyData(
        14,
        'ബെഞ്ചമിൻ ഫ്രാങ്ക്ലിൻ പറഞ്ഞു: "ഈ ലോകത്ത് മരണവും നികുതിയും ഒഴികെ മറ്റൊന്നും ഉറപ്പില്ല."',
      ),
      MyData(
        15,
        'Benjamin Franklin zei: "In deze wereld kan niets zeker zijn, behalve de dood en belastingen."',
      ),
      MyData(
        16,
        'Бенджамин Франклин сказал: "В этом мире ничего нельзя сказать наверняка, кроме смерти и налогов".',
      ),
      MyData(
        17,
        'Benjamin Franklin sanoi: "Tässä maailmassa mikään ei voi olla varmaa, paitsi kuolema ja verot".',
      ),
      MyData(
        18,
        'בנימין פרנקלין אמר: "בעולם הזה אין דבר כל כך בטוח, חוץ ממוות ומסים".',
      ),
      MyData(
        19,
        'Benjamin Franklin گفت: "در این دنیا هیچ چیز مطمئن نیست، به جز مرگ و م  ',
      ),
      MyData(
        20,
        '😂🍏',
      ),
    ];
    for (var data in dataList) {
      var encryptedData = await SecureStorage.encrypt(data.data);
      expect(encryptedData == null, false);
      final decryptedData =
          await SecureStorage.decrypt(encryptedData as String);
      expect(decryptedData, data.data);
    }
    await MyDatabaseHelper.insertAllData(dataList);
    var dbData = await MyDatabaseHelper.getData();
    for (var i = 0; i < dataList.length; i++) {
      expect(dataList[i].data, dbData[i].data);
    }
  });

  tearDownAll(() async {
    await MyDatabaseHelper.dropDatabase();
  });
}

class MyData {
  final int id;
  final String data;

  MyData(this.id, this.data);

  Future<Map<String, dynamic>> toMap() async => {
        'id': id,
        'data': await SecureStorage.encrypt(data),
      };

  static Future<MyData> fromMap(Map<String, dynamic> data) async => MyData(
        data["id"] as int,
        (await SecureStorage.decrypt(data["data"] as String))!,
      );
}

class MyDatabaseHelper {
  static Database? _db;
  static String _dbPath = "";

  static Future<Database> get db async {
    _db ??= await initializeDatabase();
    return _db!;
  }

  static dropDatabase() async {
    _db = null;
    await deleteDatabase(_dbPath);
  }

  static Future<Database> initializeDatabase() async {
    String path =
        await getApplicationDocumentsDirectory().then((dir) => dir.path);
    _dbPath = "$path/my_database.db";

    // Create the database and the table if it doesn't exist
    Database database = await openDatabase(
      _dbPath,
      version: 1,
      onCreate: (Database db, int version) =>
          db.execute("CREATE TABLE MyData(id INTEGER PRIMARY KEY, data TEXT)"),
    );
    return database;
  }

  static Future<bool> insertAllData(List<MyData> dataList) async {
    for (var data in dataList) {
      await insertData(data);
    }
    return true;
  }

  static Future<void> insertData(MyData data) async {
    Database db = await MyDatabaseHelper.db;
    await db.insert("MyData", await data.toMap());
  }

  static Future<List<MyData>> getData() async {
    Database db = await MyDatabaseHelper.db;
    List<Map<String, dynamic>> maps = await db.query(
      "MyData",
      orderBy: "id ASC",
    );
    List<MyData> finalData = [];
    for (var map in maps) {
      finalData.add(await MyData.fromMap(map));
    }
    return finalData;
  }
}
