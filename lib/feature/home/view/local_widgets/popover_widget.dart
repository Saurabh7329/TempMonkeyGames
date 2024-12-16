
import 'package:flutter/material.dart';

class PopOverWidget extends StatefulWidget {
  final String contentText;

  PopOverWidget({required this.contentText});

  @override
  State<PopOverWidget> createState() => _PopOverWidgetState();
}

class _PopOverWidgetState extends State<PopOverWidget> {

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popover
                  },
                ),
              ),
              Center(
                child: Text(
                  widget.contentText,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
