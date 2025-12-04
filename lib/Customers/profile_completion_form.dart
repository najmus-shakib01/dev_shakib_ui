import 'package:flutter/material.dart';

class ProfileCompletionForm extends StatelessWidget {
  const ProfileCompletionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const IconHeader(),
              const SizedBox(height: 10),
              const StepTitleSection(),
              const SizedBox(height: 20),
              const StepProgressBar(),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ProfileFormFields(),
              ),
              const SizedBox(height: 30),
              const ActionButtons(),
              const SizedBox(height: 20),
              const SignInText(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class IconHeader extends StatelessWidget {
  const IconHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: const Color(0xFFFFB84C),
      child: const Icon(Icons.person_outline, size: 48, color: Colors.white),
    );
  }
}

class StepTitleSection extends StatelessWidget {
  const StepTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Complete Your Profile",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Step 1 of 3: Tell us about you",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }
}

class StepProgressBar extends StatelessWidget {
  const StepProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6E2E),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFFF8DCA5),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFFF8DCA5),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;

  const CustomInputField({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}

class ProfileFormFields extends StatelessWidget {
  const ProfileFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomInputField(label: "Full Name", hint: "Enter your full name"),
        CustomInputField(
          label: "Email Address",
          hint: "Enter your email address",
        ),
        CustomInputField(
          label: "Phone Number",
          hint: "Enter your phone number",
        ),
        CustomInputField(label: "Location", hint: "City, State"),
        CustomInputField(
          label: "Company (Optional)",
          hint: "Enter your company name",
        ),
        NotificationCheckbox(),
      ],
    );
  }
}

class NotificationCheckbox extends StatefulWidget {
  const NotificationCheckbox({super.key});

  @override
  State<NotificationCheckbox> createState() => _NotificationCheckboxState();
}

class _NotificationCheckboxState extends State<NotificationCheckbox> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (v) => setState(() => value = v ?? false),
          activeColor: const Color(0xFFFF6E2E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        const Expanded(
          child: Text(
            "I agree to receive notifications about referrals",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          // Continue Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6E2E),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 2,
              ),
              onPressed: () {},
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Back Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFFF6E2E)),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Back",
                style: TextStyle(color: Color(0xFFFF6E2E), fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: "Already have an account? ",
        style: TextStyle(color: Colors.black87, fontSize: 16),
        children: [
          TextSpan(
            text: "Sign in",
            style: TextStyle(
              color: Color(0xFFFF6E2E),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
