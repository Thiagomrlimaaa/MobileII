import 'package:mobileii/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:mobileii/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:mobileii/DesignSystem/Components/InputField/input_text.dart';
import 'package:mobileii/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:mobileii/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:mobileii/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:mobileii/View/Register/register.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40), 
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/LogoPlaceholder.png',
                    width: 148,
                    height: 148,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              StyledInputField.instantiate(
                viewModel: InputTextViewModel(
                  controller: emailController,
                  placeholder: 'E-mail',
                  password: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Esse campo é obrigatório';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Formato de e-mail inválido!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              StyledInputField.instantiate(
                viewModel: InputTextViewModel(
                  controller: passwordController,
                  placeholder: 'Senha',
                  password: true,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Esse campo é obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: LinkedLabel.instantiate(
                  viewModel: LinkedLabelViewModel(
                    fullText: "Forgot password?",
                    linkedText: "Forgot password",
                    onLinkTap: () {
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ActionButton.instantiate(
                  viewModel: ActionButtonViewModel(
                    size: ActionButtonSize.large,
                    style: ActionButtonStyle.primary,
                    text: 'Login',
                    onPressed: () {
                    },
                  ),
                ),
              ),
              const SizedBox(height: 50), 
              const Text(
                "Don't Have An Account?",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: ActionButtonSize.small,
                  style: ActionButtonStyle.primary,
                  text: 'Sign Up',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const RegisterView(),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
