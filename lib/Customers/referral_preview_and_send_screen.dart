import 'package:flutter/material.dart';

class ReferralPreviewAndSendScreen extends StatelessWidget {
  const ReferralPreviewAndSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        242,
        239,
        231,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _HeaderSection(),
              SizedBox(height: 20),
              _MainWhiteCard(),
              SizedBox(height: 30),
              _ReferralDetailsCard(),
              SizedBox(height: 30),
              _SendMessageButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Preview and Send",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "Check your message and send to your referral.",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }
}

class _MainWhiteCard extends StatelessWidget {
  const _MainWhiteCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const [
          _ReceiverSection(),
          SizedBox(height: 20),
          _GrayMessageBox(),
          SizedBox(height: 20),
          _ConvertSolarBlock(),
          SizedBox(height: 20),
          _LargePreviewIcon(),
        ],
      ),
    );
  }
}

class _ReceiverSection extends StatelessWidget {
  const _ReceiverSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // initials avatar
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              "JD",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "To: James Davis",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Text(
              "+1 (555) 123-4567",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

class _GrayMessageBox extends StatelessWidget {
  const _GrayMessageBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF0F0F0),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Text(
        "Hi James, I just got new Solar Panels installed by Convert Solar and they "
        "are working amazing. My power bill is literally \$7. The install was fast, "
        "easy, and I'm already saving money on my power bill. You should 100% talk "
        "to them and see if it makes sense for your house.",
        style: TextStyle(fontSize: 16, height: 1.35, color: Colors.black87),
      ),
    );
  }
}

class _ConvertSolarBlock extends StatelessWidget {
  const _ConvertSolarBlock();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(
          255,
          242,
          239,
          231,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.wb_sunny, size: 32, color: Colors.orange),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Convert Solar",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                "Solar Services",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LargePreviewIcon extends StatelessWidget {
  const _LargePreviewIcon();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: 210,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(Icons.home_work, size: 130, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(Icons.attachment, color: Colors.grey),
            SizedBox(width: 6),
            Text(
              "1 attachment",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

class _ReferralDetailsCard extends StatelessWidget {
  const _ReferralDetailsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Text(
                "Referral details",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8), 
              Icon(Icons.edit_square, size: 24, color: Color(0xff635BFF)),
            ],
          ),

          SizedBox(height: 20),

          _DetailRow(label: "Company", value: "Convert Solar"),
          _DetailRow(label: "Referral Name", value: "James Davis"),
          _DetailRow(label: "Email", value: "jw@gmail.com"),
          _DetailRow(label: "Phone", value: "+1 (555) 123-4567"),
          _DetailRow(label: "Address", value: "Jacksonville, FL"),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _SendMessageButton extends StatelessWidget {
  const _SendMessageButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFF6A00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Send Message",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        const Center(
          child: Text(
            "This will open your phone's messaging app",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
