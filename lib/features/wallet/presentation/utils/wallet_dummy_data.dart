import 'package:mostkdm/features/wallet/data/models/transaction_model.dart';
import 'package:mostkdm/features/wallet/data/models/wallet_balance_model.dart';

class WalletDummyData {
  static WalletBalanceModel get dummyBalance => WalletBalanceModel(
        walletId: 1,
        balance: 1250.50,
        currency: 'SAR',
      );

  static TransactionModel get dummyTransaction => TransactionModel(
        id: 1,
        type: 'credit',
        status: 'completed',
        amount: 150.0,
        balanceAfter: 1250.50,
        source: 'MyFatoorah',
        reference: 'INV-98231',
        description: 'شحن رصيد المحفظة عبر بطاقة ائتمان',
        createdAt: '2026-08-12T14:30:00',
      );

  static List<TransactionModel> get dummyTransactionsList =>
      List<TransactionModel>.generate(5, (_) => dummyTransaction);
}