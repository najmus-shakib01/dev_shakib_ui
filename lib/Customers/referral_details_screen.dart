import 'package:flutter/material.dart';

class ReferralDetailsScreen extends StatelessWidget {
  const ReferralDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            TopBar(),
            Expanded(child: ReferralDetailsBody()),
            BottomNavigationBarWidget(),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/referral_details_screen/image/referable_logo.png',
            height: 24,
          ),
          Image.asset(
            'assets/referral_details_screen/icon/menu.png',
            height: 24,
          ),
        ],
      ),
    );
  }
}

class ReferralDetailsBody extends StatelessWidget {
  const ReferralDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Referral Details",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFFFB830),
                        radius: 30,
                        child: const Text(
                          'JD',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'James Davis',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'james.davis@example.com',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F6EC),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Active',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30),
                  infoRow("Referred on", "May 12, 2023"),
                  infoRow("Company", "EcoSmart Solutions"),
                  infoRow(
                    "Potential Reward",
                    "\$275.00",
                    valueColor: Color(0xFFFF9800),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Activities",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ActivityTimeline(),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity, // Match card width
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Color(0xFFFF6D00)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xFFFFF3EA),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Color(0xFFFF6D00), fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget infoRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityTimeline extends StatelessWidget {
  final activities = const [
    {
      'title': 'Accepted Referral',
      'time': 'Yesterday, 10:30 AM',
      'desc':
          'Your referral of Sarah Johnson has been accepted. \$25 is on the way to your account. We will make contact with them within 24 hours.',
    },
    {
      'title': 'Successful Referral',
      'time': 'Today, 2:15 PM',
      'desc':
          'Referral #RF28375 has been successfully converted to a paying customer. Your commission of \$250 is on the way!',
    },
  ];

  const ActivityTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Vertical orange line
        Positioned(
          left: 10,
          top: 10,
          bottom: 0,
          child: Container(width: 4, color: Colors.orange),
        ),
        Column(
          children: List.generate(activities.length, (index) {
            final item = activities[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dot
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Card
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              item['time']!,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['desc']!,
                          style: const TextStyle(fontSize: 15, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem('assets/referral_details_screen/icon/home.png', 'Home'),
          navItem(
            'assets/referral_details_screen/icon/leaderboard.png',
            'Leaderboard',
          ),
          navItem(
            'assets/referral_details_screen/icon/refer.png',
            'Refer',
            isActive: true,
          ),
          navItem(
            'assets/referral_details_screen/icon/earnings.png',
            'Earnings',
          ),
          navItem('assets/referral_details_screen/icon/profile.png', 'Profile'),
        ],
      ),
    );
  }

  Widget navItem(String iconPath, String label, {bool isActive = false}) {
    if (isActive) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFB830),
            ),
            child: Image.asset(
              iconPath,
              height: 24,
              width: 24,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFB830),
            ),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, height: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      );
    }
  }
}
