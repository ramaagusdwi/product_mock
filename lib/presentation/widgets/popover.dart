import 'package:flutter/material.dart';
import 'package:testfokatech/common/navigation.dart';
import 'package:testfokatech/presentation/screens/menu_screen.dart';
import 'package:testfokatech/presentation/widgets/handle_widget.dart';

class Popover extends StatelessWidget {
  const Popover({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      // padding: const EdgeInsets.all(14.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => Navigation.intentWithData(MenuScreen.routeName, {}),
            child: HandleWidget(
              widthFactor: 0.10,
            ),
          ),
          if (child != null) child!
        ],
      ),
    );
  }
}
