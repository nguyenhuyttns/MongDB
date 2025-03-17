import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../constants/colors.dart';
import '../utils/navigation.dart';
import '../services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // Call the API
        final response = await ApiService.loginUser(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );

        // Check the response
        if (response['status'] == true) {
          // Save the token
          final token = response['token'];
          await _saveToken(token);

          // Navigate to the home screen
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Login successful')));
          Navigation.pushReplacement(context, Routes.home);
        } else {
          throw Exception('Login failed');
        }
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  // Save token to shared preferences
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text('Login'), backgroundColor: AppColors.primary),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              SizedBox(height: 24),
              _buildInputFields(),
              SizedBox(height: 24),
              _buildLoginButton(),
              SizedBox(height: 16),
              _buildRegisterLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Icon(Icons.person, size: 64, color: AppColors.primary),
    );
  }

  Widget _buildInputFields() {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            } else if (!value.contains('@')) {
              return 'Invalid email format';
            }
            return null;
          },
          style: TextStyle(color: AppColors.onBackground),
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
              color: AppColors.onBackground.withOpacity(0.7),
            ),
            prefixIcon: Icon(Icons.email, color: AppColors.secondary),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            filled: true,
            fillColor: AppColors.surface,
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          style: TextStyle(color: AppColors.onBackground),
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(
              color: AppColors.onBackground.withOpacity(0.7),
            ),
            prefixIcon: Icon(Icons.lock, color: AppColors.secondary),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            filled: true,
            fillColor: AppColors.surface,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _login,
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.onPrimary,
        backgroundColor: AppColors.primary,
        elevation: 2,
        shadowColor: AppColors.primary.withOpacity(0.3),
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child:
          _isLoading
              ? CircularProgressIndicator(color: AppColors.onPrimary)
              : Text('LOGIN', style: TextStyle(fontSize: 16)),
    );
  }

  Widget _buildRegisterLink() {
    return TextButton(
      onPressed: () => Navigation.push(context, Routes.register),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: AppColors.onBackground),
          children: [
            TextSpan(text: "Don't have an account? "),
            TextSpan(
              text: 'Register',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
