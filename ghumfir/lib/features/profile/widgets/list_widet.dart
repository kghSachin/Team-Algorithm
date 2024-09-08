import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListItem {
  final String title;

  final String avatarText;

  final VoidCallback onTap;

  ListItem({
    required this.title,
    required this.avatarText,
    required this.onTap,
  });
}

class ListTileContainer extends StatelessWidget {
  final List<ListItem> items;

  const ListTileContainer({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Material(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                shape: index < items.length - 1
                    ? const Border(bottom: BorderSide(color: Colors.grey))
                    : null,
                title: Text(items[index].title),
                leading: SvgPicture.asset(
                  items[index].avatarText,
                  height: 24,
                  width: 24,
                ),
                onTap: items[index].onTap,
              ),
            ),
          );
        }),
      ),
    );
  }
}
