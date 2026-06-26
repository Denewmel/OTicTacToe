import 'package:flutter/material.dart';
import '../models/player.dart';

class CellWidget extends StatelessWidget {
  final Player? value;
  final VoidCallback onTap;
  final bool enabled;

  const CellWidget({
    super.key,
    required this.value,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: value != null
              ? Text(
                  value!.symbol,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: value == Player.X
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}