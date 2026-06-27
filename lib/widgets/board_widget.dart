import 'package:flutter/material.dart';
import '../models/player.dart';
import 'cell_widget.dart';

class BoardWidget extends StatelessWidget {
  final List<Player?> cells;
  final void Function(int index) onCellTap;
  final bool enabled;

  const BoardWidget({
    super.key,
    required this.cells,
    required this.onCellTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return CellWidget(
          value: cells[index],
          onTap: () => onCellTap(index),
          enabled: enabled && cells[index] == null,
        );
      },
    );
  }
}