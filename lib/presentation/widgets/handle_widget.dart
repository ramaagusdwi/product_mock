import 'package:flutter/material.dart';

class HandleWidget extends StatelessWidget {
  double widthFactor;

  HandleWidget({required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return _buildHandle(context);
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
