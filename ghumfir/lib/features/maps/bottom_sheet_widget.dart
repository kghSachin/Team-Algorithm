import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ghumfir/features/home/presentation/place_detail_view.dart';

class MapInfoBottomSheet extends StatelessWidget {
  const MapInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About this location',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            width: 30,
            height: 2,
            color: Colors.brown,
          ),
          const SizedBox(height: 16),
          Text(
            'This is a beautiful place to visit. You can enjoy the view of the mountains and the river.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CachedNetworkImage(
                              imageUrl:
                                  "https://th.bing.com/th/id/OIP.avb9nDfw3kq7NOoP0grM4wHaEK?rs=1&pid=ImgDetMain")))),
              const SizedBox(width: 16),
              Expanded(
                  child: Center(
                child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CachedNetworkImage(
                        imageUrl:
                            "https://th.bing.com/th/id/OIP.avb9nDfw3kq7NOoP0grM4wHaEK?rs=1&pid=ImgDetMain")),
              )),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PlaceDetailView();
              }));
            },
            child: SizedBox(
                height: 40,
                width: double.maxFinite,
                child: Center(child: Text('View Details'))),
            color: Colors.blue,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
