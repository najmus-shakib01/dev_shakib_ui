// import 'customers/referral_program_registration_screen.dart';
// import 'package:dev_shakib_ui/Customers/Terms_Service.dart';
// import 'package:dev_shakib_ui/Customers/onboarding_screen.dart';
// import 'package:dev_shakib_ui/Customers/profile_completion_form.dart';
// import 'package:dev_shakib_ui/Customers/stripe_connect_payment_setup.dart';
// import 'package:dev_shakib_ui/Customers/referral_contact_section_screen.dart';
// import 'package:dev_shakib_ui/Customers/referral_composition_screen.dart';
// import 'package:dev_shakib_ui/Customers/referral_preview_and_send_screen.dart';
// import 'package:dev_shakib_ui/Customers/help_and_FAQ_screen.dart';
// import 'package:dev_shakib_ui/Customers/notification_settings.dart';
// import 'package:dev_shakib_ui/Customers/company_insight.dart';
// import 'package:dev_shakib_ui/Customers/company_selection.dart';
// import 'package:dev_shakib_ui/Customers/company_single_screen.dart';
// import 'package:dev_shakib_ui/Customers/referral_tracking_deshboard.dart';
import 'package:dev_shakib_ui/Customers/referral_details_screen.dart';
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
      title: 'Customer Referral App',
      // home: const ReferralProgramRegistrationScreen(),
      // home: const TermsOfServiceScreen(),
      // home: const OnboardingScreen(),
      // home: const ProfileCompletionForm(),
      // home: const StripeConnectPaymentSetupScreen(),
      // home: const ReferralContactSectionScreen(),
      // home: const ReferralCompositionScreen(),
      // home: const ReferralPreviewAndSendScreen(),
      // home: const HelpAndFaqScreen(),
      // home: const NotificationSettingsScreen(),
      // home: const CompanyInsightPage(),
      // home: const CompanySelection(),
      // home: const CompanySingleScreen(),
      // home: const ReferralTrackingDeshboard(),
      home: const ReferralDetailsScreen(),
    );
  }
}