class PayCommissionResponseModel {
  final double commissionAmount;
  final String status;
  final String message;

  const PayCommissionResponseModel({
    required this.commissionAmount,
    required this.status,
    required this.message,
  });

  factory PayCommissionResponseModel.fromJson(Map<String, dynamic> json) {
    return PayCommissionResponseModel(
      commissionAmount:
          (json['commission_amount'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? '',
      message: json['message'] ?? '',
    );
  }
}