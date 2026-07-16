// features/commission/presentation/sections/commission_price_section.dart

import 'package:flutter/material.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/commission/presentation/widgets/commission_ad_item.dart';

class CommissionPriceSection extends StatefulWidget {
  final void Function(String price) onConfirm;
  final Map<String, dynamic> ad;

  const CommissionPriceSection(
      {super.key, required this.onConfirm, required this.ad});

  @override
  State<CommissionPriceSection> createState() => _CommissionPriceSectionState();
}

class _CommissionPriceSectionState extends State<CommissionPriceSection> {
  final _priceController = TextEditingController();
  String _commission = '0';
  String _totalPrice = '0';
  @override
  @override
  void initState() {
    super.initState();

    final priceStr = widget.ad['price'] as String;

    final price = double.tryParse(
          priceStr.replaceAll('₴', '').replaceAll(',', '').trim(),
        ) ??
        0;

    final commission = price * 0.05;

    _commission = commission.toStringAsFixed(0);

    _totalPrice = (price + commission).toStringAsFixed(0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text('سعر البيع النهائي', style: AppTextStyle.headline3),
        const SizedBox(height: 4),
        Text(
          'أدخل المبلغ الذي تم البيع فيه',
          textAlign: TextAlign.right,
          style: AppTextStyle.textFieldHeader,
        ),
        const SizedBox(height: 16),
        CommissionAdItem(
          image: widget.ad['image'] as String,
          title: widget.ad['title'] as String,
          price: widget.ad['price'] as String,
          isPaid: widget.ad['isPaid'] as bool,
        ),
        const SizedBox(height: 16),
        Center(
          child: Column(
            children: [
              Text('سعر البيع', style: AppTextStyle.textFieldHeader),
              const SizedBox(height: 4),
              Text(
                '$_totalPrice ₴',
                style: AppTextStyle.headline1.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('العمولة المتوقعة (5٪)',
                style: const TextStyle(fontSize: 13, color: Colors.grey)),
            Text('₴ $_commission',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ],
        ),
        const SizedBox(height: 24),
        AppButton(
          label: 'دفع العمولة',
          onTap: () {
            final priceStr = widget.ad['price'] as String;
            final price =
                priceStr.replaceAll('₴', '').replaceAll(',', '').trim();
            widget.onConfirm(price);
          },
        ),
      ],
    );
  }
}
