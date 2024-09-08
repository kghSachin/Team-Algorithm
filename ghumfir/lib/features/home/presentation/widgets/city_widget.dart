// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ghumfir/themes/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CityWidget extends ConsumerWidget {
  final String cityName;
  final String cityPhoto;
  final String cityDescription;
  const CityWidget({
    required this.cityName,
    required this.cityPhoto,
    required this.cityDescription,
  });

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
                  child: CachedNetworkImage(
                      imageUrl: cityPhoto,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return Center(child: Icon(Icons.error));
                      })),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  cityName,
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
              cityDescription,
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
