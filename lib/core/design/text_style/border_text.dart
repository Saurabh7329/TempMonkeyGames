import 'package:flutter/cupertino.dart';

class BorderText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color borderColor;
  const BorderText(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: textStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = borderColor,
          ),
        ),
        Text(text, style: textStyle),
      ],
    );
  }
}
