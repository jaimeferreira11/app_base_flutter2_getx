import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../global_widgets/custom_input.dart';
import '../../../helpers/responsive.dart';
import '../registro_datos_controller.dart';

class Step1View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return GetBuilder<RegistroDatosController>(
        builder: (_) => Form(
            key: _.form1Key,
            child: Column(
              children: [
                // InputSelectWidget(
                //   value: _.tipodoc,
                //   fontSize: responsive.dp(1.8),
                //   label: 'Tipo Documento',
                //   options: const ['CI', 'RUC', 'DNI', 'PASS'],
                //   onChanged: (text) {
                //     _.tipodoc = text;
                //   },
                // ),
                // SizedBox(height: responsive.hp(2)),
                CustomInput(
                  label: 'Numero de documento',
                  value: _.doc,
                  keyboardType: TextInputType.number,
                  fontSize: responsive.dp(1.8),
                  icon: FontAwesomeIcons.idCard,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El documento es requerido';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    _.doc = text.trim().replaceAll(" ", "");
                  },
                ),
                SizedBox(height: responsive.hp(2)),
                CustomInput(
                  label: 'Nombre',
                  value: _.nombre,
                  keyboardType: TextInputType.text,
                  fontSize: responsive.dp(1.8),
                  icon: FontAwesomeIcons.user,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El Nombre es requerido';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    _.nombre = text.trim();
                  },
                ),
                SizedBox(height: responsive.hp(2)),
                CustomInput(
                  label: 'Apellido',
                  value: _.apellido,
                  icon: FontAwesomeIcons.user,
                  keyboardType: TextInputType.text,
                  fontSize: responsive.dp(1.8),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El apellido es requerido';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    _.apellido = text.trim();
                  },
                ),
                SizedBox(height: responsive.hp(2)),
                CustomInput(
                  label: 'Celular',
                  value: _.celular,
                  hint: '09xxxxxxxxx',
                  icon: FontAwesomeIcons.mobileScreenButton,
                  keyboardType: TextInputType.number,
                  fontSize: responsive.dp(1.8),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El celular es requerido';
                    }
                    return null;
                  },
                  inputFormatters: [
                    MaskTextInputFormatter(
                        mask: '#### ######', filter: {"#": RegExp(r'[0-9]')})
                  ],
                  onChanged: (text) {
                    _.celular = text.replaceAll(" ", "").trim();
                  },
                ),
                SizedBox(height: responsive.hp(2)),
                CustomInput(
                  label: 'Correo electrónico',
                  value: _.correo,
                  hint: 'ejemplo@gmail.com',
                  icon: FontAwesomeIcons.at,
                  keyboardType: TextInputType.emailAddress,
                  fontSize: responsive.dp(1.8),
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? '')) {
                      return "Ingrese un correo valido";
                    }
                    return null;
                  },
                  onChanged: (text) {
                    _.correo = text.trim();
                  },
                )
              ],
            )));
  }
}
