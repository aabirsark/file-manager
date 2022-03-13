import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            InteractiveViewer(
                maxScale: 5,
                child: Center(
                  child:
                      Hero(tag: widget.path, child: Image.asset(widget.path)),
                )),
            ClipRRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              CupertinoIcons.left_chevron,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Image Preview",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                    color: Colors.black.withOpacity(0.5),
                    height: 60,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
