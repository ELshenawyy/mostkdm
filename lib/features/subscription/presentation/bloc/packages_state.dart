part of 'packages_bloc.dart';

sealed class PackagesState extends Equatable {
  const PackagesState();

  @override
  List<Object> get props => [];
}

final class PackagesInitial extends PackagesState {}

final class PackagesLoading extends PackagesState {}

final class PackagesLoaded extends PackagesState {
  final List<PackageModel> packagesList;
  const PackagesLoaded(this.packagesList);

  @override
  List<Object> get props => [packagesList];
}

final class PackagesError extends PackagesState {
  final String message;
  const PackagesError(this.message);

  @override
  List<Object> get props => [message];
}

final class PackageSubscriptionSuccess extends PackagesState {
  final SubscriptionResponseModel subscription;
  const PackageSubscriptionSuccess(this.subscription);

  @override
  List<Object> get props => [subscription];
}

final class PackageSubscriptionLoading extends PackagesState {}

final class PackageSubscriptionError extends PackagesState {
  final String message;
  const PackageSubscriptionError(this.message);

  @override
  List<Object> get props => [message];
}
