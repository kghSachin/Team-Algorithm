import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ghumfir/features/profile/guide_profile.dart';
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
                        height: 70,
                        width: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                              imageUrl: guideImageLink[index % 5],
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => GuideProfile(
                                        imageUrl: guideImageLink[index % 5],
                                        title: guideList[index % 5],
                                      )));
                        },
                        child: Center(
                          child: Text("More Details"),
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

List<String> guideImageLink = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyNcJXUzK-LC-8dIAff4UZNHOwddbyMdo9c6qlzhjJWBs5ps-331CnDQhum_5n63MNU8A&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQA6egjwnu74xqAgNjzL1jaCZz98tF5jUuYw&s",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4syribkNb9csmFvW7RKUfth3qcwApken8F-ntMoW0xT4smvmuXsh3exnGYczK9CpjdL4&usqp=CAU",
  "https://res.cloudinary.com/tourhq/image/upload/c_fill,g_face,fl_progressive,h_498,q_auto,w_390/cdn11syfidaeqz37dccd",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6Bn-CGKeniMhgVJga1mYilGgxJJR7y3JpkWz_LgF4A4VAE-H4RndwRL0iuMdgJ9lIBmM&usqp=CAU"
];
