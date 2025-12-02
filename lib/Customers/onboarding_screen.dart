import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<_OnboardModel> pages = [
    _OnboardModel(
      title: "Share Your Experience",
      description:
          "Share your experience working with\n"
          "great companies and earn exclusive\n"
          "rewards for your valuable feedback.",
    ),
    _OnboardModel(
      title: "Earn Rewards",
      description:
          "Complete simple tasks and collect\n"
          "exclusive rewards for your opinions.",
    ),
    _OnboardModel(
      title: "Trusted Community",
      description:
          "Join a trusted community of\n"
          "professionals around the world.",
    ),
    _OnboardModel(
      title: "Start Your Journey",
      description:
          "Your experience matters — let’s begin\n"
          "your journey together today.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return _OnboardingPage(
                    title: pages[index].title,
                    description: pages[index].description,
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            _PagerIndicator(
              count: pages.length,
              activeIndex: _currentIndex,
              onDotTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _PrimaryButton(
                    label: _currentIndex == pages.length - 1
                        ? "Skip Tour"
                        : "Get Started",
                    onPressed: () {
                      if (_currentIndex < pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {}
                    },
                  ),

                  const SizedBox(height: 14),

                  _SecondaryButton(
                    label: "Skip Tour",
                    onPressed: () {
                      _pageController.jumpToPage(pages.length - 1);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _PagerIndicator extends StatelessWidget {
  final int count;
  final int activeIndex;
  final Function(int) onDotTap;

  const _PagerIndicator({
    required this.count,
    required this.activeIndex,
    required this.onDotTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => GestureDetector(
          onTap: () => onDotTap(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _Dot(isActive: index == activeIndex),
          ),
        ),
      ),
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
      width: isActive ? 12 : 10,
      height: isActive ? 12 : 10,
      decoration: BoxDecoration(
        color: isActive
            ? _OnboardingColors.primaryOrange
            : _OnboardingColors.inactiveDot,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String title;
  final String description;

  const _OnboardingPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 40),

          Container(
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(child: FlutterLogo(size: 100)),
          ),

          const SizedBox(height: 40),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: _OnboardingTextStyles.title),
              const SizedBox(height: 16),
              Text(
                description,
                textAlign: TextAlign.center,
                style: _OnboardingTextStyles.body,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OnboardModel {
  final String title;
  final String description;

  _OnboardModel({required this.title, required this.description});
}

class _OnboardingColors {
  // ignore: unused_field
  static const Color background = Color(0xFFF5F5F5);
  static const Color primaryOrange = Color(0xFFFF6A00);
  static const Color inactiveDot = Color(0xFFFFD4A8);
}

class _OnboardingTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    height: 1.5,
    color: Colors.black87,
  );
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _PrimaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _OnboardingColors.primaryOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
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
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: _OnboardingColors.primaryOrange,
            width: 1.4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _OnboardingColors.primaryOrange,
          ),
        ),
      ),
    );
  }
}
