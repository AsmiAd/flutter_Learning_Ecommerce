
import 'package:flutter/material.dart';
import 'package:flutterlearningecommerce/screens/signin/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _obscurePassword = true;
  String _selectedRole = "Student";
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }


  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Please enter your password";
    if (value.length < 7) return "Password must be at least 7 characters";
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return "Please enter phone number";
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Enter valid 10-digit phone number";
    }
    return null;
  }


  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }

      setState(() => _isLoading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo (2).png",
                      height: 140,
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Text(
                  "Hi, Let's Make a\nJourney with Us",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),

                const SizedBox(height: 35),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,              
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 15),

                      TextFormField(
                        controller: _emailController,
                        validator: _validateEmail,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: UnderlineInputBorder(),
                        ),
                      ),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        validator: _validatePassword,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: const UnderlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                              size: 20,
                              
                            ),
                          ),
                        ),
                      ),

                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: _validatePhone,
                        decoration: const InputDecoration(
                          labelText: "Phone Number",
                          border: UnderlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Register as a ?",
                        style: TextStyle(fontSize: 16),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              value: "Student",
                              groupValue: _selectedRole,
                              activeColor: Color.fromARGB(255, 177, 223, 11),
                              title: const Text("Student"),
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value.toString();
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              value: "Teacher",
                              groupValue: _selectedRole,
                              activeColor: Color.fromARGB(255, 177, 223, 11),
                              title: const Text("Teacher"),
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 177, 223, 11),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Color.fromARGB(255, 177, 223, 11),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
