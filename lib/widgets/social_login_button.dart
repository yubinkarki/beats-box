import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart' show SvgPicture;

import 'package:beats_box/constants/constants_barrel.dart' show AppSizes;

class SocialLoginButton extends StatelessWidget {
  final String? buttonIcon;
  final String? buttonText;
  final Color? buttonColor;
  final TextTheme textTheme;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.onPressed,
    required this.textTheme,
    required this.buttonText,
    required this.buttonIcon,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor ?? Colors.black),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.s16)),
        ),
      ),
      child: SizedBox(
        height: AppSizes.s44,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: SvgPicture.asset(buttonIcon!)),
            const SizedBox(width: AppSizes.s14),
            Text(buttonText!, style: textTheme.labelSmall)
          ],
        ),
      ),
    );
  }
}
