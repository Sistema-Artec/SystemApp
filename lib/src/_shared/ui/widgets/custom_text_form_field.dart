part of '../../shared.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isPasswordTextFormField;
  const CustomTextFormField({
    required this.labelText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.emailAddress,
    this.textInputAction = TextInputAction.next,
    this.isPasswordTextFormField = false,
    super.key,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final FocusNode _focusNode;
  late bool _obscureText;
  late final TextStyle _textStyle;
  late final TextStyle _labelStyle;

  final Color _primaryColor = AppColors.green;
  final Color _inputItemsColor = AppColors.green;
  final BorderRadius _borderRadius = BorderRadius.circular(100);
  final TextStyle _defaultTextStyle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    _initFocusNode();

    _obscureText = widget.isPasswordTextFormField;
    _textStyle = _defaultTextStyle.copyWith(
      color: _inputItemsColor,
    );
    _labelStyle = _defaultTextStyle.copyWith(
      color: _inputItemsColor.withOpacity(.5),
    );
  }

  @override
  void dispose() {
    _disposeFocus();
    super.dispose();
  }

  void _initFocusNode() {
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _disposeFocus() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      cursorColor: _primaryColor,
      obscureText: _obscureText,
      textAlign: TextAlign.justify,
      style: _textStyle.copyWith(
        fontSize: 14,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: _labelStyle,
        floatingLabelStyle: _labelStyle.copyWith(
          fontSize: 10,
        ),
        filled: true,
        border: UnderlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.red,
          ),
        ),
        suffixIcon: widget.isPasswordTextFormField
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: _inputItemsColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
