part of '../../authentication.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: TextEditingController(),
            labelText: 'Email',
          ),
          CustomTextFormField(
            controller: TextEditingController(),
            labelText: 'Senha',
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
