import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/utils/date_formatter.dart';
import 'package:mostkdm/features/wallet/data/models/transaction_model.dart';
import 'package:mostkdm/features/wallet/presentation/widgets/transaction_item.dart';

class WalletTransactionsSection extends StatelessWidget {
  const WalletTransactionsSection(
      {super.key, required List<TransactionModel> transactions})
      : _transactions = transactions;

  final List<TransactionModel> _transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('المعاملات الأخيرة', style: AppTextStyle.textFieldHeader),
        const SizedBox(height: 12),

        if (_transactions.isEmpty)
          Center(
            child: Text(
              'لا توجد معاملات بعد',
              style: AppTextStyle.headline3,
            ),
          )
        else
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _transactions.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) => TransactionItem(
            type: _transactions[i].type,
            description: _transactions[i].description,
            amount: _transactions[i].amount,
            status: _transactions[i].status,
            createdAt: DateFormatter.formatTimeAgo(_transactions[i].createdAt),
          ),
        ),
      ],
    );
  }
}
