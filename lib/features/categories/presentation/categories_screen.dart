import 'dart:async';
import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/image_constant.dart';
import '../../../constants/string_constants.dart';
import '../../../constants/text_constants.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController();
  Timer? _autoScrollTimer;

  static final List<Map<String, String>> _allCategories = [
    {"name": "Painter", "tagline": "Give walls life", "icon": ImageConstants.hazeerLady},
    {"name": "Cleaner", "tagline": "Sparkling homes", "icon": ImageConstants.cleanerIcon},
    {"name": "Plumber", "tagline": "Fix leaks instantly", "icon": ImageConstants.plumberIcon},
    {"name": "Chef", "tagline": "Taste at home", "icon": ImageConstants.vegChefBoy},
    {"name": "Electrician", "tagline": "Power solutions", "icon": ImageConstants.electricianIcon},
    {"name": "Beauty Salon", "tagline": "Style & Grooming", "icon": ImageConstants.spaIcon},
  ];

  late List<Map<String, String>> _filteredCategories;

  @override
  void initState() {
    super.initState();
    _filteredCategories = _allCategories;

    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        _filteredCategories = _allCategories
            .where((cat) => cat["name"]!.toLowerCase().contains(query))
            .toList();
      });
    });

    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.round() + 1;
        if (nextPage >= 2) nextPage = 0;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pageController.dispose();
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.background,
      appBar: AppBar(
        centerTitle: true,
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
          StringConstants.categories,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // 🔹 Search field
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConstants.cardBackground,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: StringConstants.searchCategoriesHint,
                    prefixIcon: Icon(Icons.search, color: ColorConstants.textSecondary),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ),
              ),
            ),
          ),

          // 🔹 Promo banners
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 150,
                child: PageView(
                  controller: _pageController,
                  children: const [
                    _PromoBanner(
                      title: StringConstants.promoFirstBookingTitle,
                      subtitle: StringConstants.promoFirstBookingSubtitle,
                    ),
                    _PromoBanner(
                      title: StringConstants.promoReferTitle,
                      subtitle: StringConstants.promoReferSubtitle,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // 🔹 Category grid or empty state
          _filteredCategories.isEmpty
              ? const SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_off, size: 100, color: ColorConstants.textSecondary),
                SizedBox(height: 16),
                Text(StringConstants.noCategoriesFound, style: TextConstants.emptyState),
              ],
            ),
          )
              : SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final item = _filteredCategories[index];
                  return _CategoryCard(
                    title: item["name"]!,
                    tagline: item["tagline"]!,
                    icon: item["icon"]!,
                  );
                },
                childCount: _filteredCategories.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final String tagline;
  final String icon;

  const _CategoryCard({required this.title, required this.tagline, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstants.softOrange.withOpacity(0.3),
            ColorConstants.softBlue.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(icon, fit: BoxFit.contain)),
          const SizedBox(height: 6),
          Text(title, textAlign: TextAlign.center, style: TextConstants.sectionTitle),
          const SizedBox(height: 3),
          Text(tagline, textAlign: TextAlign.center, style: TextConstants.subtitle),
        ],
      ),
    );
  }
}

class _PromoBanner extends StatelessWidget {
  final String title;
  final String subtitle;

  const _PromoBanner({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstants.primaryBlue.withOpacity(0.15),
            ColorConstants.primaryOrange.withOpacity(0.15),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextConstants.sectionTitle),
                  const SizedBox(height: 6),
                  Text(subtitle, style: TextConstants.subtitle),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Icon(Icons.local_offer, size: 48, color: ColorConstants.textSecondary),
          ),
        ],
      ),
    );
  }
}