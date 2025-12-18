import 'package:flutter/material.dart';
import 'package:mybeautybooking_flutter/constants/appcolors.dart';
import 'package:mybeautybooking_flutter/controller/register.dart';
import 'package:mybeautybooking_flutter/models/service.dart';
import 'package:mybeautybooking_flutter/screens/home_screen.dart';
import 'package:mybeautybooking_flutter/utils/validators.dart';
import 'package:mybeautybooking_flutter/services/api_service.dart';

class BeautySignUpPage extends StatefulWidget {
  const BeautySignUpPage({Key? key}) : super(key: key);

  @override
  State<BeautySignUpPage> createState() => _BeautySignUpPageState();
}

class _BeautySignUpPageState extends State<BeautySignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool hidePass = true;bool _loading = false;
  String? _errorMessage;

  // final SignUpController _controller = SignUpController();


  Future<void> _onSignUpPressed() async {
     if (!_formKey.currentState!.validate()) return;

  setState(() {});
  // 1. Create the model from UI input
 final signUpRequest = SignUpRequest(
  name: nameController.text.trim(),
  email: emailController.text.trim(),
  password: passwordController.text.trim(),
);

final result = await signupAptRequest(signUpRequest);

  // 3. Update UI based on response
  if (result['success'] == true) {
    _showSuccess(result['message']);
     Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  } else {
    _showError(result['message']);
  }
}

void _showSuccess(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

void _showError(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}



  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(alignment: Alignment.topCenter, children: [
      Column(
        children: [
          Container(
            height: height * 0.60,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/loginbg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Create Your Account",
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Sign up to get started with us.",
                  style: TextStyle(color: AppColors.textWhite, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.40,
            width: width,
            color: AppColors.secondary,
          ),
        ],
      ),
      Positioned(
          top: height * 0.36,
          child: Container(
            width: width * 0.85,
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
                Form(
                  key: _formKey,
                  //  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    // Full Name
                    TextFormField(
                      controller: nameController,
                      validator: Validators.validateName,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Email
                    TextFormField(
                      controller: emailController,
                      validator: Validators.validateEmail,
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
                    TextFormField(
                      controller: passwordController,
                      validator: Validators.validatePassword,
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
                    const SizedBox(height: 15),

                    // Confirm Password
                    TextFormField(
                      controller: confirmPassController,
                      validator: (value) => Validators.validateConfirmPassword(
                          value, passwordController.text),
                      obscureText: hidePass,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child:  _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed:  _onSignUpPressed,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ))),
                         if (_errorMessage != null) ...[
                const SizedBox(height: 16),
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ],]
                  
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text("Already have an account? "),
                      TextButton(
                        onPressed: () {
    Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ])
                  ]),
                )
        )],
            ),
          )
    ;
  }
}

Widget _socialButton(
    {required IconData icon, required Color color, required String label}) {
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
