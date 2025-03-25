import 'package:stacked/stacked.dart';

class LoginRegisterViewModel extends BaseViewModel {
  bool _showLoginPage = true;

  bool get showLoginPage => _showLoginPage;

  void togglePage() {
    _showLoginPage = !_showLoginPage;
    notifyListeners();
  }
}
