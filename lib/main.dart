// import 'customers/referral_program_registration_screen.dart';
// import 'package:dev_shakib_ui/Customers/Terms_Service.dart';
// import 'package:dev_shakib_ui/Customers/onboarding_screen.dart';
import 'package:dev_shakib_ui/Customers/profile_completion_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ReferableApp());
}

class ReferableApp extends StatelessWidget {
  const ReferableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Referable',
      // home: const ReferralProgramRegistrationScreen(),
      // home: const TermsOfServiceScreen(),
      // home: const OnboardingScreen(),
      home: const ProfileCompletionForm(),
    );
  }
}
