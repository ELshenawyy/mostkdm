part of 'packages_bloc.dart';

sealed class PackagesEvent extends Equatable {
  const PackagesEvent();

  @override
  List<Object> get props => [];
}

class GetPackagesEvent extends PackagesEvent {
  const GetPackagesEvent();
}

class SubscribeToPackageEvent extends PackagesEvent {
  final int packageId;
  final String paymentMethod;

  const SubscribeToPackageEvent({
    required this.packageId,
    required this.paymentMethod,
  });

  @override
  List<Object> get props => [packageId, paymentMethod];
}


