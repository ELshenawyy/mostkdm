import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/subscription/data/models/packages_model.dart';
import 'package:mostkdm/features/subscription/data/models/subscription_response_model.dart';
import 'package:mostkdm/features/subscription/data/repository/packages_repository.dart';

part 'packages_event.dart';
part 'packages_state.dart';

class PackagesBloc extends Bloc<PackagesEvent, PackagesState> {
  final PackagesRepository _repository;
  PackagesBloc(this._repository) : super(PackagesInitial()) {
    on<GetPackagesEvent>(_onGetPackagesEvent);
    on<SubscribeToPackageEvent>(_onSubscribeToPackageEvent);
    
  } 

  Future <void> _onGetPackagesEvent(
    GetPackagesEvent event,
    Emitter<PackagesState> emit,
  ) async {
    emit( PackagesLoading());
    final result = await _repository.getPackages();
    result.fold(
      (error) => emit(PackagesError(error.message)),
      (packages) => emit(PackagesLoaded(packages)),
    );
  }
  Future<void> _onSubscribeToPackageEvent(
  SubscribeToPackageEvent event,
  Emitter<PackagesState> emit,
) async {
  emit(PackageSubscriptionLoading());
  final result = await _repository.subscribeToPackage(
    packageId: event.packageId,
    paymentMethod: event.paymentMethod,
  );
  result.fold(
    (error) => emit(PackageSubscriptionError(error.message)),
    (subscription) => emit(PackageSubscriptionSuccess(subscription)),
  );
}

}
