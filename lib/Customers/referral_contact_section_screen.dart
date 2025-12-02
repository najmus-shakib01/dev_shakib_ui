import 'package:flutter/material.dart';

/// Approx Colors from screenshot
const Color appPrimaryOrange = Color(0xFFFF6F2C); 
const Color appYellowCircle = Color(0xFFFFB33A); 
const Color appLightBackground = Color(0xFFFFFAF1); 
const Color avatarColor = Color(0xFFF7A81B); 
const Color borderGray = Color(0xFFE5E5E5);

class ReferralContactSectionScreen extends StatefulWidget {
  const ReferralContactSectionScreen({super.key});

  @override
  State<ReferralContactSectionScreen> createState() =>
      _ReferralContactSectionScreenState();
}

class _ReferralContactSectionScreenState
    extends State<ReferralContactSectionScreen> {
  final List<ContactModel> recentContacts = [
    ContactModel("James Davis", "+1 (555) 123-4567", "JD", false),
    ContactModel("Emma Wilson", "+1 (555) 987-6543", "EW", true),
    ContactModel("Michael Rodriguez", "+1 (555) 234-5678", "MR", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLightBackground,
      bottomNavigationBar: _bottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _topIcon(),
              const SizedBox(height: 20),
              _titleText(),
              const SizedBox(height: 10),
              _progressBar(),
              const SizedBox(height: 25),
              _searchCard(),
              const SizedBox(height: 25),
              _recentContactsSection(),
              const SizedBox(height: 25),
              _allContactsSection(),
              const SizedBox(height: 30),
              _continueButton(),
              const SizedBox(height: 90), 
            ],
          ),
        ),
      ),
    );
  }

  Widget _topIcon() {
    return Container(
      width: 85,
      height: 85,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: appYellowCircle,
      ),
      child: const Center(
        child: Icon(Icons.group, color: Colors.white, size: 40),
      ),
    );
  }

  Widget _titleText() {
    return const Column(
      children: [
        Text(
          "Make Your First Referral",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Text(
          "Step 3 of 3: Choose contacts you'd like to invite",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _progressBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 90,
          height: 8,
          decoration: BoxDecoration(
            color: appPrimaryOrange,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _searchCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _whiteCard(),
      child: Column(
        children: [
          _searchField(),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: _orangeButton("Import Contacts")),
              const SizedBox(width: 12),
              Expanded(child: _outlinedButton("Enter Manually")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderGray),
      ),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search contact",
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.search, size: 24, color: Colors.grey),
        ],
      ),
    );
  }

  static Widget _orangeButton(String text) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: appPrimaryOrange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static Widget _outlinedButton(String text) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: appPrimaryOrange, width: 2),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: appPrimaryOrange,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _recentContactsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _whiteCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Contacts",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 15),
          ...recentContacts
              .map(
                (c) => Column(
                  children: [
                    ContactTile(
                      contact: c,
                      onChanged: (value) {
                        setState(() {
                          c.selected = value;
                        });
                      },
                    ),
                    const Divider(height: 20, color: borderGray),
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Widget _allContactsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _whiteCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "All Contacts",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          const Text(
            "No contacts yet",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 18),
          _outlinedButton("Import New Contacts"),
        ],
      ),
    );
  }

  BoxDecoration _whiteCard() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: borderGray),
    boxShadow: const [
      BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
    ],
  );

  Widget _continueButton() {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: appPrimaryOrange,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(
          "Continue with Selected Contacts (${_selectedCount()})",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  int _selectedCount() =>
      recentContacts.where((c) => c.selected == true).length;

  Widget _bottomNavBar() {
    return Container(
      height: 78,
      decoration: const BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navItem(Icons.home_outlined, "Home", false),
            _navItem(Icons.group_outlined, "Leaderboard", false),

            _activeReferItem(),

            _navItem(Icons.account_balance_wallet_outlined, "Earnings", false),
            _navItem(Icons.person_outline, "Profile", false),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: Colors.black87),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _activeReferItem() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: appYellowCircle,
          ),
          child: const Icon(Icons.person_add, color: Colors.white, size: 26),
        ),
        const SizedBox(height: 4),
        const Text(
          "Refer",
          style: TextStyle(
            fontSize: 13,
            color: appPrimaryOrange,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class ContactModel {
  String name;
  String phone;
  String initials;
  bool selected;

  ContactModel(this.name, this.phone, this.initials, this.selected);
}

class ContactTile extends StatelessWidget {
  final ContactModel contact;
  final ValueChanged<bool> onChanged;

  const ContactTile({
    super.key,
    required this.contact,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _circleAvatar(),
        const SizedBox(width: 12),
        _info(),
        const Spacer(),
        Checkbox(
          value: contact.selected,
          onChanged: (v) => onChanged(v ?? false),
          activeColor: appPrimaryOrange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ],
    );
  }

  Widget _circleAvatar() {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: avatarColor,
      ),
      child: Center(
        child: Text(
          contact.initials,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contact.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          contact.phone,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
