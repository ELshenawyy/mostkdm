class RechargeModel {
  final String paymentUrl;
  final int transactionId;
  final String invoiceId;

  RechargeModel({
    required this.paymentUrl,
    required this.transactionId,
    required this.invoiceId,
  });

  factory RechargeModel.fromJson(Map<String, dynamic> json) {
    return RechargeModel(
      paymentUrl: json['payment_url'] ?? '',
      transactionId: json['transaction_id'] ?? 0,
      invoiceId: json['invoice_id'] ?? '',
    );
  }
}