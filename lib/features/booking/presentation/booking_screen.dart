import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/image_constant.dart';
import '../../../constants/string_constants.dart';
import '../../../constants/text_constants.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static final List<Map<String, dynamic>> _upcomingBookings = [
    {
      "service": "Kitchen Cleaning",
      "date": "Sep 5, 2025",
      "time": "10:00 AM",
      "status": StringConstants.statusConfirmed,
      "price": "₹499",
      "icon": ImageConstants.cleaningAnimation,
    },
    {
      "service": "Plumber Visit",
      "date": "Sep 8, 2025",
      "time": "4:00 PM",
      "status": StringConstants.statusPending,
      "price": "₹299",
      "icon": ImageConstants.plumberIcon,
    },
  ];

  static final List<Map<String, dynamic>> _pastBookings = [
    {
      "service": "Sofa Cleaning",
      "date": "Aug 20, 2025",
      "time": "1:00 PM",
      "status": StringConstants.statusCompleted,
      "price": "₹799",
      "icon": ImageConstants.cleaningAnimation,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstants.primaryBlue.withOpacity(0.9),
                ColorConstants.primaryOrange.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          StringConstants.myBookings,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: ColorConstants.background,
      body: Column(
        children: [
          const SizedBox(height: 15),
          // 🔹 Tabs
          TabBar(
            controller: _tabController,
            labelColor: ColorConstants.primaryBlue,
            unselectedLabelColor: ColorConstants.textSecondary,
            indicatorColor: ColorConstants.primaryOrange,
            tabs: const [
              Tab(text: StringConstants.tabUpcoming),
              Tab(text: StringConstants.tabPast),
            ],
          ),

          // 🔹 Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildBookingList(_upcomingBookings),
                _buildBookingList(_pastBookings),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingList(List<Map<String, dynamic>> bookings) {
    if (bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(ImageConstants.noBookingsAnimation, height: 180),
            const SizedBox(height: 12),
            const Text(StringConstants.bookingEmpty, style: TextConstants.emptyState),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = bookings[index];
        final isJson = item["icon"].toString().endsWith(".json");

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstants.softBlue.withOpacity(0.4),
                ColorConstants.softOrange.withOpacity(0.4),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: isJson
                    ? Lottie.asset(item["icon"], fit: BoxFit.contain)
                    : Image.asset(item["icon"], fit: BoxFit.contain),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item["service"], style: TextConstants.sectionTitle),
                    const SizedBox(height: 4),
                    Text("${item["date"]} • ${item["time"]}", style: TextConstants.subtitle),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(item["price"], style: TextConstants.price),
                  const SizedBox(height: 6),
                  _StatusChip(status: item["status"]),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// 🔹 Status Chip Widget
class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> statusColors = {
      StringConstants.statusConfirmed: ColorConstants.success,
      StringConstants.statusPending: ColorConstants.primaryBlue,
      StringConstants.statusCompleted: Colors.grey,
      StringConstants.statusCancelled: Colors.red,
    };

    final color = statusColors[status] ?? ColorConstants.textSecondary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(status, style: TextConstants.chipLabel.copyWith(color: color)),
    );
  }
}