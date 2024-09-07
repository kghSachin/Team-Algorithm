import 'package:flutter/material.dart';
import 'package:ghumfir/features/home/presentation/city_detail_view.dart';
import 'package:ghumfir/features/home/presentation/widgets/city_widget.dart';
import 'package:ghumfir/res/strings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

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
                  onPressed: () {
                    // Add voice search functionality
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
                        child: CityWidget()));
              },
              childCount: 20,
            ),
          ),
          //
        ],
      ),
    );
  }
}
