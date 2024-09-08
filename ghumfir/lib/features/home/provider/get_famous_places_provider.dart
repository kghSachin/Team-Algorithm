import 'package:ghumfir/features/home/datasource/place_data_source.dart';
import 'package:ghumfir/features/home/model/faous_place_model.dart';
import 'package:riverpod/riverpod.dart';

final getFamousPlacesProvider =
    FutureProvider.family<List<FamousPlaceModel>?, int>((ref, id) async {
  return await getFamousPlace(id);
});
