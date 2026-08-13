import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_bloc.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_event.dart';
import 'package:mostkdm/features/commission/presentation/bloc/commission_state.dart';
import 'package:mostkdm/features/commission/presentation/widgets/commission_ad_item.dart';

class CommissionAdsSection extends StatelessWidget {
  const CommissionAdsSection({super.key});

  // قائمة وهمية لتغذية الهيكل أثناء التحميل
  static const List<Map<String, dynamic>> _dummyAds = [
    {
      'image': '',
      'title': 'عنوان إعلان افتراضي للعرض أثناء التحميل',
      'price': '0000',
      'isPaid': false,
    },
    {
      'image': '',
      'title': 'عنوان إعلان افتراضي للعرض أثناء التحميل',
      'price': '0000',
      'isPaid': false,
    },
    {
      'image': '',
      'title': 'عنوان إعلان افتراضي للعرض أثناء التحميل',
      'price': '0000',
      'isPaid': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommissionBloc, CommissionState>(
      builder: (context, state) {
        final isLoading = state.isAdsLoading;
        final ads = isLoading ? _dummyAds : state.ads;

        if (!isLoading && ads.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Text('لا توجد إعلانات متاحة حالياً'),
            ),
          );
        }

        return Skeletonizer(
          enabled: isLoading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('إختر الإعلان المباع',
                  style: AppTextStyle.headline1.copyWith(fontSize: 16)),
              const SizedBox(height: 4),
              Text(
                'حدد الإعلان الذي تم بيعه لحساب العمولة',
                style: AppTextStyle.textFieldHeader,
              ),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ads.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final ad = ads[i];
                  final isPaid = ad['isPaid'] as bool? ?? false;

                  return CommissionAdItem(
                    image: ad['image'] as String? ?? '',
                    title: ad['title'] as String? ?? '',
                    price: '${ad['price'] ?? ''} ₴',
                    isPaid: isPaid,
                    onTap: () {
                      if (isLoading) return;

                      final bloc = context.read<CommissionBloc>();

                      if (isPaid) {
                        bloc.add(const ChangeStepEvent(CommissionStep.exempt));
                      } else {
                        final rawPrice = ad['price'];
                        final price = double.tryParse(
                              rawPrice
                                      ?.toString()
                                      .replaceAll('₴', '')
                                      .replaceAll(',', '')
                                      .trim() ??
                                  '0',
                            ) ??
                            0.0;

                        bloc.add(SelectAdEvent(ad: ad));
                        bloc.add(CalculateCommissionEvent(price));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}