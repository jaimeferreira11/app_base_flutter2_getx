import 'package:app_base_flutter2_getx/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuscandoProgressWidget extends StatelessWidget {
  final RxBool buscando;

  const BuscandoProgressWidget({Key? key, required this.buscando})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (buscando.value) {
          return Container(
            height: double.infinity,
            color: Colors.black26,
            child: const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            )),
          );
        }
        return Container();
      },
    );
  }
}
