import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstants.primaryBlue.withOpacity(0.9),
            ColorConstants.primaryOrange.withOpacity(0.95),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextConstants.offersTitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Get 20% off on your first booking. Use code: HAazIR20",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.95),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Placeholder image or asset
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/offer_illustration.png',
              width: 96,
              height: 96,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const Icon(Icons.local_offer, color: Colors.white, size: 56),
            ),
          ),
        ],
      ),
    );
  }
}