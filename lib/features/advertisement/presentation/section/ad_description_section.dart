import 'package:flutter/material.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';
import 'package:mostkdm/features/advertisement/presentation/widget/ad_specification_item.dart';
import 'package:mostkdm/features/advertisement/presentation/section/header_section.dart';

class AdDescriptionSection extends StatelessWidget {
  final AdDetailsModel ad;

  const AdDescriptionSection({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(label: "تفاصيل الإعلان"),
        const SizedBox(height: 12),
        Text(
          ad.description,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 13, color: Colors.grey, height: 1.6),
        ),
        const SizedBox(height: 12),
        ...ad.specifications.entries.map(
          (e) => AdSpecificationItem(
            title: e.key,
            value: e.value,
          ),
        ),
      ],
    );
  }
}
