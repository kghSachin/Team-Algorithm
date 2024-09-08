import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PlaceToVisitContainer extends StatelessWidget {
  final int index;
  const PlaceToVisitContainer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: photoList[index % 4],
              fit: BoxFit.cover,
              height: 90,
              width: double.maxFinite,
              errorWidget: (context, url, error) {
                return Center(child: Icon(Icons.error));
              },
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              nameList[index % 4],
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
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
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "157 reviews",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> photoList = [
  "https://th.bing.com/th/id/OIP.o9AUafJWmDQqi2UWdd4yVwHaFj?rs=1&pid=ImgDetMain",
  "https://th.bing.com/th/id/OIP.W_8JnmDZZGnQWa1nB8t20gHaEM?w=1024&h=581&rs=1&pid=ImgDetMain",
  "https://th.bing.com/th/id/OIP.lsyDXApQLZpXQYWl5Kf1VQHaDE?rs=1&pid=ImgDetMain",
  "https://th.bing.com/th/id/OIP.TOO133QZQ64lgTSw0YrIxQHaFj?w=231&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"
];

List<String> nameList = [
  "Sani Mandir",
  "Ram Mandir",
  "Hanuman Mandir",
  "Masjid Biratnagar",
];
