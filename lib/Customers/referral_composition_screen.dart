import 'package:flutter/material.dart';

class ReferralCompositionScreen extends StatelessWidget {
  const ReferralCompositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4E9),
      body: SafeArea(
        child: SingleChildScrollView(
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
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
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
              "and i'm already saving money on my power bill. You should 100% talk to them "
              "and see if it makes sense for your house.",
              style: TextStyle(fontSize: 15, height: 1.4),
            ),
          ),
          const SizedBox(height: 10),
          Align(
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
              _MediaButton(icon: Icons.camera_alt, label: "Camera"),
              _MediaButton(icon: Icons.photo, label: "Gallery"),
              _MediaButton(icon: Icons.insert_drive_file, label: "Templates"),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: const [
              _MediaPreviewIconTile(),
              SizedBox(width: 12),
              _MediaPreviewIconTile(),
            ],
          ),
        ],
      ),
    );
  }
}

class _MediaButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MediaButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 85,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6E7),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFFFC467)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 26, color: const Color(0xFFFFA122)),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}

class _MediaPreviewIconTile extends StatelessWidget {
  const _MediaPreviewIconTile();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 110,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE9F1FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.photo, size: 40, color: Color(0xFF4A6FA5)),
            ),
          ),
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red.shade300,
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
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          Container(
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

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFA41C),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.info, size: 16, color: Colors.white),
              ),
            ),
          ),

          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(left: 56, right: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your referral link will be automatically "
                  "added to the message",
                  style: const TextStyle(fontSize: 15, height: 1.3),
                ),
              ),
            ),
          ),
        ],
      ),
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
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
      ),
    );
  }
}

