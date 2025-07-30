import 'package:flutter/material.dart';

class PriceFilterWidget extends StatelessWidget {
  final RangeValues priceRange;
  final ValueChanged<RangeValues> onPriceChanged;

  const PriceFilterWidget({
    super.key,
    required this.priceRange,
    required this.onPriceChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Filter by Price", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        RangeSlider(
          values: priceRange,
          min: 100000,
          max: 5000000,
          divisions: 50,
          labels: RangeLabels(
            '${priceRange.start.toInt()}',
            '${priceRange.end.toInt()}',
          ),
          onChanged: onPriceChanged,
        ),
        Text("From ${priceRange.start.toInt()} to ${priceRange.end.toInt()}"),
        const Spacer(),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Text("Swipe → to toggle Sort Direction"),
        ),
      ],
    );
  }
}
