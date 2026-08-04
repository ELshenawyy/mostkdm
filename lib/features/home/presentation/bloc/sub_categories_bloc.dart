import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/home/data/repository/sub_categories_repository.dart';
import 'package:mostkdm/features/home/presentation/bloc/sub_categories_event.dart';
import 'package:mostkdm/features/home/presentation/bloc/sub_categories_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  final SubCategoriesRepository _repository;

  SubCategoryBloc({required SubCategoriesRepository repository})
      : _repository = repository,
        super(const SubCategoryInitial()) {
    on<GetCategoryAdsEvent>(_onGetCategoryAds);
  }

  Future<void> _onGetCategoryAds(
    GetCategoryAdsEvent event,
    Emitter<SubCategoryState> emit,
  ) async {
    emit(const SubCategoryLoading());
    final result = await _repository.getCategoryAds(
      categoryId: event.categoryId,
      subCategoryId: event.subCategoryId,
    );
    result.fold(
      (error) => emit(SubCategoryError(error.message)),
      (data) => emit(SubCategoryLoaded(data)),
    );
  }
}
