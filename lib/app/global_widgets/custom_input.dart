import 'package:app_base_flutter2_getx/app/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_decoration_inputs.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String? hint;
  final String? value;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool? obscureText, borderEnabled;
  final double? fontSize;
  final IconData? icon;
  final void Function(String text) onChanged;
  final String? Function(String? text)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? placeholder;
  final bool? enabled;
  final InputBorder? border;

  CustomInput(
      {required this.label,
      required this.onChanged,
      this.validator,
      this.hint = 'Escriba aquí',
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.borderEnabled = true,
      this.fontSize,
      this.enabled = true,
      this.icon,
      this.value,
      this.maxLength,
      this.maxLines,
      this.inputFormatters,
      this.border,
      this.placeholder = "Escriba aqui"});

  @override
  Widget build(BuildContext context) {
    return _getSlider(context);
  }

  Widget _getSlider(BuildContext context) {
    Map<String, dynamic> inputsValues = {};
    Map<String, FocusNode> inputsFocusNodes = {};
    Map<String, TextEditingController> inputsValuesControllers = {};

    final responsive = Responsive.of(context);

    var fSize = responsive.dp(1);
    if (this.fontSize != null) fSize = this.fontSize!;

    String keyInputValue = "$key";
    bool existeValor = inputsValues.containsKey(keyInputValue);
    bool existeNodo = inputsFocusNodes.containsKey(keyInputValue);
    bool existeController = inputsValuesControllers.containsKey(keyInputValue);
    if (existeValor) {
      //DO NOTHING
    } else {
      inputsValues[keyInputValue] = "";
    }
    if (existeNodo) {
      //NOTHING
    } else {
      inputsFocusNodes[keyInputValue] = FocusNode();
    }
    if (existeController) {
      //NOTHING
    } else {
      inputsValuesControllers[keyInputValue] = TextEditingController();
    }
    inputsValuesControllers[keyInputValue]!.text = value ?? "";

    return Container(
        child: TextFormField(
            enabled: this.enabled,
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus();
              if (inputsFocusNodes.containsKey("$key")) {
                print("key siguiente encontrada $key");
                FocusScope.of(context).requestFocus(inputsFocusNodes["$key"]);
              } else {
                //NO EN ESTA PAGINA
                print("key siguiente inexistente $key");
              }
            },
            onChanged: (valor) {
              inputsValues[keyInputValue] = valor;
              this.onChanged(valor);
            },
            validator: this.validator ?? null,
            maxLength: maxLength ?? null,
            maxLines: maxLines ?? null,
            focusNode: inputsFocusNodes[keyInputValue] ?? FocusNode(),
            controller: inputsValuesControllers[keyInputValue],
            textCapitalization: TextCapitalization.words,
            inputFormatters: this.inputFormatters ?? [],
            textInputAction: inputsFocusNodes.containsKey("$key")
                ? TextInputAction.next
                : TextInputAction.done,
            keyboardType: this.keyboardType,
            style: TextStyle(
              // fontWeight: FontWeight.w300,
              //color: Colors.black,
              fontSize: fSize,
            ),
            decoration: this.icon == null
                ? CustomDecorationInputs.formInputDecoration(
                    border: this.border, hint: this.hint ?? "", label: label)
                : CustomDecorationInputs.formInputDecoration(
                    border: this.border,
                    hint: this.hint ?? "",
                    label: label,
                    icon: this.icon)));
  }
}
