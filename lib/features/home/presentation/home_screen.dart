import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';
import '../widgets/service_grid.dart';
import '../widgets/trending_services.dart';
import '../widgets/most_liked_services.dart';
import '../widgets/offers_card.dart';
import '../widgets/refer_earn_card.dart';
import '../widgets/search_ticker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold background uses the soft orangish tint from ColorConstants
    return Scaffold(
      backgroundColor: ColorConstants.background,
      appBar: AppBar(
        backgroundColor: ColorConstants.softOrange,
        elevation: 0,
        title: Text(
          TextConstants.greeting,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ColorConstants.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
            color: ColorConstants.textPrimary,
          ),
          const SizedBox(width: 8),
        ],
      ),

      // Everything scrolls — prevents RenderFlex overflow
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SEARCH + ROTATING SUGGESTIONS
            const _SearchArea(),
            const SizedBox(height: 20),

            // SERVICES GRID
            Text(
              TextConstants.serviceTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorConstants.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            const ServiceGrid(), // uses your images
            const SizedBox(height: 20),

            // TRENDING (horizontal scroll)
            Text(
              TextConstants.trendingTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorConstants.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            const TrendingServices(),
            const SizedBox(height: 20),

            // MOST LIKED
            Text(
              TextConstants.mostLikedTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorConstants.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            const MostLikedServices(),
            const SizedBox(height: 20),

            // BIG OFFER CARD
            const OffersCard(),
            const SizedBox(height: 20),

            // REFER & EARN
            const ReferEarnCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

/// Search area with a search text field and the rotating suggestion below it
class _SearchArea extends StatelessWidget {
  const _SearchArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search box
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.cardBackground,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const TextField(
            decoration: InputDecoration(
              hintText: TextConstants.searchHint,
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Rotating suggestions ticker (auto changes)
        const SizedBox(
          height: 20,
          child: Row(
            children: [
              Icon(Icons.flash_on, size: 18, color: ColorConstants.primaryOrange),
              SizedBox(width: 8),
              Expanded(child: SuggestionTicker()), // custom widget cycles through TextConstants.serviceSuggestions
            ],
          ),
        ),
      ],
    );
  }
}