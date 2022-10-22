import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/responsive.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class CustomHomeItemWidget extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String title;
  final String route;
  final bool isVertical;
  final String descripcion;

  const CustomHomeItemWidget(
      {Key? key,
      required this.icon,
      this.color = AppColors.primaryColor,
      this.isVertical = true,
      this.descripcion = "",
      required this.title,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return _CardBackground(route: route, child: isVertical ? _column(responsive) : _row(responsive));
  }

  Widget _column(Responsive responsive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: responsive.dp(4),
          child: icon,
        ),
        SizedBox(height: responsive.hp(1.5)),
        FittedBox(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: responsive.wp(1.5)),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: responsive.dp(1.8)),
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Responsive responsive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: responsive.dp(4),
            child: icon,
          ),
          SizedBox(width: responsive.wp(2)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: responsive.wp(1.5)),
                    child: Text(
                      title,
                      style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: responsive.dp(2.1)),
                    ),
                  ),
                ),
                SizedBox(height: responsive.hp(1)),
                if (descripcion.isNotEmpty)
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: responsive.wp(1.5)),
                      child: Center(
                        child: Text(
                          descripcion,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.secondaryFont.copyWith(color: Colors.black54, fontSize: responsive.dp(1.8)),
                        ),
                      ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  final String route;

  const _CardBackground({Key? key, required this.route, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Container(
        margin: EdgeInsets.only(
            left: responsive.wp(3), right: responsive.wp(3), top: responsive.hp(1), bottom: responsive.hp(1)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 1.0), //(x,y)

              blurRadius: 6.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
