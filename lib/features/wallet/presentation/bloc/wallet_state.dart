part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}

final class WalletLoadingState extends WalletState {}

final class WalletBalanceSuccessState extends WalletState {
  final WalletBalanceModel balance;
  final List<TransactionModel> transactions;

  const WalletBalanceSuccessState(
      {required this.balance, required this.transactions});

  @override
  List<Object> get props => [balance, transactions];
}

final class WalletErrorState extends WalletState {
  final String message;

  const WalletErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class RechargeLoadingState extends WalletState {}

class RechargeSuccessState extends WalletState {
  final RechargeModel recharge;

  const RechargeSuccessState(this.recharge);

  @override
  List<Object> get props => [recharge];
}

class RechargeErrorState extends WalletState {
  final String message;

  const RechargeErrorState(this.message);

  @override
  List<Object> get props => [message];
}
