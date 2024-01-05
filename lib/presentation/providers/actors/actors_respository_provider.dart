import 'package:cine_app/infrastructure/datasources/actor_moviedb_datasource_impl.dart';
import 'package:cine_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(datasource: ActorMovieDbDatasource());
});
