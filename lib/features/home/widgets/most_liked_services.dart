import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/color_constants.dart';

class MostLikedServices extends StatelessWidget {
  const MostLikedServices({super.key});

  static final List<Map<String, dynamic>> _items = [
    {"name": "Full-time Maid", "rating": 4.9, "image": "assets/images/cleaning.json"},
    {"name": "Babysitting", "rating": 4.8, "image": "assets/images/Baby.json"},
    {"name": "Chef", "rating": 4.7, "image": "assets/images/kitchen.json"}, // fallback icon
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = _items[index];
          return _ServiceCard(
            name: item["name"],
            rating: item["rating"],
            image: item["image"],
          );
        },
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String name;
  final double rating;
  final String? image;

  const _ServiceCard({
    required this.name,
    required this.rating,
    this.image,
  });

  Widget _buildAsset() {
    if (image == null) {
      return const Icon(Icons.person, size: 40, color: Colors.orange);
    } else if (image!.endsWith(".json")) {
      return Lottie.asset(image!, fit: BoxFit.cover);
    } else {
      return Image.asset(image!, fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstants.softBlue.withOpacity(0.25),
            ColorConstants.softOrange.withOpacity(0.25),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorConstants.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image / Animation / Placeholder
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: ColorConstants.softBlue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _buildAsset(),
            ),
          ),
          const SizedBox(height: 12),

          // Title
          Text(
            name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: ColorConstants.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),

          // Rating badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: ColorConstants.primaryOrange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '⭐ $rating',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorConstants.primaryOrange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}