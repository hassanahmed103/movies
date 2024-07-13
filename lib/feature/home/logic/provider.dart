import '../data/model/move_model.dart';
import '../data/network/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/network/api_constants.dart';

final getMovieByTypeProvider = FutureProvider.family<List<MoveModel>, String>(
  (ref, endpoint) async {
    final List<MoveModel> movie =
        await Api.get(url: endpoint, token: ApiConst.accessToken);
    return movie;
  },
);

