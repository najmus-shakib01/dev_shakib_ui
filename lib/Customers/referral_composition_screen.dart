import 'dart:ui';

import 'package:flutter/material.dart';

class ReferralCompositionScreen extends StatelessWidget {
  const ReferralCompositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4E9),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Column(
          children: [
            Container(
              color: const Color(0xFFF8F4E9),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/referral_composition_screen/image/referable_logo.png",
                    height: 32,
                  ),
                  Image.asset(
                    "assets/referral_composition_screen/icon/menu.png",
                    height: 26,
                  ),
                ],
              ),
            ),

            Container(height: 1, color: Colors.black.withOpacity(0.12)),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 20),
            _TitleSection(),
            SizedBox(height: 20),
            _MessageTemplateCard(),
            SizedBox(height: 20),
            _AddMediaSection(),
            SizedBox(height: 20),
            _AutoAddLinkBanner(),
            SizedBox(height: 30),
            _PreviewSendButton(),
            SizedBox(height: 45),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 85,
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navItem(
                "assets/referral_composition_screen/icon/home.png",
                "Home",
                false,
              ),
              _navItem(
                "assets/referral_composition_screen/icon/leaderboard.png",
                "Leaderboard",
                false,
              ),
              _activeReferItem(),
              _navItem(
                "assets/referral_composition_screen/icon/earnings.png",
                "Earnings",
                false,
              ),
              _navItem(
                "assets/referral_composition_screen/icon/profile.png",
                "Profile",
                false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const Color appPrimaryOrange = Color(0xFFFF5C1C);
  static const Color appYellowCircle = Color(0xFFFFC13A);

  static Widget _navItem(String iconPath, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          width: 26,
          height: 26,
          color: active ? appPrimaryOrange : null,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: active ? appPrimaryOrange : Colors.black87,
          ),
        ),
      ],
    );
  }

  static Widget _activeReferItem() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            color: appYellowCircle,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              "assets/referral_composition_screen/icon/refer.png",
              width: 26,
              height: 26,
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Refer",
          style: TextStyle(
            fontSize: 13,
            color: appPrimaryOrange,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Compose Your Referral",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 6),
        Text(
          "Customize your message to make it more personal",
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
      ],
    );
  }
}

class _MessageTemplateCard extends StatelessWidget {
  const _MessageTemplateCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Message Template",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F2F0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Hi James, I just got new Solar Panels installed by Convert Solar and they are "
              "working amazing. My power bill is literally \$7. The install was fast, easy, "
              "and I'm already saving money on my power bill. You should 100% talk to them "
              "and see if it makes sense for your house.",
              style: TextStyle(fontSize: 15, height: 1.4),
            ),
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Characters: 165/320",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddMediaSection extends StatelessWidget {
  const _AddMediaSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Media",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _MediaIconTile(
                iconPath: "assets/referral_composition_screen/icon/camera.png",
                label: "Camera",
              ),
              _MediaIconTile(
                iconPath: "assets/referral_composition_screen/icon/gallery.png",
                label: "Gallery",
              ),
              _MediaIconTile(
                iconPath:
                    "assets/referral_composition_screen/icon/templates.png",
                label: "Templates",
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: const [
              _MediaPreviewTile(
                imagePath:
                    "assets/referral_composition_screen/image/solar_house.png",
              ),
              SizedBox(width: 12),
              _MediaPreviewTile(
                imagePath:
                    "assets/referral_composition_screen/image/solar_poster.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MediaIconTile extends StatelessWidget {
  final String iconPath;
  final String label;

  const _MediaIconTile({required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(),
      child: Container(
        width: 95,
        height: 85,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 32),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 6;
    double dashSpace = 4;

    final paint = Paint()
      ..color = const Color(0xFFFFC467)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(14),
    );

    Path borderPath = Path()..addRRect(rect);

    Path metricPath = Path();
    for (PathMetric metric in borderPath.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        metricPath.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(metricPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MediaPreviewTile extends StatelessWidget {
  final String imagePath;

  const _MediaPreviewTile({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 110,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 150,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red.shade400,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(Icons.close, size: 14, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _AutoAddLinkBanner extends StatelessWidget {
  const _AutoAddLinkBanner();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF7DD),
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 10,
            decoration: BoxDecoration(
              color: const Color(0xFFFFA41C),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        Positioned(
          left: 14,
          top: 0,
          bottom: 0,
          child: Image.asset(
            "assets/referral_composition_screen/icon/info.png",
            width: 28,
          ),
        ),

        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(left: 58, right: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Your referral link will be automatically added to the message",
                style: TextStyle(fontSize: 15, height: 1.3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PreviewSendButton extends StatelessWidget {
  const _PreviewSendButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF5C1C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Preview & Send",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
