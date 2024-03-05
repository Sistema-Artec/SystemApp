part of '../../authentication.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LoginButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      onPressed: onPressed,
      width: double.infinity,
      child: const Center(
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
