import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersStates> {
  UsersCubit() : super(UsersInitialState());

  UsersCubit get(context) => BlocProvider.of<UsersCubit>(context);

  void InitializeUsersDatabase() {
    emit(UsersDatabaseCreated());
    openUsersDatabase();
    debugPrint('UsersDatabaseInitialized');
  }

  late Database database;

  void openUsersDatabase() async {
    await openDatabase('users.db', version: 1,
        onCreate: (Database db, version) async {
      db.execute('CREATE TABLE users (id INTEGER PRIMARY KEY,name TEXT) ');
      debugPrint('UsersTableCreated');
    }, onOpen: (db) {
      database = db;
      debugPrint('databaseOpened');
      emit(UsersDatabaseOpened());
      getDatabase();
    });
  }

  TextEditingController nameEditingController = TextEditingController();

  void insertDatabase() {
    if (selectedUser.isNotEmpty) {
      updateUserData();
    } else {
      database.transaction((txn) async {
        txn.rawInsert(
            'INSERT INTO users(name)VALUES("${nameEditingController.text}")');
      }).then((value) {
        nameEditingController.clear();
        getDatabase();
        emit(UsersDatabaseInserted());
      });
    }
  }

  List<Map> users = [];

  void getDatabase() {
    emit(LoadingUsersDatabase());
    database.rawQuery('SELECT * FROM users').then((value) {
      users = value;
      debugPrint(users.toString());
      emit(UsersDatabaseFetched());
    });
  }

  Map selectedUser = {};

  void selectedUserToUpdate({required Map user}) {
    selectedUser = user;
    nameEditingController.text = selectedUser['name'];
    emit(AppSelectedUser());
  }

  void updateUserData() {
    database.rawUpdate(
        'UPDATE users SET name =? WHERE id =${selectedUser['id']}',
        [nameEditingController.text]).then((value) {
      selectedUser = {};
      nameEditingController.clear();
      getDatabase();
      debugPrint('data updated');
    });
  }
}
