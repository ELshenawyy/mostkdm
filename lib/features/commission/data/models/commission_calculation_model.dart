class CommissionCalculationModel {
  final double price;
  final double commissionPercentage;
  final double commissionAmount;

  const CommissionCalculationModel({
    required this.price,
    required this.commissionPercentage,
    required this.commissionAmount,
  });

  factory CommissionCalculationModel.fromJson(Map<String, dynamic> json) {
    return CommissionCalculationModel(
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      commissionPercentage:
          (json['commission_percentage'] as num?)?.toDouble() ?? 0.0,
      commissionAmount:
          (json['commission_amount'] as num?)?.toDouble() ?? 0.0,
    );
  }
}