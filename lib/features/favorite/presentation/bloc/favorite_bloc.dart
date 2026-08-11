import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import 'package:mostkdm/features/favorite/data/repositories/favorites_repository.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/favorite_event.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/favorite_state.dart';

class FavoritesBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoritesRepository favoritesRepository;

  FavoritesBloc( this.favoritesRepository)
      : super(FavoriteInitial()) {
    on<GetFavoritesEvent>(_onGetFavoriteAds);
    on<ToggleFavoriteAdEvent>(_onToggleFavoriteAd);
  }

  bool isFavorite(int adId) {
    if (state is FavoriteLoaded) {
      return (state as FavoriteLoaded).favoriteAds.any((ad) => ad.id == adId);
    }
    return false;
  }

  Future<void> _onGetFavoriteAds(
    GetFavoritesEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(FavoriteLoading());
    final result = await favoritesRepository.getFavoritesAds();

    result.fold(
      (failure) => emit(FavoriteError(failure.message)),
      (response) => emit(FavoriteLoaded(response.ads)),
    );
  }

  Future<void> _onToggleFavoriteAd(
    ToggleFavoriteAdEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    final int adId = event.adId;

    // 1. التحديث المحلي الفوري (Optimistic Update)
    if (state is FavoriteLoaded) {
      final currentAds =
          List<AdModel>.from((state as FavoriteLoaded).favoriteAds);
      final index = currentAds.indexWhere((ad) => ad.id == adId);

      if (index != -1) {
        currentAds.removeAt(index);
      } else if (event.adItem != null) {
        currentAds.add(event.adItem!);
      }

      emit(FavoriteLoaded(currentAds));
    }

    // 2. إرسال الطلب للسيرفر في الخلفية
    final result = await favoritesRepository.toggleFavoriteAd(adId);

    result.fold(
      (failure) {
        // في حال حدوث خطأ من السيرفر نعيد جلب البيانات الحقيقية لتصحيح الـ UI
        add(GetFavoritesEvent());
      },
      (response) {},
    );
  }
}
