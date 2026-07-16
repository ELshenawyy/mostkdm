import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/widgets/AppConfirmBottomSheet.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';
import 'package:mostkdm/features/advertisement/data/dummy.dart';
import 'package:mostkdm/features/advertisement/presentation/section/no_ads_section.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/my_ad_card.dart';

class MyAdsListSection extends StatefulWidget {
  const MyAdsListSection({super.key});

  @override
  State<MyAdsListSection> createState() => _MyAdsListSectionState();
}

class _MyAdsListSectionState extends State<MyAdsListSection> {
  final List<Map<String, dynamic>> _ads = dummyAds
    .map(
      (ad) => {
        'ad': ad,
        'isActive': true,
      },
    )
    .toList();

  void _showDeleteSheet(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          AppConfirmBottomSheet(
            title: 'حذف الإعلان',
            subtitle: 'هل أنت متأكد من أنك تريد حذف هذا الإعلان',
            confirmLabel: 'حذف',
            confirmKind: AppButtonKind.secondary,
            onConfirm: () => setState(() => _ads.removeAt(index)),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
              ),
              child:
                  const Icon(Icons.delete_outline, color: Colors.red, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditSheet(int index) {
    final isActive = _ads[index]['isActive'] as bool;

    if (isActive) {
      context.push(RouteNames.addAd,
          extra: _ads[index]['ad'] as AdDetailsModel);
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            AppConfirmBottomSheet(
              title: 'تعديل الإعلان',
              subtitle: 'لا يمكنك تعديل هذا الإعلان لأنه موقوف',
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                ),
                child: const Icon(Icons.edit_outlined, size: 24),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ads.isEmpty
        ? const Center(child: NoAdsSection())
        : Column(
            children: List.generate(
              _ads.length,
              (i) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: MyAdCard(
                  ad: _ads[i]['ad'] as AdDetailsModel,
                  isActive: _ads[i]['isActive'] as bool,
                  onToggle: () => setState(
                    () => _ads[i]['isActive'] = !(_ads[i]['isActive'] as bool),
                  ),
                  onDelete: () => _showDeleteSheet(i),
                  onEdit: () => _showEditSheet(i),
                ),
              ),
            ),
          );
  }
}
