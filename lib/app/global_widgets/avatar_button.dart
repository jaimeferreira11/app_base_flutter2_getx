// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:app_base_flutter2_getx/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarButton extends StatelessWidget {
  final double? imageSize;
  final VoidCallback? onPressed;
  final String? url;
  final String? path;
  final bool editar;
  AvatarButton(
      {Key? key,
      this.imageSize = 100,
      this.url,
      this.path,
      this.onPressed,
      this.editar = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black26,
                  offset: Offset(5, 15),
                ),
              ],
            ),
            child: ClipOval(
                child: path == null
                    ? CachedNetworkImage(
                        imageUrl: url ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTJLquHluAWETjCNVAvbPMLh1Msk879xChiuQ&usqp=CAU',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/images/no-image.jpg'),
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                      )
                    : Image(
                        image: AssetImage(path!),
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                      ))),
        Visibility(
          visible: editar,
          child: Positioned(
            bottom: 5,
            right: 0,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  color: AppColors.accentColor,
                  shape: BoxShape.circle,
                ),
              ),
              onPressed: onPressed,
            ),
          ),
        )
      ],
    );
  }
}
