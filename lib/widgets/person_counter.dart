import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required int personCount,
    this.onIncrement,
    this.onDecrement,
  }) : _personCount = personCount;

  final ThemeData theme;
  final int _personCount;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            color: theme.colorScheme.primary,
            onPressed: onDecrement,
            icon: const Icon(Icons.remove)),
        Text(
          "$_personCount",
          style: theme.textTheme.titleMedium,
        ),
        IconButton(
            color: theme.colorScheme.primary,
            onPressed: onIncrement,
            icon: const Icon(Icons.add)),
      ],
    );
  }
}
