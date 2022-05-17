import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../global_widgets/buscando_progress_w.dart';
import '../../global_widgets/custom_appbar.dart';
import '../../global_widgets/custom_stepper.dart';
import 'registro_datos_controller.dart';

class RegistroDatosPage extends StatelessWidget {
  const RegistroDatosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistroDatosController>(
        builder: (_) => WillPopScope(
              onWillPop: _.back,
              child: SafeArea(
                child: Scaffold(
                  appBar: CustomAppBar(
                    showLogOutButton: false,
                    titulo: 'Registro de datos',
                  ),
                  body: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => FocusScope.of(context).unfocus(),
                        child: CustomStepper(
                            onCompleted: _.onComplete,
                            onNext: _.onNext,
                            onBack: (currentStep) {},
                            steps: _.steps),
                      ),
                      BuscandoProgressWidget(buscando: _.buscando),
                    ],
                  ),
                ),
              ),
            ));
  }
}
