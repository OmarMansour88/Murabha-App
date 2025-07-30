import 'package:flutter/material.dart';

class SortFilterButton extends StatelessWidget {
  final String currentSort;
  final bool ascending;
  final Function(String newSort, bool newOrder) onApply;

  const SortFilterButton({
    super.key,
    required this.currentSort,
    required this.ascending,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    String selectedSort = currentSort;
    bool localAscending = ascending;

    return IconButton(
      icon: const Icon(Icons.sort),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return StatefulBuilder(
              builder: (context, setModalState) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Sort By",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      RadioListTile<String>(
                        title: const Text('Year'),
                        value: 'year',
                        groupValue: selectedSort,
                        onChanged: (val) =>
                            setModalState(() => selectedSort = val!),
                      ),
                      RadioListTile<String>(
                        title: const Text('Price'),
                        value: 'price',
                        groupValue: selectedSort,
                        onChanged: (val) =>
                            setModalState(() => selectedSort = val!),
                      ),
                      RadioListTile<String>(
                        title: const Text('Stock'),
                        value: 'stock',
                        groupValue: selectedSort,
                        onChanged: (val) =>
                            setModalState(() => selectedSort = val!),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Ascending"),
                          Switch(
                            value: localAscending,
                            onChanged: (val) =>
                                setModalState(() => localAscending = val),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          onApply(selectedSort, localAscending);
                          Navigator.pop(context);
                        },
                        child: const Text("Apply"),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
