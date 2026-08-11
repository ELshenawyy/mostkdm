import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/favorite/data/model/seller_model.dart';
import 'package:mostkdm/features/favorite/data/repositories/follow_repository.dart';

part 'follow_event.dart';
part 'follow_state.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  final FollowRepository followRepository;
  FollowBloc(this.followRepository) : super(FollowInitial()) {
    on<GetFollowersEvent>(_onGetFollowersListEvent);
    on<ToggleFollowEvent>(_onToggleFollowEvent);
  }

  Future<void> _onGetFollowersListEvent(
    GetFollowersEvent event,
    Emitter<FollowState> emit,
  ) async {
    emit(FollowLoading());
    final result = await followRepository.getFollowersList();
    result.fold(
      (failure) => emit(FollowError(failure.message)),
      (followers) => emit(FollowLoaded(followers)),
    );
  }

  Future<void> _onToggleFollowEvent(
    ToggleFollowEvent event,
    Emitter<FollowState> emit,
  ) async {
    if (state is FollowLoaded) {
      final currentList = (state as FollowLoaded).followersList;
      final bool isCurrentlyFollowing =
          currentList.any((s) => s.id == event.userId);

      final result = await followRepository.toggleFollowUser(
        event.userId,
        isCurrentlyFollowing,
      );

      result.fold(
        (failure) {
          emit(FollowError(failure.message));
        },
        (_) {
          add(GetFollowersEvent());
        },
      );
    }
  }
}
