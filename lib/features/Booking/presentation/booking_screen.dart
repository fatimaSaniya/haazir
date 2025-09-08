import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/color_constants.dart';
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
      "status": "Confirmed",
      "price": "₹499",
      "icon": "assets/images/cleaning.json",
    },
    {
      "service": "Plumber Visit",
      "date": "Sep 8, 2025",
      "time": "4:00 PM",
      "status": "Pending",
      "price": "₹299",
      "icon": "assets/images/plumber.png",
    },
  ];

  static final List<Map<String, dynamic>> _pastBookings = [
    {
      "service": "Sofa Cleaning",
      "date": "Aug 20, 2025",
      "time": "1:00 PM",
      "status": "Completed",
      "price": "₹799",
      "icon": "assets/images/cleaning.json",
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
      backgroundColor: ColorConstants.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Gradient Header
              Container(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorConstants.primaryBlue.withOpacity(0.7),
                      ColorConstants.primaryOrange.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextConstants.myBookings,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Track your upcoming & past services",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Lottie.asset("assets/images/calendar.json", height: 60),
                  ],
                ),
              ),

              // 🔹 Tabs
              TabBar(
                controller: _tabController,
                labelColor: ColorConstants.primaryBlue,
                unselectedLabelColor: ColorConstants.textSecondary,
                indicatorColor: ColorConstants.primaryOrange,
                tabs: const [
                  Tab(text: "Upcoming"),
                  Tab(text: "Past"),
                ],
              ),

              // 🔹 Tab Content with fixed height
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    50 - // top padding of header
                    20 - // bottom padding of header
                    60 - // estimated height of TabBar
                    200, // optional extra space if needed for safe area / margins
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
        ),
    );
  }

  Widget _buildBookingList(List<Map<String, dynamic>> bookings) {
    if (bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/no_bookings.json", height: 180),
            const SizedBox(height: 12),
            Text(
              "No bookings yet",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorConstants.textSecondary,
              ),
            ),
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
                    Text(
                      item["service"],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${item["date"]} • ${item["time"]}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ColorConstants.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item["price"],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.primaryOrange,
                    ),
                  ),
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

  Color _getColor() {
    switch (status) {
      case "Confirmed":
        return ColorConstants.success;
      case "Pending":
        return ColorConstants.primaryBlue;
      case "Completed":
        return Colors.grey;
      case "Cancelled":
        return Colors.red;
      default:
        return ColorConstants.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: _getColor(),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}