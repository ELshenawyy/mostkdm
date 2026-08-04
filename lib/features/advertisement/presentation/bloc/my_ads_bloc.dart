import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import 'package:mostkdm/features/advertisement/data/repository/my_ads_repository.dart';

part 'my_ads_event.dart';
part 'my_ads_state.dart';

class MyAdsBloc extends Bloc<MyAdsEvent, MyAdsState> {
  final MyAdsRepository _repository;

  List<AdModel> _ads = [];

  MyAdsBloc({MyAdsRepository? repository})
      : _repository = repository ?? MyAdsRepositoryImpl(),
        super(const MyAdsInitial()) {
    on<GetMyAdsEvent>(_onGetMyAds);
    on<ToggleMyAdActiveEvent>(_onToggleAdActive);
    on<DeleteMyAdEvent>(_onDeleteAd);
  }

  Future<void> _onGetMyAds(
    GetMyAdsEvent event,
    Emitter<MyAdsState> emit,
  ) async {
    emit(const MyAdsLoading());
    final result = await _repository.getMyAds();
    result.fold(
      (error) => emit(MyAdsError(error.message)),
      (ads) {
        _ads = ads;
        emit(MyAdsLoaded(_ads));
      },
    );
  }

  Future<void> _onToggleAdActive(
    ToggleMyAdActiveEvent event,
    Emitter<MyAdsState> emit,
  ) async {
    final index = _ads.indexWhere((ad) => ad.id == event.adId);

    if (index == -1) return;

    final previousAd = _ads[index];
    final toggledAd = previousAd.copyWith(isActive: !previousAd.isActive);

    _ads = List<AdModel>.from(_ads)..[index] = toggledAd;
    emit(MyAdsLoaded(_ads));

    final result = await _repository.toggleAdActive(event.adId);
    result.fold(
      (_) {
        _ads = List<AdModel>.from(_ads)..[index] = previousAd;
        emit(MyAdsLoaded(_ads));
      },
      (_) {},
    );
  }

  Future<void> _onDeleteAd(
    DeleteMyAdEvent event,
    Emitter<MyAdsState> emit,
  ) async {
    final index = _ads.indexWhere((ad) => ad.id == event.adId);
    if (index == -1) return;

    final removedAd = _ads[index];
    _ads = List<AdModel>.from(_ads)..removeAt(index);
    emit(MyAdsLoaded(_ads));

    final result = await _repository.deleteAd(event.adId);
    result.fold(
      (error) {
        _ads = List<AdModel>.from(_ads)..insert(index, removedAd);
        emit(MyAdsLoaded(_ads));
      },
      (_) {},
    );
  }
}
