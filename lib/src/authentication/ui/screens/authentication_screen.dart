part of '../../authentication.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FractionallySizedBox(
            widthFactor: .9,
            heightFactor: .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: AppColors.red,
                ),
                CustomButtonWidget(
                  width: double.infinity,
                  child: Text('Começar'),
                  onPressed: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   AppRoutes.loginScreen,
                    // );
                  },
                ),
                CustomButtonWidget(
                  child: Text('Login'),
                  onPressed: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   AppRoutes.loginScreen,
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
