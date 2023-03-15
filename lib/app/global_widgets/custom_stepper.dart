import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_stepper_view.dart';

class CustomStepper extends StatefulWidget {
  final List<CoolStep> steps;
  final VoidCallback onCompleted;
  final Function? onNext;
  final Function onBack;

  const CustomStepper({Key? key, required this.steps, required this.onCompleted, required this.onBack, this.onNext})
      : super(key: key);

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  final PageController _controller = PageController();

  int currentStep = 0;

  @override
  void dispose() {
    _controller.dispose();
    // _controller = null;
    super.dispose();
  }

  Future<void> switchToPage(int page) async {
    await _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  void onStepNext() {
    final validation = widget.steps[currentStep].validation!();

    if (validation == null) {
      if (!_isLast(currentStep)) {
        setState(() {
          currentStep++;
        });
        FocusScope.of(context).unfocus();
        switchToPage(currentStep);
        if (widget.onNext != null) {
          widget.onNext!(currentStep);
        }
      } else {
        widget.onCompleted();
      }
    } else {
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        titleText: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Text(
            validation,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        icon: const Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.white,
        ),
        colorText: Colors.white,
        backgroundColor: Colors.red,
        duration: const Duration(
          milliseconds: 2000,
        ),
      );
    }
  }

  void onStepBack() {
    if (!_isFirst(currentStep)) {
      setState(() {
        currentStep--;
      });
      switchToPage(currentStep);
      widget.onBack(currentStep);
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Expanded(
      child: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.steps.map((step) {
          return CustomStepperView(
            step: step,
          );
        }).toList(),
      ),
    );

    final counter = Text(
      "Paso ${currentStep + 1} DE ${widget.steps.length}",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    String getNextLabel() {
      String nextLabel;
      if (_isLast(currentStep)) {
        nextLabel = 'FINALIZAR';
      } else {
        nextLabel = 'SIGUIENTE';
      }
      return nextLabel;
    }

    String getPrevLabel() {
      String backLabel;
      if (_isFirst(currentStep)) {
        backLabel = '';
      } else {
        backLabel = 'ATRAS';
      }
      return backLabel;
    }

    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: onStepBack,
          child: Text(
            getPrevLabel(),
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        counter,
        TextButton(
          onPressed: onStepNext,
          child: Text(
            getNextLabel(),
            style: const TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      ],
    );

    return Column(
      children: [content, buttons],
    );
  }
}
