import 'package:ghumfir/features/home/datasource/place_data_source.dart';
import 'package:ghumfir/features/home/model/place_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getPlacesProvider = FutureProvider<List<PlaceModel>?>((ref) async {
  return getPlaces();
});
