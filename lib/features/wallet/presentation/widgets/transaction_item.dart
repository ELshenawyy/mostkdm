import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
class TransactionItem extends StatelessWidget {
  final String type;
  final String description;
  final double amount;
  final String status;
  final String createdAt;

  const TransactionItem({
    super.key,
    required this.type,
    required this.description,
    required this.amount,
    required this.status,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSuccess = status.toLowerCase() == 'paid' ||
        status.toLowerCase() == 'success' ||
        status.toLowerCase() == 'completed';
    final bool isPending = status.toLowerCase() == 'pending';

    final Color statusColor = isSuccess
        ? Colors.green
        : isPending
            ? Colors.orange
            : Colors.red;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isSuccess
                  ? Icons.arrow_downward
                  : isPending
                      ? Icons.access_time
                      : Icons.arrow_upward,
              color: statusColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: AppTextStyle.textFieldHeader
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                if (description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTextStyle.headline2.copyWith(fontSize: 12),
                  ),
                ],
                const SizedBox(height: 4),
                Text(
                  createdAt,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            '$amount ₴',
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
