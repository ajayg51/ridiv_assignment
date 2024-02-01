import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridiv_assignment/screens/splash_screen_controller.dart';
import 'package:ridiv_assignment/utils/assets.dart';
import 'package:ridiv_assignment/utils/common_appbar.dart';
import 'package:ridiv_assignment/utils/common_scaffold.dart';
import 'package:ridiv_assignment/utils/extensions.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      child: Column(
        children: [
          const CommonAppbar(),
          12.verticalSpace,
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedLogo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..repeat(reverse: true);
    
    sizeAnimation =
        Tween<double>(begin: 100, end: 300).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, __) => Image.asset(
        Assets.logo,
        width: sizeAnimation.value,
        height: sizeAnimation.value,
      ),
    );
  }
}
