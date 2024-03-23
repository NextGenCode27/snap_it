import 'package:flutter/material.dart';

class OnBoardLogoBox extends StatelessWidget {
  const OnBoardLogoBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
    );
  }
}
