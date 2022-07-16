import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsStates> {
  ContactsCubit() : super(ContactsInitialState());

  ContactsCubit get(context) => BlocProvider.of(context);

  late Database database;

  void openContactsDatabase() {
    openDatabase('Contacts.db', version: 1,
        onCreate: (Database db, int version) async {
      debugPrint('ContactsDatabaseCreated');
      emit(ContactsDatabaseCreated());
      await db
          .execute(
              'CREATE TABLE contacts (id INTEGER PRIMARY KEY ,name TEXT ,phone TEXT)')
          .then((value) => emit(ContactsTableCreated()));
    }, onOpen: (Database db) {
      database = db;
      debugPrint('ContactsDatabaseOpened');
      emit(ContactsDatabaseOpened());
      getContactsDatabase();
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void insertIntoContactsDatabase() async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO contacts (name,phone) VALUES ("${nameController.text}","${phoneController.text}")')
          .then((value) {
        nameController.clear();
        phoneController.clear();
        emit(ContactsDatabaseInserted());
      });
    });
  }

  List<Map> contacts = [];

  void getContactsDatabase() async {
    await database.rawQuery('SELECT * FROM contacts').then((value) {
      contacts = value;
      debugPrint('$contacts');
      emit(ContactsDatabaseFetched());
    });
  }

  Map selectedContact = {};

  void selectContact({required Map selected}) {
    selectedContact = selected;
    nameController.text = selected['name'];
    phoneController.text = selected['phone'];
  }

  void updateContactsDatabase() {
    database.rawUpdate(
      'UPDATE contacts SET name=? , phone=? WHERE id=${selectedContact['id']}',
      [nameController.text, phoneController.text],
    ).then((value) {
      selectedContact = {};
      nameController.clear();
      phoneController.clear();
      emit(ContactDataUpdated());
      debugPrint('Contact Data updated');
      getContactsDatabase();
    });
  }

  void deleteTable() {
    database.delete('contacts');
    getContactsDatabase();
    debugPrint('Table deleted');
    emit(DeletedState());
    getContactsDatabase();
  }

  void deleteContenct() {
    database
        .rawDelete('DELETE FROM contacts WHERE id=${selectedContact['id']}');
  }

  void clearControllers() {
    nameController.clear();
    phoneController.clear();
  }
}
