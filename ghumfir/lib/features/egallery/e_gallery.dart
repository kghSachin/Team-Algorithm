import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ghumfir/res/info_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EGallery extends ConsumerWidget {
  const EGallery({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Gallery'),
      ),
      body: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            color: Colors.primaries[index % Colors.primaries.length],
            child: CachedNetworkImage(
              imageUrl: imageLink[index % 15],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
