import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/color_constants.dart';

class TrendingServices extends StatelessWidget {
  const TrendingServices({super.key});

  static final List<Map<String, String>> data = [
    {"name": "Kitchen Cleaning", "price": "₹499", "image": "assets/images/kitchen.json"},
    {"name": "Sofa Cleaning", "price": "₹799", "image": "assets/images/cleaning.json"},
    {"name": "Laundry", "price": "₹299", "image": "assets/images/WashingMachine.json"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170, // fixed height prevents overflow
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = data[index];
          final imagePath = item["image"] ?? "";

          return Container(
            width: 220,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorConstants.softBlue.withOpacity(0.6),
                  ColorConstants.softOrange.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorConstants.border),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // image / illustration
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: imagePath.endsWith(".json")
                      ? Lottie.asset(
                    imagePath,
                    width: 84,
                    height: 84,
                    fit: BoxFit.contain,
                  )
                      : Image.asset(
                    imagePath,
                    width: 84,
                    height: 84,
                    fit: BoxFit.cover,
                    errorBuilder: (context, err, st) => Container(
                      width: 84,
                      height: 84,
                      color: ColorConstants.softBlue,
                      child: const Icon(Icons.image, size: 36),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // title + price
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["name"]!,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorConstants.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item["price"]!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorConstants.primaryOrange,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}