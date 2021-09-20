import 'package:app_base_flutter2_getx/app/helpers/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImageView extends StatelessWidget {
  final ImageProvider imageProvider;

  const FullScreenImageView({required this.imageProvider});

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
          Container(
            width: double.infinity,
            height: responsive.hp(90),
            child: Center(
              child: PhotoView(
                  imageProvider: this.imageProvider,
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
            left: 10,
            top: 10,
            child: SafeArea(
              child: CupertinoButton(
                color: Colors.white70,
                padding: EdgeInsets.all(10),
                borderRadius: BorderRadius.circular(30),
                child: Icon(Icons.arrow_back),
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
