import 'package:flutter/material.dart';

import '../helpers/responsive.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

// ignore: must_be_immutable
class CustomInputSelectWidget extends StatelessWidget {
  final String? label;
  final List<String> options;
  String value;
  final bool borderEnabled;
  final double? fontSize;
  final bool requerido;
  final void Function(String text)? onChanged;
  final String? Function(String text)? validator;
  final bool editable;
  final bool labelCenter;

  CustomInputSelectWidget({
    Key? key,
    this.label,
    required this.options,
    this.value = 'Seleccione una opción',
    this.borderEnabled = true,
    this.fontSize,
    this.onChanged,
    this.requerido = false,
    this.editable = true,
    this.labelCenter = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //    padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: _getSlider(context),
      ),
    );
  }

  Map<String, dynamic> inputsValues = {};
  Map<String, FocusNode> inputsFocusNodes = {};

  Map<String, TextEditingController> inputsValuesControllers = {};

  List<Widget> _getSlider(BuildContext context) {
    final responsive = Responsive.of(context);
    var fSize = responsive.dp(1.8);
    if (fontSize != null) fSize = fontSize!;
    var listaWidgets = <Widget>[];

    if (label != null && label!.isNotEmpty) {
      listaWidgets.add(
        Container(
          margin: EdgeInsets.only(bottom: responsive.hp(0.5)),
          child: Align(
            alignment: labelCenter ? Alignment.center : Alignment.centerLeft,
            child: Text(
              label!,
              style: TextStyle(fontSize: fSize, color: Colors.black87, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      );
    }

    String keyInputValue = "$key";
    bool existeValor = inputsValues.containsKey(keyInputValue);
    bool existeNodo = inputsFocusNodes.containsKey(keyInputValue);
    if (existeValor) {
      //DO NOTHING
    } else {
      inputsValues[keyInputValue] = options[0];
    }
    if (existeNodo) {
      //NOTHING
    } else {
      inputsFocusNodes[keyInputValue] = FocusNode();
    }
    listaWidgets.add(
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: validator == null ? AppColors.primaryColor : AppColors.errorColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20)
            //     borderRadius: BorderRadius.circular(20.0),
            ),
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 5.0,
        ),
        width: MediaQuery.of(context).size.width,
        child: DropdownButtonHideUnderline(
            child: DropdownButton<dynamic>(
          style: AppFonts.primaryFont.copyWith(
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontSize: fSize,
          ),
          isExpanded: true,
          value: value,
          onChanged: !editable
              ? null
              : (valor) {
                  value = valor;
                  FocusScope.of(context).requestFocus(FocusNode());
                  onChanged!(valor);
                },
          items: options.map<DropdownMenuItem>((valor) {
            return DropdownMenuItem(
              value: valor,
              child: Text(valor),
            );
          }).toList(),
        )),
      ),
    );

    Widget errorTextWidget = Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              validator == null ? '' : validator!('')!,
              textAlign: TextAlign.center,
              style: AppFonts.secondaryFont
                  .copyWith(fontSize: responsive.dp(1.3), fontWeight: FontWeight.w400, color: AppColors.errorColor),
            )));
    listaWidgets.add(validator == null ? const SizedBox() : errorTextWidget);
    return listaWidgets;
  }
}
