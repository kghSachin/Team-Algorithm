import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ghumfir/features/home/datasource/place_data_source.dart';
import 'package:ghumfir/features/home/presentation/city_detail_view.dart';
import 'package:ghumfir/features/home/presentation/widgets/city_widget.dart';
import 'package:ghumfir/features/home/presentation/widgets/place_to_visit_widget.dart';
import 'package:ghumfir/features/home/provider/get_place_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeProvider = ref.watch(getPlacesProvider);
    return Scaffold(
        body: placeProvider.when(data: (data) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              titlePadding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
              centerTitle: true,
              // background: Image.network(photoList[1]),
              background: CachedNetworkImage(
                  imageUrl: photoList[1],
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Center(child: Icon(Icons.error));
                  }),
              title: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: constraints.biggest.height > kToolbarHeight * 1.5
                        ? 0.0
                        : 1.0,
                    child: Text(
                      'Ghumfir',
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
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
            child: SearchBar(
              hintText: 'Search destinations...',
              leading: Icon(Icons.search, color: Colors.grey[600]),
              trailing: [
                IconButton(
                  icon: Icon(Icons.mic, color: Colors.grey[600]),
                  onPressed: () async {
                    // Add voice search functionality
                    final res = await getPlaces();
                    print("Voice search result");
                    print(res);
                  },
                ),
              ],
              onTap: () {
                // Handle tap event
              },
              onChanged: (String value) {
                // Handle text changes
              },
            ),
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CityDetailView()));
                        },
                        child: CityWidget(
                          cityDescription: data?[index].location ?? "",
                          cityName: data?[index].name ?? "",
                          cityPhoto: data?[index].photo ?? "",
                        )));
              },
              childCount: data?.length,
            ),
          ),
          //
        ],
      );
    }, error: (Object error, StackTrace stackTrace) {
      return Center(child: Text("Error: $error"));
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    }));
  }
}
