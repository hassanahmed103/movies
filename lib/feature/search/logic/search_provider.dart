import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/feature/home/data/model/move_model.dart';

import '../../home/data/network/api.dart';
import '../../home/data/network/api_constants.dart';

final searchControllerProvider =
    AsyncNotifierProvider<SearchController, List<MoveModel>>(
        SearchController.new);

class SearchController extends AsyncNotifier<List<MoveModel>> {
  @override
  List<MoveModel> build() {
    return [];
  }

  Future searchMovies({required String query}) async {
    state = const AsyncLoading();
    try {
      final List<MoveModel> movie = await Api.get(
        url: '${ApiConst.search}?query=$query&include_adult=false',
        token: ApiConst.accessToken,
      );
      state = AsyncData(movie);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
