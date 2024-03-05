part of '../../authentication.dart';

class LoginBackgroundWrapper extends StatelessWidget {
  final Widget child;
  const LoginBackgroundWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(.5),
          ],
        ),
      ),
      child: child,
    );
  }
}
