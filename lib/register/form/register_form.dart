import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool acceptTerms;
  final Function(bool) onTermsChanged;
  final VoidCallback onShowTermsDialog;
  final VoidCallback onShowPrivacyDialog;

  const RegisterForm({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.acceptTerms,
    required this.onTermsChanged,
    required this.onShowTermsDialog,
    required this.onShowPrivacyDialog,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          // Name Field
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              prefixIcon: Icon(Icons.person_outline, color: Colors.brown[600]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.brown[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.brown[700]!, width: 2),
              ),
              labelStyle: TextStyle(color: Colors.brown[600]),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama tidak boleh kosong';
              }
              if (value.length < 2) {
                return 'Nama minimal 2 karakter';
              }
              return null;
            },
          ),

          SizedBox(height: 20),

          // Email Field
          TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_outlined, color: Colors.brown[600]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.brown[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.brown[700]!, width: 2),
              ),
              labelStyle: TextStyle(color: Colors.brown[600]),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email tidak boleh kosong';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Format email tidak valid';
              }
              return null;
            },
          ),

          SizedBox(height: 20),

          // Password Field
          TextFormField(
            controller: widget.passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline, color: Colors.brown[600]),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.brown[600],
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.brown[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.brown[700]!, width: 2),
              ),
              labelStyle: TextStyle(color: Colors.brown[600]),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password tidak boleh kosong';
              }
              if (value.length < 8) {
                return 'Password minimal 8 karakter';
              }
              if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
                return 'Password harus mengandung huruf besar, kecil, dan angka';
              }
              return null;
            },
          ),

          SizedBox(height: 20),

          // Confirm Password Field
          TextFormField(
            controller: widget.confirmPasswordController,
            obscureText: !_isConfirmPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Konfirmasi Password',
              prefixIcon: Icon(Icons.lock_outline, color: Colors.brown[600]),
              suffixIcon: IconButton(
                icon: Icon(
                  _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.brown[600],
                ),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.brown[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.brown[700]!, width: 2),
              ),
              labelStyle: TextStyle(color: Colors.brown[600]),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Konfirmasi password tidak boleh kosong';
              }
              if (value != widget.passwordController.text) {
                return 'Password tidak cocok';
              }
              return null;
            },
          ),

          SizedBox(height: 16),

          // Terms and Conditions Checkbox
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: widget.acceptTerms,
                  onChanged: (value) => widget.onTermsChanged(value ?? false),
                  activeColor: Colors.brown[700],
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Wrap(
                  children: [
                    Text(
                      'Saya menyetujui ',
                      style: TextStyle(color: Colors.brown[600]),
                    ),
                    GestureDetector(
                      onTap: widget.onShowTermsDialog,
                      child: Text(
                        'Syarat dan Ketentuan',
                        style: TextStyle(
                          color: Colors.brown[700],
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      ' serta ',
                      style: TextStyle(color: Colors.brown[600]),
                    ),
                    GestureDetector(
                      onTap: widget.onShowPrivacyDialog,
                      child: Text(
                        'Kebijakan Privasi',
                        style: TextStyle(
                          color: Colors.brown[700],
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}