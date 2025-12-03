import 'package:flutter/material.dart';

class HelpAndFaqScreen extends StatefulWidget {
  const HelpAndFaqScreen({super.key});

  @override
  State<HelpAndFaqScreen> createState() => _HelpAndFaqScreenState();
}

class _HelpAndFaqScreenState extends State<HelpAndFaqScreen> {
  final List<bool> faqExpandState = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4), 
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 20),
              const SearchBox(),
              const SizedBox(height: 25),
              const PopularTopicsWrapper(),
              const SizedBox(height: 30),
              FaqSection(
                expandState: faqExpandState,
                onToggle: (index) {
                  setState(() {
                    faqExpandState[index] = !faqExpandState[index];
                  });
                },
              ),
              const SizedBox(height: 30),
              const SupportContactBox(),
              const SizedBox(height: 25),
              const BackButtonSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}


class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Help & FAQ",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Text(
          "Find answers to common questions & get support",
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Text(
              "Search for help topics",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Icon(Icons.search, color: Colors.grey),
        ],
      ),
    );
  }
}

class PopularTopicsWrapper extends StatelessWidget {
  const PopularTopicsWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08), 
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: const PopularTopicsSection(),
    );
  }
}

class PopularTopicsSection extends StatelessWidget {
  const PopularTopicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular Topics",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 18),
        Row(
          children: const [
            Expanded(
              child: TopicBox(
                title: "Stripe Setup",
                icon: Icons.credit_card,
                bgColor: Color(0xFFFFF3D6),
                iconColor: Color(0xFFF3B500),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: TopicBox(
                title: "Track Referrals",
                icon: Icons.assessment,
                bgColor: Color(0xFFF5ECFF),
                iconColor: Color(0xFFBC7DF3),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: const [
            Expanded(
              child: TopicBox(
                title: "Payment",
                icon: Icons.monetization_on,
                bgColor: Color(0xFFFFE6E0),
                iconColor: Color(0xFFE25940),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: TopicBox(
                title: "Invite Friends",
                icon: Icons.group,
                bgColor: Color(0xFFFFEAEA),
                iconColor: Color(0xFFE9606E),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TopicBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  const TopicBox({
    super.key,
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: bgColor,
              child: Icon(icon, color: iconColor, size: 26),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqSection extends StatelessWidget {
  final List<bool> expandState;
  final Function(int) onToggle;

  const FaqSection({
    super.key,
    required this.expandState,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 10),
            child: Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _faqItem(
            index: 0,
            title: "How do I set up my Stripe account?",
            expanded: expandState[0],
          ),
          _faqItem(
            index: 1,
            title: "Where can I see my referral status?",
            expanded: expandState[1],
          ),
          _faqItem(
            index: 2,
            title: "When will I receive my referral payments?",
            expanded: expandState[2],
          ),
          _faqItem(
            index: 3,
            title: "How do I change my profile information?",
            expanded: expandState[3],
          ),
        ],
      ),
    );
  }

  Widget _faqItem({required int index, required String title, required bool expanded}) {
    const Color arrowColor = Color(0xFFFFA84C); 

    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: arrowColor,
            size: 28,
          ),
          onTap: () => onToggle(index),
        ),

        if (expanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "This is example expanded content for: $title",
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),

        Divider(height: 1, color: Colors.grey.shade300),
      ],
    );
  }
}

class SupportContactBox extends StatelessWidget {
  const SupportContactBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4E6),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.support_agent, size: 30, color: Colors.orange),
              SizedBox(width: 10),
              Text(
                "Need more help?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Our support team is ready to assist you with any questions",
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                "Contact Support",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackButtonSection extends StatelessWidget {
  const BackButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFFFEFE0),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: const Center(
        child: Text(
          "Back",
          style: TextStyle(
            fontSize: 18,
            color: Colors.orange,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
