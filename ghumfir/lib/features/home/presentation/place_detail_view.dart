import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ghumfir/features/home/presentation/widgets/place_to_visit_widget.dart';
import 'package:ghumfir/res/info_string.dart';
import 'package:ghumfir/themes/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaceDetailView extends ConsumerWidget {
  const PlaceDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              titlePadding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
              centerTitle: true,
              background: CachedNetworkImage(
                imageUrl: photoList[1],
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Center(child: Icon(Icons.error));
                },
              ),
              title: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: constraints.biggest.height > kToolbarHeight * 1.5
                        ? 0.0
                        : 1.0,
                    child: Text(
                      'Sani Mandir',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "About Sani Mandir",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "Add Blog +",
                              style: TextStyle(color: AppColors.blue),
                            ))
                      ],
                    ),
                    Container(
                      width: 60,
                      height: 2,
                      color: AppColors.blue,
                    )
                  ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                biratInfo,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 200,
                child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: LatLng(27.167, 84.515), zoom: 12),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Blogs about Sani Mandir",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 60,
                    height: 2,
                    color: AppColors.blue,
                  ),
                  const SizedBox(height: 12),
                  PlaceBlogWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  PlaceBlogWidget(),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceBlogWidget extends StatelessWidget {
  const PlaceBlogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(imageUrl: photoList[2]),
          const SizedBox(height: 8),
          Text(
            "Sani Mandir",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            children: [
              Text(
                "By: ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "Sachin Basnet",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Spacer(),
              Text(
                "12th Oct, 2021",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Sani Mandir is a famous temple in Biratnagar. It is located in the heart of the city. It is a place where people come to worship and seek blessings from the god. The temple is known for its beautiful architecture and peaceful environment. It is a must-visit place for anyone visiting Biratnagar.",
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 6,
          ),
          const SizedBox(height: 14),
          MaterialButton(
              height: 52,
              minWidth: double.maxFinite,
              color: AppColors.blue,
              onPressed: () {},
              child: Center(child: Text("Read More")))
        ],
      ),
    );
  }
}
