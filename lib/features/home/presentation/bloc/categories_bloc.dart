import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/home/data/repository/categories_repository.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _repository;

  CategoriesBloc({required CategoriesRepository repository})
      : _repository = repository,
        super(CategoriesInitial()) {
    on<GetCategoriesEvent>(_getCategories);
  }

  Future<void> _getCategories(
      GetCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    final result = await _repository.getAllCategories();
    result.fold(
      (error) => emit(CategoriesError(error.message)),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }
}
