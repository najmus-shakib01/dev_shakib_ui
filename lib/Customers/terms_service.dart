import 'package:flutter/material.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5EE),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    const _TopIconSection(),

                    const SizedBox(height: 16),

                    Text(
                      "Terms of Service",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "Please review and accept our terms before\ncontinuing",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),

                    const SizedBox(height: 20),

                    const _TermsContentBox(),
                  ],
                ),
              ),
            ),

            const _BottomButton(),
          ],
        ),
      ),
    );
  }
}

class _TopIconSection extends StatelessWidget {
  const _TopIconSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ClipOval(
        child: Image.asset(
          "assets/terms_service/icon/pen.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TermsContentBox extends StatelessWidget {
  const _TermsContentBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _TermItem(
            title: "1. User Agreement",
            description:
                "By accessing or using ReferralHub, you agree to be bound by these "
                "Terms of Service and all applicable laws and regulations.",
          ),
          SizedBox(height: 20),
          _TermItem(
            title: "2. Referral Program",
            description:
                "Users may earn rewards by referring others to services offered "
                "through our platform. All referrals must comply with our guidelines "
                "and applicable laws.",
          ),
          SizedBox(height: 20),
          _TermItem(
            title: "3. Privacy Policy",
            description:
                "We collect and process personal information as described in our "
                "Privacy Policy. By using ReferralHub, you consent to such processing "
                "and warrant that all data provided is accurate.",
          ),
          SizedBox(height: 20),
          _TermItem(
            title: "4. User Conduct",
            description:
                "You agree not to use our platform for any unlawful purpose or in "
                "any way that could damage, disable, or impair the service.",
          ),
          SizedBox(height: 20),
          _TermItem(
            title: "5. Limitation of Liability",
            description:
                "ReferralHub shall not be liable for any indirect, incidental, "
                "special, consequential or punitive damages resulting from your use "
                "or inability to use the service.",
          ),
          SizedBox(height: 20),
          _TermItem(
            title: "6. Termination",
            description:
                "We reserve the right to terminate or suspend your account and "
                "access to the service at our sole discretion, without notice, for "
                "conduct that we believe violates these Terms of Service.",
          ),
        ],
      ),
    );
  }
}

class _TermItem extends StatelessWidget {
  final String title;
  final String description;

  const _TermItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey[800], height: 1.4),
        ),
      ],
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 10, 22, 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7A00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'By clicking "Continue", you acknowledge that you have read\nand understood our Terms of Service and Privacy Policy.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
