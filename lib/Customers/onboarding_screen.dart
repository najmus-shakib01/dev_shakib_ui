import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: const [
              SizedBox(height: 24),
              _IllustrationSection(),
              SizedBox(height: 32),
              _TitleAndDescriptionSection(),
              Spacer(),
              _PagerIndicator(),
              SizedBox(height: 32),
              _ButtonsSection(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _IllustrationSection extends StatelessWidget {
  const _IllustrationSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(24),
          child: const FlutterLogo(size: 120),
        ),
      ),
    );
  }
}

class _TitleAndDescriptionSection extends StatelessWidget {
  const _TitleAndDescriptionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Share Your Experience', style: _OnboardingTextStyles.title),
        const SizedBox(height: 16),
        Text(
          'Share your experience working with\n'
          'great companies and earn exclusive\n'
          'rewards for your valuable feedback.',
          textAlign: TextAlign.center,
          style: _OnboardingTextStyles.body.copyWith(fontSize: 19),
        ),
      ],
    );
  }
}

class _ButtonsSection extends StatelessWidget {
  const _ButtonsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PrimaryButton(label: 'Get Started', onPressed: () {}),
        const SizedBox(height: 16),
        _SecondaryButton(label: 'Skip Tour', onPressed: () {}),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _PrimaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _OnboardingColors.primaryOrange,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(label, style: _OnboardingTextStyles.primaryButton),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _SecondaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: _OnboardingColors.secondaryBackground,
          side: const BorderSide(
            color: _OnboardingColors.primaryOrange,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(label, style: _OnboardingTextStyles.secondaryButton),
      ),
    );
  }
}

class _PagerIndicator extends StatelessWidget {
  const _PagerIndicator();

  @override
  Widget build(BuildContext context) {
    const int totalDots = 4;
    const int activeIndex = 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        final bool isActive = index == activeIndex;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: _Dot(isActive: isActive),
        );
      }),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isActive;

  const _Dot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive
            ? _OnboardingColors.primaryOrange
            : _OnboardingColors.inactiveDot,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _OnboardingColors {
  // ignore: unused_field
  static const Color background = Color(0xFFFFF7EB);
  static const Color primaryOrange = Color(0xFFFF6A00);
  static const Color secondaryBackground = Color(0xFFFFE4C5);
  static const Color titleText = Color(0xFF161616);
  static const Color bodyText = Color(0xFF555555);
  static const Color inactiveDot = Color(0xFFFFD4A8);
}

class _OnboardingTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: _OnboardingColors.titleText,
    height: 1.3,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _OnboardingColors.bodyText,
    height: 1.6,
  );

  static const TextStyle primaryButton = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle secondaryButton = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: _OnboardingColors.primaryOrange,
  );
}
