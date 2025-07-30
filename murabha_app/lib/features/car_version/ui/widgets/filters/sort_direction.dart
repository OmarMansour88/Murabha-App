import 'package:flutter/material.dart';

class SortDirectionWidget extends StatelessWidget {
  final bool ascending;
  final ValueChanged<bool> onDirectionChanged;

  const SortDirectionWidget({
    super.key,
    required this.ascending,
    required this.onDirectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sort Direction", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        SwitchListTile(
          title: const Text("Ascending"),
          value: ascending,
          onChanged: onDirectionChanged,
        ),
        const Spacer(),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Text("Swipe ↔ to go back or next"),
        ),
      ],
    );
  }
}
