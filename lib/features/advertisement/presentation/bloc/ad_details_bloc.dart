import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_details_model.dart';
import 'package:mostkdm/features/advertisement/data/repository/ad_details_repository.dart';

part 'ad_details_event.dart';
part 'ad_details_state.dart';

class AdDetailsBloc extends Bloc<AdDetailsEvent, AdDetailsState> {
  final AdDetailsRepository adDetailsRepository;
  AdDetailsBloc(this.adDetailsRepository) : super(AdDetailsInitial()) {
    on<GetAdDetailsEvent>(_getAdDetailsEvent);
  }
  Future<void> _getAdDetailsEvent(
    GetAdDetailsEvent event,
    Emitter<AdDetailsState> emit,
  ) async {
    emit(AdDetailsLoading());
    final result = await adDetailsRepository.getAdDetails(event.adId);
    result.fold(
      (error) => emit(AdDetailsError(error.message)),
      (adDetails) => emit(AdDetailsLoaded(adDetails)),
    );
  }
}
