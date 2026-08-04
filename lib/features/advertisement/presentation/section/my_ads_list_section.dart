import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/core/widgets/AppConfirmBottomSheet.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_model.dart';
import 'package:mostkdm/features/advertisement/presentation/bloc/my_ads_bloc.dart';
import 'package:mostkdm/features/advertisement/presentation/section/no_ads_section.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/my_ad_card.dart';

class MyAdsListSection extends StatelessWidget {
  final List<AdModel> ads;
  final void Function(int adId) onToggle;
  final void Function(int adId) onDelete;

  const MyAdsListSection({
    super.key,
    required this.ads,
    required this.onToggle,
    required this.onDelete,
  });

  void _handleDeleteTap(BuildContext context, AdModel ad) {
  
    if (ad.isActive) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            const AppConfirmBottomSheet(
              title: 'حذف الإعلان',
              subtitle:
                  'لا يمكنك حذف هذا الإعلان لأنه نشط، برجاء إيقافه أولاً',
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                ),
                child: const Icon(Icons.delete_outline, size: 24),
              ),
            ),
          ],
        ),
      );
      return;
    }

    _showDeleteConfirmSheet(context, ad.id);
  }

  void _showDeleteConfirmSheet(BuildContext context, int adId) {
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
            onConfirm: () => onDelete(adId),
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
              child: const Icon(Icons.delete_outline,
                  color: Colors.red, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  void _handleEditTap(BuildContext context, AdModel ad) async {
    // القاعدة (عكس الحذف): إعلان موقوف (مش نشط) هو الممنوع يتعدّل.
    if (ad.isActive) {
      // context.push بترجع Future بتكمل (complete) أول ما شاشة
      // التعديل تتقفل (pop) -- بنستنى ده وبعدين نطلب تحديث القايمة،
      // لأن MyAdsBloc مش بيعرف تلقائيًا إن الإعلان اتعدّل من شاشة تانية.
      await context.push(RouteNames.addAd, extra: ad.id.toString());
      if (context.mounted) {
        context.read<MyAdsBloc>().add(const GetMyAdsEvent());
      }
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          const AppConfirmBottomSheet(
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

  @override
  Widget build(BuildContext context) {
    if (ads.isEmpty) {
      return const Center(child: NoAdsSection());
    }

    return Column(
      children: ads
          .map(
            (ad) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: MyAdCard(
                ad: ad,
                isActive: ad.isActive,
                onToggle: () => onToggle(ad.id),
                onDelete: () => _handleDeleteTap(context, ad),
                onEdit: () => _handleEditTap(context, ad),
              ),
            ),
          )
          .toList(),
    );
  }
}