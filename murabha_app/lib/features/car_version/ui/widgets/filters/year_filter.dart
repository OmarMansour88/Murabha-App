import 'package:flutter/material.dart';

class YearFilterWidget extends StatelessWidget {
  final int selectedYear;
  final ValueChanged<int> onYearChanged;

  const YearFilterWidget({
    super.key,
    required this.selectedYear,
    required this.onYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Filter by Year", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        DropdownButton<int>(
          value: selectedYear,
          isExpanded: true,
          items: List.generate(6, (i) {
            final year = 2025 - i;
            return DropdownMenuItem(
              value: year,
              child: Text(year.toString()),
            );
          }),
          onChanged: (val) {
            if (val != null) {
              onYearChanged(val);
            }
          },
        ),
        const Spacer(),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Text("Swipe → to filter by Price"),
        ),
      ],
    );
  }
}
