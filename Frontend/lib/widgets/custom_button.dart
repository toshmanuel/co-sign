import 'package:flutter/material.dart';
import '../utils/utils.dart';

void goBack(BuildContext context, {int count = 1}) {
  for (var i = 1; i <= count; i++) {
    Navigator.pop(context);
  }
}

typedef voidFunction = void Function();

class CustomButton extends StatelessWidget {
  final Text text;
  final double? height;
  final double? width;
  final voidFunction? onPressed;
  final RoundedRectangleBorder? shape;
  final bool loading;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    required this.height,
    required this.width,
    this.shape,
    this.loading = false,
  }) : super(key: key);

  handlePress() {
    if (!loading) {
      if (onPressed != null) {
        onPressed!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        child: text,
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor,
          padding: const EdgeInsets.fromLTRB(0, 3, 3, 3),
          minimumSize: const Size(70, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
