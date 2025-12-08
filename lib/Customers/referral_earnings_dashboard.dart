import 'package:flutter/material.dart';

/// Color/Style constants
/// Note: এই color গুলো screenshot দেখে approximate নেয়া হয়েছে।
class AppColors {
  // হালকা ক্রিম ব্যাকগ্রাউন্ড
  static const Color screenBackground = Color(0xFFFFF7EC); // approximate
  // কার্ডের জন্য খাঁটি সাদা
  static const Color cardBackground = Colors.white;
  // মূল অরেঞ্জ ব্র্যান্ড কালার
  static const Color primaryOrange = Color(0xFFFF7A1A); // approximate
  // হালকা অরেঞ্জ ব্যাকগ্রাউন্ড ব্যানার/বাটনের জন্য
  static const Color softOrangeBackground = Color(0xFFFFF0E0); // approximate
  // টেক্সট কালার
  static const Color primaryText = Color(0xFF1C1C1C);
  static const Color secondaryText = Color(0xFF777777);
  static const Color mutedText = Color(0xFF9E9E9E);
  // সবুজ earnings text
  static const Color positiveGreen = Color(0xFF2E7D32); // approximate
  // progress bar background & track
  static const Color progressTrack = Color(0xFFE0E0E0);
  static const Color progressFill = primaryOrange;
  // border/shadow colors
  static const Color cardShadow = Color(0x1A000000);
  static const Color divider = Color(0xFFE5E5E5);
}

/// Simple transaction data model
class TransactionItemData {
  final String title;
  final String date;
  final String amountText;

  const TransactionItemData({
    required this.title,
    required this.date,
    required this.amountText,
  });
}

class ReferralEarningsDashboard extends StatelessWidget {
  const ReferralEarningsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Column(
          children: [
            const _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _HeaderTexts(),
                    SizedBox(height: 16),
                    _LifetimeEarningsCard(),
                    SizedBox(height: 16),
                    _AvailableBalanceCard(),
                    SizedBox(height: 24),
                    _RecentTransactionsSection(),
                    SizedBox(height: 24),
                    _HelpSection(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

/// ---------------------- TOP APP BAR -------------------------

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5E5E5), // approximate border color (light grey)
            width: 1,                // Top bar bottom border
          ),
        ),
      ),
      padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/referral_earnings_dashboard/image/referable_logo.png',
            height: 28,
            fit: BoxFit.contain,
          ),
          Image.asset(
            'assets/referral_earnings_dashboard/icon/menu.png',
            height: 24,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}


/// ---------------------- MAIN HEADER TEXTS -------------------

class _HeaderTexts extends StatelessWidget {
  const _HeaderTexts();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'My Earnings',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryText,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Track your referral earnings and payouts',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.secondaryText,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

/// ---------------------- LIFETIME EARNINGS CARD --------------

class _LifetimeEarningsCard extends StatelessWidget {
  const _LifetimeEarningsCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  'Total Lifetime Earnings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
              ),
              Image.asset(
                'assets/referral_earnings_dashboard/icon/info.png',
                height: 20,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '\$2,475.50',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryText,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '+\$350 this month',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.positiveGreen,
            ),
          ),
          const SizedBox(height: 16),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: SizedBox(
              height: 8,
              child: LinearProgressIndicator(
                value: 0.72, // approximate fill
                backgroundColor: AppColors.progressTrack,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.progressFill),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: _LabelAndValue(
                  label: 'Next payout:',
                  value: 'May 15, 2023',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _LabelAndValue(
                  label: 'Estimated amount:',
                  value: '\$175.00',
                  alignEnd: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LabelAndValue extends StatelessWidget {
  final String label;
  final String value;
  final bool alignEnd;

  const _LabelAndValue({
    required this.label,
    required this.value,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.mutedText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
      ],
    );
  }
}

/// ---------------------- AVAILABLE BALANCE CARD ---------------

class _AvailableBalanceCard extends StatelessWidget {
  const _AvailableBalanceCard();

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Visa Image
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Available Balance',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
              ),
              Image.asset(
                   'assets/referral_earnings_dashboard/image/visa.png',
                height: 32,
                fit: BoxFit.contain,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ---------------------------
          // 🔶 INNER ORANGE SUB-CARD
          // ---------------------------
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFF3E3), // light orange (approx based on screenshot)
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Amount Text
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '\$175.00',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryText,
                      ),
                    ),
                    SizedBox(width: 6),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        'available for transfer',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Buttons inside sub-card
                Row(
                  children: const [
                    Expanded(
                      child: _PrimaryButton(
                        label: 'Transfer to Bank',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _SecondaryButton(
                        label: 'View Details',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}


/// ---------------------- RECENT TRANSACTIONS SECTION ----------

class _RecentTransactionsSection extends StatelessWidget {
  const _RecentTransactionsSection();

  static const List<TransactionItemData> _transactions = [
    TransactionItemData(
      title: 'Referral Bonus - John',
      date: 'Oct 15, 2025',
      amountText: '\$75.00',
    ),
    TransactionItemData(
      title: 'Referral Bonus - Sarah',
      date: 'Sep 15, 2025',
      amountText: '\$49.00',
    ),
    TransactionItemData(
      title: 'Payout to Bank Account',
      date: 'Aug 15, 2025',
      amountText: '\$84.00',
    ),
    TransactionItemData(
      title: 'Referral Bonus - Michael',
      date: 'Jul 15, 2025',
      amountText: '\$29.00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Transactions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 16),
        ..._transactions.map(
          (t) => Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: _TransactionCard(item: t),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            'View All Transactions',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryOrange,
            ),
          ),
        ),
      ],
    );
  }
}

class _TransactionCard extends StatelessWidget {
  final TransactionItemData item;

  const _TransactionCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.date,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            item.amountText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------------- HELP SECTION -------------------------

class _HelpSection extends StatelessWidget {
  const _HelpSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.softOrangeBackground,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/referral_earnings_dashboard/icon/support.png',
                height: 28,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Need help with payments?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryText,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Contact our support team',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const _PrimaryButton(
            label: 'Get Help',
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}

/// ---------------------- BOTTOM NAVIGATION BAR ----------------

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            offset: Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 6),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 68,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _BottomNavItem(
                label: 'Home',
                assetPath: 'assets/referral_earnings_dashboard/icon/home.png',
                isSelected: false,
              ),
              _BottomNavItem(
                label: 'Leaderboard',
                assetPath: 'assets/referral_earnings_dashboard/icon/leaderboard.png',
                isSelected: false,
              ),
              _CenterBottomNavItem(),
              _BottomNavItem(
                label: 'Earnings',
                assetPath: 'assets/referral_earnings_dashboard/icon/earnings.png',
                isSelected: false,
              ),
              _BottomNavItem(
                label: 'Profile',
                assetPath: 'assets/referral_earnings_dashboard/icon/profile.png',
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String label;
  final String assetPath;
  final bool isSelected;

  const _BottomNavItem({
    required this.label,
    required this.assetPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 11,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      color:
          isSelected ? AppColors.primaryOrange : AppColors.secondaryText,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          assetPath,
          height: 22,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 4),
        Text(label, style: textStyle),
      ],
    );
  }
}

/// Center selected "Refer" tab – screenshot অনুযায়ী মাঝখানে হাইলাইটেড
class _CenterBottomNavItem extends StatelessWidget {
  const _CenterBottomNavItem();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: AppColors.primaryOrange,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              'assets/referral_earnings_dashboard/icon/refer.png',
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Refer',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryOrange,
          ),
        ),
      ],
    );
  }
}

/// ---------------------- REUSABLE BUTTONS & CARD --------------

class _PrimaryButton extends StatelessWidget {
  final String label;
  final bool fullWidth;

  const _PrimaryButton({
    required this.label,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final btn = Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: btn);
    }
    return btn;
  }
}

class _SecondaryButton extends StatelessWidget {
  final String label;

  const _SecondaryButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryOrange, width: 1.3),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryOrange,
        ),
      ),
    );
  }
}

class _BaseCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const _BaseCard({
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: padding ?? const EdgeInsets.all(18.0),
      child: child,
    );
  }
}
