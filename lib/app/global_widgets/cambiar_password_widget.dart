import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../helpers/responsive.dart';
import '../modules/home/home_controller.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class CambiarPasswordWidget extends GetView<HomeController> {
  const CambiarPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return GetBuilder<HomeController>(
        id: 'changePass',
        builder: (_) => Container(
              margin: EdgeInsets.symmetric(vertical: responsive.hp(4)),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  Obx(() => Visibility(
                      visible: controller.errorPass.value.isNotEmpty,
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 0.0, left: 20.0, right: 20.0, bottom: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            controller.errorPass.value,
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ))),
                  Obx(() => Container(
                      margin: const EdgeInsets.only(
                          top: 8.0, bottom: 20.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: controller.mapControllers["oldPassword"],
                        focusNode: controller.mapFocusNodes["oldPassword"],
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        obscureText: !controller.passwordVisible1,
                        autocorrect: false,
                        onChanged: (value) {
                          controller.oldPassword = value;
                        },
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: responsive.dp(1.8),
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                controller.passwordVisible1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable

                                controller.passwordVisible1 =
                                    !controller.passwordVisible1;
                                controller.update(['changePass']);
                              }),
                          hintText: "Toque aquí para escribir.",
                          labelText: "Contraseña actual",
                          hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                            fontSize: responsive.dp(1.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: controller.errorPass.value.length == 0
                                  ? Colors.grey
                                  : Colors.red,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: controller.errorPass.value.length == 0
                                  ? AppColors.inputColor
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ))),
                  /* Input 2 */

                  Obx(() => Container(
                      margin: EdgeInsets.only(
                          top: 8.0, bottom: 20.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: controller.mapControllers["newPassword"],
                        focusNode: controller.mapFocusNodes["newPassword"],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        obscureText: !controller.passwordVisible2,
                        autocorrect: false,
                        onChanged: (value) {
                          controller.newPassword = value;
                        },
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: responsive.dp(1.8),
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                controller.passwordVisible2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable

                                controller.passwordVisible2 =
                                    !controller.passwordVisible2;
                                controller.update(['changePass']);
                              }),
                          hintText: "Toque aquí para escribir.",
                          labelText: "Nueva contraseña",
                          hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                            fontSize: responsive.dp(1.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: controller.errorPass.value.length == 0
                                  ? Colors.grey
                                  : Colors.red,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: controller.errorPass.value.length == 0
                                  ? AppColors.inputColor
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ))),
                  /* Input 3 */

                  Obx(() => Container(
                      margin: EdgeInsets.only(
                          top: 8.0, bottom: 0.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller:
                            controller.mapControllers["repeatNewPassword"],
                        focusNode:
                            controller.mapFocusNodes["repeatNewPassword"],
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        obscureText: !controller.passwordVisible3,
                        autocorrect: false,
                        onChanged: (value) {
                          controller.repeatNewPassword = value;
                        },
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontSize: responsive.dp(1.8),
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                controller.passwordVisible3
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable

                                controller.passwordVisible3 =
                                    !controller.passwordVisible3;
                                controller.update(['changePass']);
                              }),
                          hintText: "Toque aquí para escribir.",
                          labelText: "Repita nueva contraseña",
                          hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                            fontSize: responsive.dp(1.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: controller.errorPass.value.length == 0
                                  ? Colors.grey
                                  : Colors.red,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: controller.errorPass.value.length == 0
                                  ? AppColors.inputColor
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ))),

                  /* Botones */

                  Obx(
                    () => controller.ignore.value
                        ? Container(
                            width: double.infinity,
                            height: responsive.hp(7),
                            margin: EdgeInsets.symmetric(
                                vertical: responsive.hp(4),
                                horizontal: responsive.wp(5)),
                            child: MaterialButton(
                              onPressed: null,
                              child: SpinKitWave(
                                color: AppColors.primaryColor,
                                type: SpinKitWaveType.end,
                                size: responsive.dp(1.8),
                              ),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(
                                vertical: responsive.hp(4),
                                horizontal: responsive.wp(5)),
                            alignment: Alignment.center,
                            child: MaterialButton(
                              elevation: 5.0,
                              color: AppColors.primaryColor,
                              shape: StadiumBorder(),
                              onPressed: () => _.cambiarPass(),
                              child: Container(
                                width: double.infinity,
                                height: responsive.hp(7),
                                color: Colors.transparent,
                                child: Center(
                                  child: Text(
                                    'Cambiar contraseña',
                                    style: AppFonts.secondaryFont.copyWith(
                                        letterSpacing: 1.5,
                                        color: Colors.white,
                                        fontSize: responsive.dp(1.8),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ));
  }
}
