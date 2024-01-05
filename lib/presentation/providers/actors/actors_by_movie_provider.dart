import 'package:cine_app/domain/entities/actor.dart';
import 'package:cine_app/presentation/providers/actors/actors_respository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorRepository = ref.watch(actorsRepositoryProvider);

  return ActorByMovieNotifier(getActors: actorRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

/// Example of the state:
/// {
///   54532: List<Actor>,
///   54533: List<Actor>,
///   54567: List<Actor>,
/// }
///
class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
