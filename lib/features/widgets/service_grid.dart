import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  // Dynamic list — replace image paths with your actual asset filenames
  static final List<Map<String, String>> _services = [
    {"name": "Beauty Salon", "image": "assets/images/spa.png"},
    {"name": "Plumber", "image": "assets/images/plumber.png"},
    {"name": "Cleaner", "image": "assets/images/cleaner.png"},
    {"name": "Chef", "image": "assets/images/lady_chef.png"},
    {"name": "Laundry", "image": "assets/images/laundry.png"},
    {"name": "AC Service", "image": "assets/images/ac_service.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // larger cards (2 columns)
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.05,
      ),
      itemBuilder: (context, index) {
        final s = _services[index];
        return GestureDetector(
          onTap: () {
            // navigate to category / service page
            // context.go('/categories'); // uncomment when router is available
          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstants.cardBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorConstants.border),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // top image fills roughly 60%
                Expanded(
                  flex: 6,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Container(
                      width: double.infinity,
                      color: ColorConstants.softBlue.withOpacity(0.35),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          s["image"]!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, err, st) => const Icon(Icons.work_outline),
                        ),
                      ),
                    ),
                  ),
                ),

                // bottom title
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      s["name"]!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorConstants.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}