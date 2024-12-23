import 'package:flutter/material.dart';
import 'package:mvvm_provider/feature/models/user_error.dart';
import 'package:mvvm_provider/feature/models/user_list_model.dart';
import 'package:mvvm_provider/feature/repo/api_status.dart';
import 'package:mvvm_provider/feature/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  // variables
  bool _loading = false;
  List<UserModel> _userListModel = [];

  UserError? _userError;
  UserModel? _selectedUser;
  UserModel? _addingUser = UserModel();

  // getters
  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel? get selectedUser => _selectedUser;
  UserModel? get addingUser => _addingUser;

  // constructor
  UsersViewModel() {
    getUsers();
  }

  // setters
  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    userListModel.sort((a, b) => a.address!.city!.compareTo(b.address!.city!));
    _userListModel = userListModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  // methods

  addUser() async {
    if (!isValid()) {
      return;
    }
    _userListModel.add(addingUser!);
    _userListModel.sort((a, b) => a.address!.city!.compareTo(b.address!.city!));
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser?.name == null || addingUser!.name!.isEmpty) {
      return false;
    }
    if (addingUser?.email == null || addingUser!.email!.isEmpty) {
      return false;
    }
    return true;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      await setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse.toString(),
      );

      setUserError(userError);
    }
    setLoading(false);
  }

  // sorting methods
  void sortByName() {
    userListModel.sort((a, b) => a.name!.compareTo(b.name!));
    notifyListeners();
  }

  void sortByCity() {
    userListModel.sort((a, b) => a.address!.city!.compareTo(b.address!.city!));
    notifyListeners();
  }
}
