import 'package:app_base_flutter2_getx/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class BuscandoProgressWidget extends StatelessWidget {
  final RxBool buscando;

  BuscandoProgressWidget({required this.buscando});

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
