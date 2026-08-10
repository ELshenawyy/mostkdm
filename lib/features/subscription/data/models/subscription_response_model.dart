class SubscriptionResponseModel {
  final int subscriptionId;
  final int packageId;
  final num price;
  final String currency;
  final String paymentMethod;
  final String? paymentUrl;
  final String startDate;
  final String endDate;
  final int paymentId;

  SubscriptionResponseModel({
    required this.subscriptionId,
    required this.packageId,
    required this.price,
    required this.currency,
    required this.paymentMethod,
    this.paymentUrl,
    required this.startDate,
    required this.endDate,
    required this.paymentId,
  });

  factory SubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionResponseModel(
      subscriptionId: json['subscription_id'] as int,
      packageId: json['package_id'] as int,
      price: json['price'] as num,
      currency: json['currency'] as String? ?? 'SAR',
      paymentMethod: json['payment_method'] as String? ?? '',
      paymentUrl: json['payment_url'] as String?,
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String? ?? '',
      paymentId: json['payment_id'] as int,
    );
  }
}