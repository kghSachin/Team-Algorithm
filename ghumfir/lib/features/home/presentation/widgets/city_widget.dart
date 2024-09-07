import 'package:flutter/material.dart';
import 'package:ghumfir/themes/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CityWidget extends ConsumerWidget {

  const CityWidget( {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  "https://th.bing.com/th/id/OIP.o9AUafJWmDQqi2UWdd4yVwHaFj?rs=1&pid=ImgDetMain",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Biratnagar",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.blueSwatch.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Most Visited",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              "Koshi Provience, Nepal",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}