part of '../../shared.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final bool isEnabled;
  final bool isLoading;
  const CustomButtonWidget({
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.isEnabled = true,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = AppColors.primaryColor;
    return SizedBox(
      width: width ?? 150,
      height: height ?? 50,
      child: FloatingActionButton(
        elevation: 0.0,
        onPressed: isEnabled ? onPressed : null,
        isExtended: false,
        backgroundColor: primaryColor,
        splashColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: isLoading ? const CustomLoading() : child,
      ),
    );
  }
}
