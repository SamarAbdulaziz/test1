part of 'contacts_cubit.dart';

@immutable
abstract class ContactsStates {}

class ContactsInitialState extends ContactsStates {}

class ContactsDatabaseCreated extends ContactsStates {}

class ContactsTableCreated extends ContactsStates {}

class ContactsDatabaseOpened extends ContactsStates {}

class ContactsDatabaseInserted extends ContactsStates {}

class ContactsDatabaseFetched extends ContactsStates {}

class ContactDataUpdated extends ContactsStates {}

class DeletedState extends ContactsStates {}

class LoadingState extends ContactsStates {}
