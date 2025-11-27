import 'package:flutter/material.dart';

class SecondProfileScreen extends StatefulWidget {
  const SecondProfileScreen({super.key});

  @override
  State<SecondProfileScreen> createState() => _SecondProfileScreenState();
}

class _SecondProfileScreenState extends State<SecondProfileScreen> {
  bool showGeneralTab = true;

  String name = "Christina Angela";
  String email = "christina.angela123@gmail.com";
  String phone = "(684) 555-0102";
  String password = "********";
  String payment = "Tap to Change Payment";

  void _showEditDialog(
    String title,
    String currentValue,
    Function(String) onSave,
  ) {
    TextEditingController controller = TextEditingController(
      text: currentValue,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text("Edit $title"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter new $title",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 177, 223, 11),
            ),
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  

  void _openPrivacyPolicy() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Privacy Policy"),
            backgroundColor: Color.fromARGB(255, 177, 223, 11),
          ),
          body: const Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Text(
                """
Privacy Policy

This is a demo privacy policy for this app.
                """,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return  _buildProfilePage();          
    
  }

  Widget _buildProfilePage() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(
                  'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8',
                ),
              ),
              const SizedBox(height: 14),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "@angela.christina123",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 24),
              _buildTabHeader(),
              const SizedBox(height: 24),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: showGeneralTab ? _buildGeneralTab() : _buildBadgeTab(),
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: 220,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color.fromARGB(255, 177, 223, 11)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Become Premium",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 177, 223, 11),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  "LOG OUT",
                  style: TextStyle(
                    color: Color.fromARGB(255, 177, 223, 11),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => showGeneralTab = true),
              child: Container(
                decoration: BoxDecoration(
                  color: showGeneralTab
                      ? Color.fromARGB(255, 177, 223, 11)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    "General",
                    style: TextStyle(
                      color: showGeneralTab ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => showGeneralTab = false),
              child: Container(
                decoration: BoxDecoration(
                  color: !showGeneralTab
                      ? Color.fromARGB(255, 177, 223, 11)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    "Badges",
                    style: TextStyle(
                      color: !showGeneralTab ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralTab() {
    return Column(
      children: [
        _buildTile(
          Icons.person,
          "Name",
          name,
          onEdit: () {
            _showEditDialog("Name", name, (val) => setState(() => name = val));
          },
        ),
        _buildTile(
          Icons.email_outlined,
          "Email",
          email,
          onEdit: () {
            _showEditDialog(
              "Email",
              email,
              (val) => setState(() => email = val),
            );
          },
        ),
        _buildTile(
          Icons.lock_outline,
          "Password",
          password,
          onEdit: () {
            _showEditDialog(
              "Password",
              "",
              (val) => setState(() => password = "********"),
            );
          },
        ),
        _buildTile(
          Icons.phone_outlined,
          "Phone Number",
          phone,
          onEdit: () {
            _showEditDialog(
              "Phone Number",
              phone,
              (val) => setState(() => phone = val),
            );
          },
        ),
        _buildTile(
          Icons.credit_card,
          "Payment",
          payment,
          onEdit: () {
            _showEditDialog(
              "Payment",
              payment,
              (val) => setState(() => payment = val),
            );
          },
        ),
        _buildTile(
          Icons.privacy_tip_outlined,
          "Privacy Policy",
          "Tap to See Privacy Policy",
          showEdit: false,
          onEdit: _openPrivacyPolicy,
        ),
      ],
    );
  }

  Widget _buildBadgeTab() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: const [
          Icon(Icons.emoji_events_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            "No badges available yet",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    IconData icon,
    String title,
    String subtitle, {
    bool showEdit = true,
    VoidCallback? onEdit,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Color.fromARGB(255, 177, 223, 11), size: 26),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: showEdit
          ? GestureDetector(
              onTap: onEdit,
              child: const Text(
                "Edit",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}
