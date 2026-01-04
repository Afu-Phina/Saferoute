// Import Material package for Flutter UI components
import 'package:flutter/material.dart';
// Import LoginScreen to allow navigation back to login
// ignore: unused_import
import 'login_screen.dart';
// Import HomeScreen to navigate after successful registration
import 'home_screen.dart';

// RegisterScreen is a StatefulWidget because it manages form state
class RegisterScreen extends StatefulWidget {
  // Constructor with super.key
  const RegisterScreen({super.key});

  // createState creates the mutable state object
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

// _RegisterScreenState manages the state for RegisterScreen
class _RegisterScreenState extends State<RegisterScreen> {
  // GlobalKey is used for form validation
  final _formKey = GlobalKey<FormState>();
  // Controller for email input field
  final TextEditingController _emailController = TextEditingController();
  // Controller for password input field
  final TextEditingController _passwordController = TextEditingController();
  // Boolean to toggle password visibility
  bool _obscure = true;

  // dispose cleans up when widget is removed
  @override
  void dispose() {
    // Clean up email controller
    _emailController.dispose();
    // Clean up password controller
    _passwordController.dispose();
    // Call parent dispose
    super.dispose();
  }

  // _register method handles registration form submission
  void _register() {
    // Validate form before proceeding
    if (_formKey.currentState?.validate() ?? false) {
      // Show snackbar feedback
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful!')
        )
      );
      // Delay navigation slightly to show the snackbar
      Future.delayed(const Duration(milliseconds: 500), () {
        // Before using the BuildContext after an async gap, ensure the widget is still mounted.
        if (!mounted) return;
        // Navigate to HomeScreen using pushReplacement to remove RegisterScreen from stack
        Navigator.of(context).pushReplacement(
          // MaterialPageRoute animates the transition
          MaterialPageRoute(
            // builder creates the HomeScreen widget
            builder: (_) => const HomeScreen(),
          ),
        );
      });
      // TODO: Implement registration logic (API/Firebase)
      // After successful registration, navigate to main app or login
    }
  }

  // Build method creates the UI
  @override
  Widget build(BuildContext context) {
    // Scaffold provides basic layout structure
    return Scaffold(
      // AppBar at the top
      appBar: AppBar(
        // Title text
        title: const Text('Create Account')
      ),
      // body is main content area
      body: Center(
        // SingleChildScrollView allows scrolling if needed
        child: SingleChildScrollView(
          // padding around content
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          // Card widget displays content in a card style
          child: Card(
            // elevation creates shadow effect
            elevation: 6,
            // shape customizes card border
            shape: RoundedRectangleBorder(
              // borderRadius creates rounded corners
              borderRadius: BorderRadius.circular(12)
            ),
            // child is the card content
            child: Padding(
              // padding inside the card
              padding: const EdgeInsets.all(18.0),
              // Form widget manages validation
              child: Form(
                // key allows accessing form state
                key: _formKey,
                // child is the form content
                child: Column(
                  // mainAxisSize.min takes only needed space
                  mainAxisSize: MainAxisSize.min,
                  // children is the list of form fields
                  children: [
                    // TextFormField for email input
                    TextFormField(
                      // controller connects input to _emailController
                      controller: _emailController,
                      // keyboardType shows email keyboard
                      keyboardType: TextInputType.emailAddress,
                      // decoration customizes field appearance
                      decoration: const InputDecoration(
                        // labelText shows label
                        labelText: 'Email',
                        // prefixIcon shows email icon
                        prefixIcon: Icon(Icons.email)
                      ),
                      // validator checks if input is valid
                      validator: (v) {
                        // Check if empty
                        if (v == null || v.isEmpty) return 'Please enter your email';
                        // Check if contains @ symbol
                        if (!v.contains('@')) return 'Enter a valid email';
                        // Return null if valid
                        return null;
                      },
                    ),
                    // Add vertical spacing
                    const SizedBox(height: 12),
                    // TextFormField for password input
                    TextFormField(
                      // controller connects input to _passwordController
                      controller: _passwordController,
                      // obscureText hides password characters
                      obscureText: _obscure,
                      // decoration customizes field appearance
                      decoration: InputDecoration(
                        // labelText shows password label
                        labelText: 'Password',
                        // prefixIcon shows lock icon
                        prefixIcon: const Icon(Icons.lock),
                        // suffixIcon shows visibility toggle button
                        suffixIcon: IconButton(
                          // icon changes based on visibility state
                          icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                          // onPressed toggles password visibility
                          onPressed: () => setState(() => _obscure = !_obscure),
                        ),
                      ),
                      // validator checks if password is valid
                      validator: (v) {
                        // Check if empty
                        if (v == null || v.isEmpty) return 'Please enter your password';
                        // Check minimum length
                        if (v.length < 6) return 'Password must be at least 6 characters';
                        // Return null if valid
                        return null;
                      },
                    ),
                    // Add spacing before button
                    const SizedBox(height: 20),
                    // SizedBox constrains button width
                    SizedBox(
                      // Make button full width
                      width: double.infinity,
                      // child is the button
                      child: ElevatedButton(
                        // onPressed calls registration function
                        onPressed: _register,
                        // child is button content
                        child: const Padding(
                          // padding inside button
                          padding: EdgeInsets.symmetric(vertical: 14.0),
                          // Text label
                          child: Text(
                            // Button text
                            'Register',
                            // style for text
                            style: TextStyle(
                              // font size
                              fontSize: 16
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Add spacing before login link
                    const SizedBox(height: 8),
                    // Row arranges login link horizontally
                    Row(
                      // Center the login link
                      mainAxisAlignment: MainAxisAlignment.center,
                      // children in the row
                      children: [
                        // Prompt text
                        const Text('Already have an account? '),
                        // TextButton for login link
                        TextButton(
                          // onPressed pops back to login screen
                          onPressed: () {
                            // Navigator.pop removes current screen from stack
                            Navigator.of(context).pop();
                          },
                          // child is button text
                          child: const Text('Sign In'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
