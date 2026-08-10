class WalletBalanceModel {
  final int walletId;
  final double balance;
  final String currency;

  WalletBalanceModel({
    required this.walletId,
    required this.balance,
    required this.currency,
  });

  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) {
    return WalletBalanceModel(
      walletId: json['wallet_id'] ?? 0,
      balance: (json['balance'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'SAR',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wallet_id': walletId,
      'balance': balance,
      'currency': currency,
    };
  }
}
