part of 'users_cubit.dart';

@immutable
abstract class UsersStates {}

class UsersInitialState extends UsersStates {}

class UsersDatabaseCreated extends UsersStates {}

class UsersTableCreated extends UsersStates {}

class UsersDatabaseOpened extends UsersStates {}

class UsersDatabaseInserted extends UsersStates {}

class LoadingUsersDatabase extends UsersStates {}

class UsersDatabaseFetched extends UsersStates {}

class AppSelectedUser extends UsersStates {}
