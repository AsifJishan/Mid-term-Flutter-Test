import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MidAnimation(),
    );
  }
}

class MidAnimationController extends GetxController {
  var black = 50.0.obs;
  var darkGrey = 50.0.obs;
  var lightGrey = 50.0.obs;

  @override
  void onInit() {
    super.onInit();
    animateCircles();
  }

  void animateCircles() async {
    await Future.delayed(const Duration(milliseconds: 500));
    darkGrey.value = 70.0;

    await Future.delayed(const Duration(milliseconds: 500));
    lightGrey.value = 90.0;
  }
}

class MidAnimation extends StatelessWidget {
  final MidAnimationController controller = Get.put(MidAnimationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      body: Center (
        child: Stack(
          alignment: Alignment.center,
        children: [
        Obx(() => Container(
          width: controller.lightGrey.value,
          height: controller.darkGrey.value,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            shape: BoxShape.circle,
          ),
        )),

        Obx(() => Container (
          width: controller.black.value,
          height: controller.black.value,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        )),
      ],
        ),
      ),
    );
  }
}