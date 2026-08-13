import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/core/theme/app_text_style.dart';
import 'package:mostkdm/core/widgets/app_button.dart';
import 'package:mostkdm/features/advertisement/data/models/ad_details_model.dart';
import 'package:mostkdm/features/advertisement/presentation/section/header_section.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/contact_button.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/follow_bloc.dart';

class SellerSection extends StatelessWidget {
  final AdDetailsModel ad;

  const SellerSection({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderSection(
            label: 'بيانات المعلن',
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.backgroundColor,
                backgroundImage: ad.seller.image.isEmpty
                    ? null
                    : CachedNetworkImageProvider(ad.seller.image),
                child: ad.seller.image.isEmpty
                    ? const Icon(Icons.person_outline,
                        color: AppColors.textHintColor)
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ad.seller.name,
                      style: AppTextStyle.textFieldHeader,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '${ad.seller.adsCount} إعلان آخر',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              BlocBuilder<FollowBloc, FollowState>(
                builder: (context, state) {
                  bool isFollowing = false;
                  if (state is FollowLoaded) {
                    isFollowing = state.followersList
                        .any((seller) => seller.id == ad.seller.id);
                  }

                  return AppButton(
                    label: isFollowing ? 'مُتابَع' : 'متابعة',
                    kind: isFollowing
                        ? AppButtonKind.outline
                        : AppButtonKind.secondary,
                    width: 105,
                    height: 38,
                    onTap: () {
                      context
                          .read<FollowBloc>()
                          .add(ToggleFollowEvent(userId: ad.seller.id));
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ContactButton(
                icon: Icons.facebook_outlined,
                label: 'واتساب',
                backgroundColor: const Color(0xFF25D366),
                onTap: () {},
              ),
              const SizedBox(width: 8),
              ContactButton(
                icon: Icons.chat_bubble_outline,
                label: 'محادثة',
                backgroundColor: AppColors.primaryColor,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              ContactButton(
                icon: Icons.call_outlined,
                label: 'اتصال',
                backgroundColor: AppColors.secondaryColor,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}