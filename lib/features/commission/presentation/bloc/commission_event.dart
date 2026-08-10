import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_state.dart';

abstract class CommissionEvent extends Equatable {
  const CommissionEvent();

  @override
  List<Object?> get props => [];
}

class GetCommissionAdsEvent extends CommissionEvent {}

class SelectAdEvent extends CommissionEvent {
  final dynamic ad;
  const SelectAdEvent({required this.ad});

  @override
  List<Object?> get props => [ad];
}

class ChangeStepEvent extends CommissionEvent {
  final CommissionStep step;
  const ChangeStepEvent(this.step);

  @override
  List<Object?> get props => [step];
}

class GoToPreviousStepEvent extends CommissionEvent {}

class CalculateCommissionEvent extends CommissionEvent {
  final double price;
  const CalculateCommissionEvent(this.price);

  @override
  List<Object?> get props => [price];
}

class PayCommissionEvent extends CommissionEvent {
  final String paymentMethod;
  const PayCommissionEvent({this.paymentMethod = 'wallet'});

  @override
  List<Object?> get props => [paymentMethod];
}