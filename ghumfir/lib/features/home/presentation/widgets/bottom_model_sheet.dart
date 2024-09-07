import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ghumfir/features/home/presentation/widgets/place_to_visit_widget.dart';
import 'package:ghumfir/themes/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GuideShowWidget extends ConsumerWidget {
  const GuideShowWidget({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(12, (index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                              imageUrl: photoList[index % 4],
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) {
                                return Center(child: Icon(Icons.error));
                              }),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            guideList[index % 4],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              ...List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: index < 4 ? Colors.amber : Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      MaterialButton(
                        color: AppColors.blue,
                        onPressed: () {},
                        child: Center(
                          child: Text("Hire Guide"),
                        ),
                      )
                    ],
                  ),
                );
              })
            ],
          ),
        ));
  }
}

List<String> guideList = [
  "Nischal Kafle",
  "Sachin Basnet",
  "Sujan Shrestha",
  "Sabin Shrestha",
  "Nabin Banu Tiwari",
  "Sumeet Shrestha",
];
