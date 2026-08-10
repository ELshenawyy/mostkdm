import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mostkdm/features/wallet/data/models/recharge_model.dart';
import 'package:mostkdm/features/wallet/data/models/transaction_model.dart';
import 'package:mostkdm/features/wallet/data/models/wallet_balance_model.dart';
import 'package:mostkdm/features/wallet/data/repository/wallet_repository.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository _walletRepository;
  WalletBloc(this._walletRepository) : super(WalletInitial()) {
    on<GetWAlletBalanceEvent>((_getWalletBalanceEvent));
    on<RechargeWalletEvent>((_rechargeWalletEvent));
  }

  Future<void> _getWalletBalanceEvent(
      GetWAlletBalanceEvent event, Emitter<WalletState> emit) async {
    emit(WalletLoadingState());

    final balanceResult = await _walletRepository.getWalletBalance();
    final transactionsResult = await _walletRepository.getWalletTransactions();

    balanceResult.fold(
      (failure) => emit(WalletErrorState(failure.message)),
      (balance) => transactionsResult.fold(
        (failure) => emit(WalletErrorState(failure.message)),
        (transactions) => emit(
          WalletBalanceSuccessState(
            balance: balance,
            transactions: transactions,
          ),
        ),
      ),
    );
  }
    

  Future<void> _rechargeWalletEvent(
      RechargeWalletEvent event, Emitter<WalletState> emit) async {
    emit(RechargeLoadingState());

    final result =
        await _walletRepository.rechargeWallet(amount: event.amount);

    result.fold(
      (failure) => emit(RechargeErrorState(failure.message)),
      (recharge) => emit(RechargeSuccessState(recharge)),
    );
  }

}

