class TransactionModel {
  final int id;
  final String type;
  final String status;
  final double amount;
  final double balanceAfter;
  final String source;
  final String? reference;
  final String description;
  final String createdAt;

  TransactionModel({
    required this.id,
    required this.type,
    required this.status,
    required this.amount,
    required this.balanceAfter,
    required this.source,
    this.reference,
    required this.description,
    required this.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] ?? 0,
      type: json['type'] ?? '',
      status: json['status'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      balanceAfter: (json['balance_after'] ?? 0).toDouble(),
      source: json['source'] ?? '',
      reference: json['reference'],
      description: json['description'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
