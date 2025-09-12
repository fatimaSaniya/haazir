import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/string_constants.dart';
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
    return Scaffold(
      backgroundColor: ColorConstants.background,
      appBar: AppBar(
        centerTitle: true,
        // Gradient background
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstants.primaryBlue.withOpacity(0.8),
                ColorConstants.primaryOrange.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          StringConstants.greeting,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
            color: Colors.white,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent, // so gradient shows
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SearchArea(),
            const SizedBox(height: 20),

            Text(
              StringConstants.serviceTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorConstants.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            const ServiceGrid(),
            const SizedBox(height: 20),

            Text(
              StringConstants.trendingTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorConstants.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            const TrendingServices(),
            const SizedBox(height: 20),

            Text(
              StringConstants.mostLikedTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorConstants.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            const MostLikedServices(),
            const SizedBox(height: 20),

            const OffersCard(),
            const SizedBox(height: 20),

            const ReferEarnCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _SearchArea extends StatelessWidget {
  const _SearchArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              hintText: StringConstants.searchHint,
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const SizedBox(
          height: 20,
          child: Row(
            children: [
              Icon(Icons.flash_on, size: 18, color: ColorConstants.primaryOrange),
              SizedBox(width: 8),
              Expanded(child: SuggestionTicker()),
            ],
          ),
        ),
      ],
    );
  }
}
