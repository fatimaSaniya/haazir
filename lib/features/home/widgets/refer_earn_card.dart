import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';

class ReferEarnCard extends StatelessWidget {
  const ReferEarnCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorConstants.softBlue,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ColorConstants.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.card_giftcard, size: 40, color: ColorConstants.primaryBlue),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              TextConstants.referTitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorConstants.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstants.primaryOrange,
            ),
            onPressed: () {},
            child: const Text("Refer"),
          ),
        ],
      ),
    );
  }
}