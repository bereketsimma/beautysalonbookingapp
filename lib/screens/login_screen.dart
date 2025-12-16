import 'package:flutter/material.dart';
import 'package:mybeautybooking_flutter/constants/appcolors.dart';

class BeautyLoginPage extends StatefulWidget {
  const BeautyLoginPage({Key? key}) : super(key: key);

  @override
  State<BeautyLoginPage> createState() => _BeautyLoginPageState();
}

class _BeautyLoginPageState extends State<BeautyLoginPage> {
  final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool _loading = false;
String? _errorMessage;

@override
void dispose() {
  emailController.dispose();
  passwordController.dispose();
  super.dispose();
}

  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              // ------------------ TOP PART (IMAGE) ------------------
              Container(
                
                height: height * 0.60,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text(
                    "Let's get you Login!",
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Enter your information below.",
                    style: TextStyle(color: AppColors.textWhite, fontSize: 16),
                  ),

                  const SizedBox(height: 20),

                ]),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/loginbg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // ------------------ BOTTOM PART (BLUE) ------------------
              Container(
                height: height * 0.40,
                width: width,
                color: AppColors.secondary,
              ),
            ],
          ),

          // ------------------ FLOATING LOGIN CARD ------------------
          Positioned(
            top: height * 0.36, // overlaps both sections
            child: Container(
              width: width * 0.85,
              height: height * 0.60,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    _socialButton(
      icon: Icons.facebook,
      color: Colors.blue.shade800,
      label: "Facebook",
    ),
    const SizedBox(width: 15),
    _socialButton(
      icon: Icons.g_mobiledata,
      color: Colors.red.shade700,
      label: "Google",
    ),
  ],
),
                  const SizedBox(height: 20),

                 
                  // Email
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Password
                  TextField(
                    obscureText: hidePass,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePass ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() => hidePass = !hidePass);
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {
    Navigator.pushNamed(context, '/signup');

                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(fontWeight: FontWeight.bold
                          
                          , color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _socialButton({required IconData icon, required Color color, required String label}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.black)),
      ],
    ),
  );
}

