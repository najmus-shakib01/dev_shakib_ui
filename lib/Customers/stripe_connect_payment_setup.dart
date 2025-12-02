import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFFFF7EB);
  static const Color primary = Color(0xFFFF6A24);
  static const Color primaryDark = Color(0xFFE4571F);
  static const Color brandCircle = Color(0xFFFFB028);
  static const Color cardBackground = Colors.white;
  static const Color bannerBackground = Color(0xFFFFF3D9);
  static const Color bannerStripe = Color(0xFFFFA41C);
  static const Color accentYellow = Color(0xFFFFC94D);
  static const Color textPrimary = Color(0xFF171717);
  static const Color textSecondary = Color(0xFF4F4F4F);
  static const Color divider = Color(0xFFE3E3E3);
  static const Color progressActive = Color(0xFFFF6A24);
  static const Color progressInactive = Color(0xFFFFDEAA);
  static const Color backButtonBackground = Color(0xFFFFF0E4);
  static const Color backButtonBorder = Color(0xFFFF9551);
}

class AppTextStyles {
  static const TextStyle screenTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle screenSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  static const TextStyle buttonPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle buttonSecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
}

class StripeConnectPaymentSetupScreen extends StatelessWidget {
  const StripeConnectPaymentSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              _PageHeader(),
              SizedBox(height: 24),
              _ProgressBar(),
              SizedBox(height: 24),
              _ConnectAccountCard(),
              SizedBox(height: 16),
              _InfoBanner(),
              SizedBox(height: 16),
              _WhatYouNeedCard(),
              SizedBox(height: 16),
              _FaqCard(),
              SizedBox(height: 24),
              _FooterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          height: 96,
          width: 96,
          decoration: const BoxDecoration(
            color: AppColors.brandCircle,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text(
            'S',
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Connect with Stripe',
          textAlign: TextAlign.center,
          style: AppTextStyles.screenTitle,
        ),
        const SizedBox(height: 8),
        const Text(
          'Step 2 of 3: Set up your payout method',
          textAlign: TextAlign.center,
          style: AppTextStyles.screenSubtitle,
        ),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _ProgressSegment(isActive: true),
        SizedBox(width: 8),
        _ProgressSegment(isActive: true),
        SizedBox(width: 8),
        _ProgressSegment(isActive: false),
      ],
    );
  }
}

class _ProgressSegment extends StatelessWidget {
  final bool isActive;

  const _ProgressSegment({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 8,
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.progressActive
              : AppColors.progressInactive,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class _BaseCard extends StatelessWidget {
  final Widget child;

  const _BaseCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: child,
      ),
    );
  }
}

class _ConnectAccountCard extends StatelessWidget {
  const _ConnectAccountCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  color: AppColors.accentYellow,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.link, size: 18, color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Connect Your Account',
                  style: AppTextStyles.cardTitle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Stripe Connect allows us to send your earnings directly '
            'to your bank account securely.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 20),
          const _PrimaryFullWidthButton(label: 'Connect with Stripe'),
        ],
      ),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  const _InfoBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bannerBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 5,
            height: 72,
            decoration: const BoxDecoration(
              color: AppColors.bannerStripe,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.info, size: 20, color: AppColors.bannerStripe),
                SizedBox(width: 10),
                SizedBox(
                  width: 260,
                  child: Text(
                    "You'll need to complete this step to "
                    'receive payments',
                    style: AppTextStyles.body,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WhatYouNeedCard extends StatelessWidget {
  const _WhatYouNeedCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("What You'll Need", style: AppTextStyles.cardTitle),
          SizedBox(height: 14),
          _ChecklistItem(text: 'Personal identification (ID, passport)'),
          SizedBox(height: 12),
          _ChecklistItem(text: 'Bank account information'),
          SizedBox(height: 12),
          _ChecklistItem(text: 'Address verification'),
        ],
      ),
    );
  }
}

class _ChecklistItem extends StatelessWidget {
  final String text;

  const _ChecklistItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
            color: AppColors.accentYellow,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, size: 14, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _FaqCard extends StatelessWidget {
  const _FaqCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Frequently Asked Questions',
            style: AppTextStyles.cardTitle,
          ),
          SizedBox(height: 20),

          _FaqBlock(
            question: 'Is my information secure?',
            answer:
                'Yes, all data is encrypted and securely transmitted to Stripe. '
                'We never store your banking details.',
          ),
          SizedBox(height: 12),
          _DashedLikeDivider(),
          SizedBox(height: 12),

          _FaqBlock(
            question: 'How long does verification take?',
            answer:
                'Most accounts are verified instantly. In some cases, it may '
                'take 1-2 business days.',
          ),
          SizedBox(height: 12),
          _DashedLikeDivider(),
          SizedBox(height: 12),

          _FaqBlock(
            question: 'When will I receive my payments?',
            answer:
                'Once verified, payments are processed within 7 days of earning '
                'a referral bonus.',
          ),
          SizedBox(height: 12),
          _DashedLikeDivider(),
          SizedBox(height: 12),

          _FaqBlock(
            question: 'Having trouble?',
            answer:
                'Contact our support team at\nsupport@referalble.com',
          ),
        ],
      ),
    );
  }
}

class _FaqBlock extends StatefulWidget {
  final String question;
  final String answer;

  const _FaqBlock({
    required this.question,
    required this.answer,
  });

  @override
  State<_FaqBlock> createState() => _FaqBlockState();
}

class _FaqBlockState extends State<_FaqBlock> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => isExpanded = !isExpanded),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.question,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),

              AnimatedRotation(
                turns: isExpanded ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.expand_more,
                  size: 22,
                  color: AppColors.bannerStripe,
                ),
              ),
            ],
          ),

          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                widget.answer,
                style: AppTextStyles.body,
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}

class _DashedLikeDivider extends StatelessWidget {
  const _DashedLikeDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: const BoxDecoration(color: AppColors.divider),
    );
  }
}

class _FooterButtons extends StatelessWidget {
  const _FooterButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _PrimaryFullWidthButton(label: 'Continue'),
        SizedBox(height: 14),
        _SecondaryFullWidthButton(label: 'Back'),
      ],
    );
  }
}

class _PrimaryFullWidthButton extends StatelessWidget {
  final String label;

  const _PrimaryFullWidthButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: AppColors.primaryDark.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(label, style: AppTextStyles.buttonPrimary),
      ),
    );
  }
}

class _SecondaryFullWidthButton extends StatelessWidget {
  final String label;

  const _SecondaryFullWidthButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.backButtonBackground,
          side: const BorderSide(color: AppColors.backButtonBorder, width: 1.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(label, style: AppTextStyles.buttonSecondary),
      ),
    );
  }
}
