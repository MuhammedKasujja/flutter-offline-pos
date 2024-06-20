import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

class Spacing extends StatelessWidget {
  final double height;
  const Spacing(this.height, {super.key});

  factory Spacing.xs() {
    return const Spacing(8);
  }
  factory Spacing.small() {
    return const Spacing(16);
  }

  factory Spacing.medium() {
    return const Spacing(24);
  }

  factory Spacing.large() {
    return const Spacing(40);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}
