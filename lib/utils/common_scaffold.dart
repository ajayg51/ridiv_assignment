import 'package:flutter/material.dart';
import 'package:ridiv_assignment/utils/constants.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    super.key,
    this.appBar,
    required this.child,
  });

  final Widget? appBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CommonGradient(child: child),
      ),
    );
  }
}

class CommonGradient extends StatelessWidget {
  const CommonGradient({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.teal,
            const Color(ColorConsts.bannerColor).withOpacity(0.8),
            Colors.brown,
            Colors.black.withOpacity(0.2),
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
