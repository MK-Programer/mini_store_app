import 'package:flutter/material.dart';
import '../resources/values_manager.dart';

class AppBarIcons extends StatelessWidget {
  final Function function;
  final IconData icon;
  const AppBarIcons({
    Key? key,
    required this.function,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p4),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p6),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
