import 'package:flutter/material.dart';

class VSpace extends StatelessWidget {
  final double space;
  const VSpace(
    this.space, {
    super.key,
  });

  const VSpace.sm({super.key, this.space = 4});
  const VSpace.md({super.key, this.space = 8});
  const VSpace.lg({super.key, this.space = 12});
  const VSpace.xl({super.key, this.space = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}

class HSpace extends StatelessWidget {
  final double space;
  const HSpace(
    this.space, {
    super.key,
  });

  const HSpace.sm({super.key, this.space = 4});
  const HSpace.md({super.key, this.space = 8});
  const HSpace.lg({super.key, this.space = 12});
  const HSpace.xl({super.key, this.space = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
