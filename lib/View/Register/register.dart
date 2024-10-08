import 'package:mobileii/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:mobileii/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:mobileii/DesignSystem/Components/InputField/input_text.dart';
import 'package:mobileii/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:mobileii/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:mobileii/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:mobileii/View/Login/login.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isAgreed = false; // Variável para o Checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/LogoPlaceholder.png',
                  width: 148,
                  height: 148,
                ),
              ),
              const SizedBox(height: 64),
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
              const SizedBox(height: 16),
              Row(
                children: [
                    Transform.scale(
                    scale: 1.2, // Aumenta o tamanho do checkbox
                    child: Checkbox(
                      value: _isAgreed,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      ),
                      activeColor: Colors.black,
                      onChanged: (bool? value) {
                      setState(() {
                        _isAgreed = value!;
                      });
                      },
                    ),
                    ),
                  Expanded(
                    child: LinkedLabel.instantiate(
                      viewModel: LinkedLabelViewModel(
                        fullText: "I have read and agree Terms & Services",
                        linkedText: "Terms & Services",
                        onLinkTap: () {},
                        ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ActionButton.instantiate(
                  viewModel: ActionButtonViewModel(
                    size: ActionButtonSize.large,
                    style: ActionButtonStyle.primary,
                    text: 'Sign up',
                    onPressed: _isAgreed
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()),
                            );
                          }
                        : () {},
                  ),
                ),
              ),
              const SizedBox(height: 70),
              const Text(
                "Already Have An Account?",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: ActionButtonSize.small,
                  style: ActionButtonStyle.primary,
                  text: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
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
