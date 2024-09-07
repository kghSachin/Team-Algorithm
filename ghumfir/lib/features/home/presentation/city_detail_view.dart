import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghumfir/features/home/presentation/widgets/city_widget.dart';
import 'package:ghumfir/features/home/presentation/widgets/place_to_visit_widget.dart';
import 'package:ghumfir/themes/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CityDetailView extends ConsumerWidget {
  const CityDetailView({super.key});

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
              background: Image.network(
                "https://th.bing.com/th/id/OIP.o9AUafJWmDQqi2UWdd4yVwHaFj?rs=1&pid=ImgDetMain",
                fit: BoxFit.cover,
              ),
              title: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: constraints.biggest.height > kToolbarHeight * 1.5
                        ? 0.0
                        : 1.0,
                    child: Text(
                      'Biratnagar',
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
              child: Text(
                "Places to visit",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.only(
                top: 16, left: 16, right: 16, bottom: 105),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => ImageDetailScreen(
                      //       imageUrl: imgList[index],
                      //       tag: 'imageHero$index',
                      //     ),
                      //   ),
                      // );
                    },
                    child: PlaceToVisitContainer(
                      index: index,
                    ),
                  );
                },
                childCount: 6,
              ),
            ),
          ),

          //
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24.0, left: 30, right: 30),
        child: MaterialButton(
          onPressed: () {},
          color: AppColors.blue,
          child: SizedBox(
            height: 56,
            width: double.maxFinite,
            child: Center(
              child: Text(
                "Hire A Local Guide",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
