import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/home/view/local_widgets/connection_a_dialog_box_widget.dart';
import 'package:freeplay/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DynamicImageView extends StatefulWidget {
  final String? imageUrl;
  final String? actionLink;
  final LaunchMode? launchMode;

  DynamicImageView({required this.imageUrl, required this.actionLink, required this.launchMode});

  @override
  State<DynamicImageView> createState() => _DynamicImageViewState();
}

class _DynamicImageViewState extends State<DynamicImageView> {
  bool _isVisible = true;
  Future<Size> _getImageSize(String? url) async {
    final Completer<Size> completer = Completer();
    final Image image = Image.network(url!);
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(
            Size(info.image.width.toDouble(), info.image.height.toDouble()));
      }),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Size>(
      future: _getImageSize(widget.imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final imageSize = snapshot.data!;
          return LayoutBuilder(
            builder: (context, constraints) {
              final imageWidth = imageSize.width;
              final imageHeight = imageSize.height;
              final screenWidth = constraints.maxWidth;
              final screenHeight = constraints.maxHeight;
              final maxHeight = screenHeight / 2;

              final scale = (imageWidth / screenWidth > imageHeight / maxHeight)
                  ? screenWidth / imageWidth
                  : maxHeight / imageHeight;

              final adjustedWidth = imageWidth * scale;
              final adjustedHeight = MediaQuery.of(context).size.height / 10;

              return _isVisible
                  ? Stack(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (widget.actionLink!.contains("signup")) {
                              //redirect to sign up screen
                              context.router.push(SignUpViewRoute());
                            } else {
                              showRoundedDialog(context);
                              //add 5 second delay
                              Future.delayed(const Duration(seconds: 5),
                                  () async {
                                Navigator.pop(context);
                                final urlRedirect = widget.actionLink!;
                                openBrowser(urlRedirect);
                              });
                              // callLogApi(index);
                            }
                          },
                          child: Container(
                            width: adjustedWidth,
                            height: adjustedHeight,
                            child: Image.network(widget.imageUrl!,
                                fit: BoxFit.fill),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                _isVisible = false;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  : Container(); // Return an empty container when not visible
            },
          );
        }
      },
    );
  }

  void showRoundedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const DialogBoxForConnectionA();
      },
    );
  }
}
