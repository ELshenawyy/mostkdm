part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

class GetWAlletBalanceEvent extends WalletEvent {}

class RechargeWalletEvent extends WalletEvent {
  final double amount;

  const RechargeWalletEvent(this.amount);

  @override
  List<Object> get props => [amount];
}
