import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color background = Color(0xFFFFFDF5);
  static const Color cardBackground = Colors.white;
  static const Color cardBorder = Color(0xFFEDE9E0);
  static const Color primaryOrange = Color(0xFFFC5C1B);
  static const Color primaryText = Color(0xFF151515);
  static const Color secondaryText = Color(0xFF666666);
  static const Color lightText = Color(0xFF9A9A9A);
  static const Color activePillBg = Color(0xFFE7F8EC);
  static const Color activePillText = Color(0xFF0A772D);
  static const Color warningRed = Color(0xFFE53935);
  static const Color shadowColor = Color(0x14000000);
  static const Color progressTrack = Color(0xFFEAEAEA);
  static const Color statPendingBg = Color(0xFFFFF4EA);
  static const Color statCompletedBg = Color(0xFFE9F8EE);
  static const Color statEarnedBg = Color(0xFFF4F3FF);
}

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );

  static const TextStyle cardBody = TextStyle(
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
  );

  static const TextStyle captionRegular = TextStyle(
    fontSize: 12,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.lightText,
  );

  static const TextStyle smallBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );

  static const TextStyle statNumberPending = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryOrange,
  );

  static const TextStyle statNumberCompleted = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: Color(0xFF128C3A),
  );

  static const TextStyle statNumberEarned = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Color(0xFFF29B05),
  );

  static const TextStyle statLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
  );
}

class ReferralEarningsDashboardPage extends StatelessWidget {
  const ReferralEarningsDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const _TopBar(),

            // ---------- ADD THIS DIVIDER ----------
            Container(
              width: double.infinity,
              height: 1,
              color: Color(0xFFE5E5E5), // Approx border color (light grey)
            ),

            // -------------------------------------
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: const [
                    _ServiceCard(),
                    SizedBox(height: 18),
                    _CurrentIncentiveCard(),
                    SizedBox(height: 18),
                    _ReferralStatsCard(),
                    SizedBox(height: 24),
                    _ReferButton(),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _CustomBottomNavBar(),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Row(
        children: [
          Image.asset(
            'assets/company_single_screen/image/referable_logo.png',
            height: 28,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          Image.asset(
            'assets/company_single_screen/icon/menu.png',
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Row(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
            child: Image.asset(
              'assets/company_single_screen/icon/solar_service.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Convert Solar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Solar Service',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          const _ActivePill(),
        ],
      ),
    );
  }
}

class _ActivePill extends StatelessWidget {
  const _ActivePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.activePillBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Text(
        'Active',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.activePillText,
        ),
      ),
    );
  }
}

class _CurrentIncentiveCard extends StatelessWidget {
  const _CurrentIncentiveCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(
                child: Text(
                  'Current Incentive',
                  style: AppTextStyles.cardTitle,
                ),
              ),
              Text(
                'Ends in 14 days',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.warningRed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Earn \$250 bonus dollars after you refer 25 friends.',
            style: AppTextStyles.cardBody,
          ),
          const SizedBox(height: 14),
          const _DottedDivider(),
          const SizedBox(height: 14),
          Row(
            children: const [
              Expanded(
                child: Text(
                  'Your progress',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                  ),
                ),
              ),
              Text(
                '22/25 referrals',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const _ProgressBar(value: 22 / 25),
          const SizedBox(height: 8),
          const Text(
            '3 More referrals to reach a \$250 bonus',
            style: AppTextStyles.captionRegular,
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final double value;

  const _ProgressBar({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.progressTrack,
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth * value.clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: AppColors.primaryOrange,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DottedDivider extends StatelessWidget {
  const _DottedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dotCount = (constraints.maxWidth / 6).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dotCount,
            (index) =>
                Container(width: 3, height: 1, color: const Color(0xFFE0E0E0)),
          ),
        );
      },
    );
  }
}

class _ReferralStatsCard extends StatelessWidget {
  const _ReferralStatsCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Referral Stats', style: AppTextStyles.cardTitle),
          SizedBox(height: 16),
          _ReferralStatsRow(),
        ],
      ),
    );
  }
}

class _ReferralStatsRow extends StatelessWidget {
  const _ReferralStatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _StatTile(
            backgroundColor: AppColors.statPendingBg,
            numberText: '2',
            numberStyle: AppTextStyles.statNumberPending,
            label: 'Pending',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _StatTile(
            backgroundColor: AppColors.statCompletedBg,
            numberText: '3',
            numberStyle: AppTextStyles.statNumberCompleted,
            label: 'Completed',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _StatTile(
            backgroundColor: AppColors.statEarnedBg,
            numberText: '\$750',
            numberStyle: AppTextStyles.statNumberEarned,
            label: 'Earned',
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final Color backgroundColor;
  final String numberText;
  final TextStyle numberStyle;
  final String label;

  const _StatTile({
    required this.backgroundColor,
    required this.numberText,
    required this.numberStyle,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(numberText, style: numberStyle),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.statLabel,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ReferButton extends StatelessWidget {
  const _ReferButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: const Text(
          'Refer a Friend',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            offset: Offset(0, -1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: const [
          _BottomNavItem(
            label: 'Home',
            assetPath: 'assets/company_single_screen/icon/home.png',
            isSelected: false,
          ),
          _BottomNavItem(
            label: 'Leaderboard',
            assetPath: 'assets/company_single_screen/icon/leaderboard.png',
            isSelected: false,
          ),
          _BottomNavItem(
            label: 'Refer',
            assetPath: 'assets/company_single_screen/icon/refer.png',
            isSelected: true,
            isCenter: true,
          ),
          _BottomNavItem(
            label: 'Earnings',
            assetPath: 'assets/company_single_screen/icon/earnings.png',
            isSelected: false,
          ),
          _BottomNavItem(
            label: 'Profile',
            assetPath: 'assets/company_single_screen/icon/profile.png',
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String label;
  final String assetPath;
  final bool isSelected;
  final bool isCenter;

  const _BottomNavItem({
    required this.label,
    required this.assetPath,
    this.isSelected = false,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = TextStyle(
      fontSize: 12,
      fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
      color: isSelected ? AppColors.primaryOrange : AppColors.secondaryText,
    );

    Widget icon = Image.asset(
      assetPath,
      height: 22,
      width: 22,
      fit: BoxFit.contain,
    );

    if (isCenter) {
      icon = Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: AppColors.primaryOrange,
          shape: BoxShape.circle,
        ),
        child: icon,
      );
    }

    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 4),
            Text(label, style: labelStyle),
          ],
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
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: child,
    );
  }
}
