import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/advertisement/data/repository/ads_list_repository.dart';
import 'package:mostkdm/features/advertisement/presentation/view/bloc/all_ads_event.dart';
import 'package:mostkdm/features/advertisement/presentation/view/bloc/all_ads_state.dart';


class AdsListBloc extends Bloc<AdsListEvent, AdsListState> {
  final AdsListRepository _repository;

  AdsListBloc({AdsListRepository? repository})
      : _repository = repository ?? AdsListRepositoryImpl(),
        super(const AdsListInitial()) {
    on<GetAllAdsEvent>(_onGetAllAds);
  }

  Future<void> _onGetAllAds(
    GetAllAdsEvent event,
    Emitter<AdsListState> emit,
  ) async {
    emit(const AdsListLoading());
    final result = await _repository.getAllAds();
    result.fold(
      (error) => emit(AdsListError(error.message)),
      (ads) => emit(AdsListLoaded(ads)),
    );
  }
}