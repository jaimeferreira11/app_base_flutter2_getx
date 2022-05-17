import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../helpers/responsive.dart';
import '../../../theme/fonts.dart';
import '../registro_datos_controller.dart';

class Step2View extends StatelessWidget {
  const Step2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return GetBuilder<RegistroDatosController>(
        id: 'adjuntos',
        builder: (_) => ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceAround,
                  children: _.adjuntos
                      .map((e) => Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Stack(
                              children: [
                                Image.file(
                                  File(e.path),
                                  width: responsive.wp(80),
                                  height: responsive.hp(15),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: SafeArea(
                                    child: CupertinoButton(
                                      color: Colors.black38,
                                      padding: const EdgeInsets.all(1),
                                      borderRadius: BorderRadius.circular(30),
                                      child: Icon(
                                        FontAwesomeIcons.xmark,
                                        size: responsive.dp(2.5),
                                      ),
                                      onPressed: () {
                                        _.adjuntos.remove(e);
                                        _.update(['adjuntos']);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(height: responsive.hp(1)),
                Container(
                  margin: EdgeInsets.only(bottom: responsive.hp(0.3)),
                  child: Center(
                      child: Text(
                    '* Adjunte al menos 1 (una) imagen',
                    style: TextStyle(color: Colors.green.shade700),
                  )),
                ),
                MaterialButton(
                  elevation: 5.0,
                  color: Colors.blueGrey.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: () async {
                    final origen = await _.dialogSelectOrigen();
                    if (origen > 0) {
                      _.adjuntarCI(origen);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: responsive.hp(6),
                    color: Colors.transparent,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.images,
                            color: Colors.white,
                          ),
                          Text(
                            '   ADJUNTAR IMAGENES',
                            style: AppFonts.secondaryFont.copyWith(
                                letterSpacing: 1.5,
                                color: Colors.white,
                                fontSize: responsive.dp(1.5),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }
}
