import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_details_model.dart';
import 'package:mostkdm/features/advertisement/data/models/add_ad_form_data.dart';
import 'package:mostkdm/features/advertisement/data/models/category_model.dart';
import 'package:mostkdm/features/advertisement/data/repository/add_ad_repository.dart';
import 'package:mostkdm/features/search/data/models/city_model.dart';

part 'add_ad_event.dart';
part 'add_ad_state.dart';

class AddAdBloc extends Bloc<AddAdEvent, AddAdState> {
  final AddAdRepository _repository;

  AddAdBloc({required AddAdRepository repository})
      : _repository = repository,
        super(const AddAdState()) {
    on<PrefillFromAdEvent>(_onPrefillFromAd);
    on<UpdateBasicInfoEvent>(_onUpdateBasicInfo);
    on<UpdateCategoryEvent>(_onUpdateCategory);
    on<UpdateLocationEvent>(_onUpdateLocation);
    on<AddImageEvent>(_onAddImage);
    on<RemoveImageEvent>(_onRemoveImage);
    on<UpdateContactEvent>(_onUpdateContact);
    on<LoadLookupDataEvent>(_onLoadLookupData);
    on<LoadSubCategoriesForCategoryEvent>(_onLoadSubCategoriesForCategory);
    on<SubmitAdEvent>(_onSubmitAd);
  }

  void _onPrefillFromAd(PrefillFromAdEvent event, Emitter<AddAdState> emit) {
    emit(state.copyWith(
      editingAdId: event.adId,
      title: event.ad.title,
      description: event.ad.description,
      price: event.ad.price.toString(),
      existingImageUrls: event.ad.images,
    ));
  }

  void _onUpdateBasicInfo(
    UpdateBasicInfoEvent event,
    Emitter<AddAdState> emit,
  ) {
    emit(state.copyWith(
      title: event.title,
      description: event.description,
      price: event.price,
    ));
  }

  void _onUpdateCategory(UpdateCategoryEvent event, Emitter<AddAdState> emit) {
    emit(state.copyWith(
      categoryId: event.categoryId,
      subCategoryId: event.subCategoryId,
    ));
  }

  void _onUpdateLocation(UpdateLocationEvent event, Emitter<AddAdState> emit) {
    emit(state.copyWith(
      location: event.location,
      latitude: event.latitude,
      longitude: event.longitude,
      cityId: event.cityId,
    ));
  }

  void _onAddImage(AddImageEvent event, Emitter<AddAdState> emit) {
    emit(state.copyWith(
      localImagePaths: [...state.localImagePaths, event.path],
    ));
  }

  void _onRemoveImage(RemoveImageEvent event, Emitter<AddAdState> emit) {
    final updated = List<String>.from(state.localImagePaths)
      ..removeAt(event.index);
    emit(state.copyWith(localImagePaths: updated));
  }

  void _onUpdateContact(UpdateContactEvent event, Emitter<AddAdState> emit) {
    emit(state.copyWith(
      connectionType: event.connectionType,
      connectionNumber: event.connectionNumber,
    ));
  }

  Future<void> _onLoadLookupData(
    LoadLookupDataEvent event,
    Emitter<AddAdState> emit,
  ) async {
    final categoriesResult = await _repository.getCategories();
    final citiesResult = await _repository.getCities();

    categoriesResult.fold(
      (_) {},
      (categories) => emit(state.copyWith(categories: categories)),
    );
    citiesResult.fold(
      (_) {},
      (cities) => emit(state.copyWith(cities: cities)),
    );
  }

  Future<void> _onLoadSubCategoriesForCategory(
    LoadSubCategoriesForCategoryEvent event,
    Emitter<AddAdState> emit,
  ) async {
    final result = await _repository.getSubCategories(event.categoryId);
    result.fold(
      (_) {},
      (subCategories) => emit(state.copyWith(subCategories: subCategories)),
    );
  }

  Future<void> _onSubmitAd(
    SubmitAdEvent event,
    Emitter<AddAdState> emit,
  ) async {
    if (state.categoryId == null) {
      emit(state.copyWith(
        submissionStatus: AddAdSubmissionStatus.failure,
        errorMessage: 'برجاء اختيار القسم',
      ));
      return;
    }

    emit(state.copyWith(submissionStatus: AddAdSubmissionStatus.submitting));

    final formData = AddAdFormData(
      title: state.title,
      description: state.description,
      price: state.price,
      categoryId: state.categoryId!,
      subCategoryId: state.subCategoryId,
      cityId: state.cityId,
      location: state.location,
      latitude: state.latitude,
      longitude: state.longitude,
      connectionType: state.connectionType,
      connectionNumber: state.connectionNumber,
      localImagePaths: state.localImagePaths,
    );

    final result = state.editingAdId != null
        ? await _repository.updateAd(state.editingAdId!, formData)
        : await _repository.createAd(formData);

    result.fold(
      (error) => emit(state.copyWith(
        submissionStatus: AddAdSubmissionStatus.failure,
        errorMessage: error.message,
      )),
      (_) => emit(
        state.copyWith(submissionStatus: AddAdSubmissionStatus.success),
      ),
    );
  }
}