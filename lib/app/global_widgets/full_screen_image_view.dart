import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../helpers/responsive.dart';

class FullScreenImageView extends StatelessWidget {
  final ImageProvider imageProvider;

  const FullScreenImageView({
    Key? key,
    required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: responsive.hp(90),
            child: Center(
              child: PhotoView(
                  imageProvider: imageProvider,
                  loadingBuilder: (context, event) {
                    if (event == null) {
                      return Center(
                        child: Image.asset('assets/images/loader.gif'),
                      );
                    }
                    return Container();
                  }),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: SafeArea(
              child: CupertinoButton(
                color: Colors.white70,
                padding: const EdgeInsets.all(10),
                borderRadius: BorderRadius.circular(30),
                child: const Icon(
                  FontAwesomeIcons.times,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
