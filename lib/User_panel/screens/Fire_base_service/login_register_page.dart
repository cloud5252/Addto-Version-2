import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../login/login_page.dart';
import '../register/register_page.dart';
import 'login_register_viewmodel.dart';

class LoginRegisterPage extends StackedView<LoginRegisterViewModel> {
  const LoginRegisterPage({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginRegisterViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.showLoginPage
        ? LoginPage(onTap: viewModel.togglePage)
        : RegisterPage(onTap: viewModel.togglePage);
  }

  @override
  LoginRegisterViewModel viewModelBuilder(BuildContext context) =>
      LoginRegisterViewModel();
}
