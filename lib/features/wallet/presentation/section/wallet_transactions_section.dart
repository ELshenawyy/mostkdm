import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/wallet/presentation/widgets/transaction_item.dart';

class WalletTransactionsSection extends StatelessWidget {
  const WalletTransactionsSection({super.key});

  static const _transactions = [
    {
      'title': 'شحن رصيد',
      'subtitle': 'تم شحن رصيد بنجاح',
      'amount': '100',
      'isPositive': true,
      'date': 'منذ 2 يوم',
    },
    {
      'title': 'دفع رسوم',
      'subtitle': 'دفع رسوم إعلان',
      'amount': '25',
      'isPositive': false,
      'date': 'منذ 3 يوم',
    },
    {
      'title': 'شحن رصيد',
      'subtitle': 'تم شحن رصيد بنجاح',
      'amount': '200',
      'isPositive': true,
      'date': 'منذ 5 يوم',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('المعاملات الأخيرة', style: AppTextStyle.textFieldHeader),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _transactions.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) => TransactionItem(
            title: _transactions[i]['title'] as String,
            subtitle: _transactions[i]['subtitle'] as String,
            amount: _transactions[i]['amount'] as String,
            isPositive: _transactions[i]['isPositive'] as bool,
            date: _transactions[i]['date'] as String,
          ),
        ),
      ],
    );
  }
}