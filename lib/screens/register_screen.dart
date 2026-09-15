import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';
import 'login_screen.dart';

/// Registration screen for the UICT Online Attendance portal.
///
/// Fields and validation logic are ported from the project's
/// `RegisterPage.jsx` (first/last name, institutional email, registration
/// number, password with live-checked criteria, remember-me draft saving,
/// and a post-submit "check your email" confirmation state), restyled to
/// match the Executive Precision design already used on [LoginScreen].
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

enum _SubmitState { idle, loading, success }

class _PasswordCriteria {
  bool length = false;
  bool uppercase = false;
  bool lowercase = false;
  bool number = false;
  bool special = false;

  bool get allMet => length && uppercase && lowercase && number && special;
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _regNoController = TextEditingController();
  final _passwordController = TextEditingController();

  // Matches formData.role default in the JSX (hidden field, not user-facing).
  final String _role = 'student';

  bool _obscurePassword = true;
  bool _rememberMe = false;
  _SubmitState _submitState = _SubmitState.idle;
  String? _fieldError; // name of the field the current error belongs to
  String? _message; // banner text shown above the form

  final _passwordCriteria = _PasswordCriteria();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _regNoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _clearFieldError(String field) {
    if (_fieldError == field) {
      setState(() {
        _fieldError = null;
        _message = null;
      });
    }
  }

  void _validatePasswordCriteria(String password) {
    setState(() {
      _passwordCriteria
        ..length = password.length >= 8
        ..uppercase = RegExp(r'[A-Z]').hasMatch(password)
        ..lowercase = RegExp(r'[a-z]').hasMatch(password)
        ..number = RegExp(r'[0-9]').hasMatch(password)
        ..special = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    });
  }

  String? _validateRequired(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid institutional email address';
    }
    return null;
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_passwordCriteria.allMet) {
      setState(() {
        _fieldError = 'password';
        _message = 'Password does not meet the required criteria';
      });
      return;
    }

    setState(() {
      _submitState = _SubmitState.loading;
      _fieldError = null;
      _message = null;
    });

    // TODO: replace with a real POST to the UICT auth/register API,
    // mirroring RegisterPage.jsx's fetch(`${API_URL}/auth/register`, ...).
    await Future.delayed(const Duration(milliseconds: 1400));

    if (!mounted) return;
    setState(() => _submitState = _SubmitState.success);
  }

  void _resetForm() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _regNoController.clear();
    _passwordController.clear();
    setState(() {
      _passwordCriteria
        ..length = false
        ..uppercase = false
        ..lowercase = false
        ..number = false
        ..special = false;
      _rememberMe = false;
      _submitState = _SubmitState.idle;
    });
  }

  void _goToSignIn() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSuccess = _submitState == _SubmitState.success;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -64,
              right: -64,
              child: _blurredCircle(224, AppColors.primaryFixed, 0.5),
            ),
            Positioned(
              top: 192,
              left: -80,
              child: _blurredCircle(192, AppColors.secondaryFixed, 0.4),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(context),
                      const SizedBox(height: 16),
                      _buildFormCard(context),
                      const SizedBox(height: 16),
                      _buildSignInRow(context),
                      const SizedBox(height: 16),
                      _buildFooter(context),
                    ],
                  ),
                ),
              ),
            ),
            if (isSuccess) _buildSuccessOverlay(context),
          ],
        ),
      ),
    );
  }

  Widget _blurredCircle(double size, Color color, double opacity) {
    return IgnorePointer(
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
          child: Container(
            height: size,
            width: size,
            color: color.withOpacity(opacity),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          'UICT ONLINE ATTENDANCE',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 4),
        Text(
          '(Uganda Institute Of Information and Communications Technology)',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'Sign up to continue to UICT Online Attendance System',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildFormCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_message != null) ...[
              _buildMessageBanner(context),
              const SizedBox(height: 16),
            ],
            _fieldLabel(context, 'First Name *'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _firstNameController,
              validator: (v) => _validateRequired(v, 'First name'),
              onChanged: (_) => _clearFieldError('firstName'),
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Enter your first name',
                prefixIcon: Icon(Icons.person_outline_rounded,
                    color: AppColors.outline, size: 20),
              ),
            ),
            const SizedBox(height: 16),
            _fieldLabel(context, 'Last Name *'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _lastNameController,
              validator: (v) => _validateRequired(v, 'Last name'),
              onChanged: (_) => _clearFieldError('lastName'),
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Enter your last name',
                prefixIcon: Icon(Icons.person_outline_rounded,
                    color: AppColors.outline, size: 20),
              ),
            ),
            const SizedBox(height: 16),
            _fieldLabel(context, 'Email *'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _emailController,
              validator: _validateEmail,
              onChanged: (_) => _clearFieldError('email'),
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.mail_outline_rounded,
                    color: AppColors.outline, size: 20),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Expected format: yourname.${_role}@uict.ac.ug',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            _fieldLabel(context, 'Registration Number *'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _regNoController,
              validator: (v) => _validateRequired(v, 'Registration number'),
              onChanged: (_) => _clearFieldError('regNo'),
              maxLength: 20,
              buildCounter: (context,
                      {required currentLength, required isFocused, maxLength}) =>
                  null,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Eg 2025/DSWE/DAY/2240/G',
                prefixIcon: Icon(Icons.badge_outlined,
                    color: AppColors.emerald, size: 20),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Expected format: 2025/DSWE/DAY/2240/G',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            _fieldLabel(context, 'Password *'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _passwordController,
              validator: (v) => _validateRequired(v, 'Password'),
              obscureText: _obscurePassword,
              onChanged: (value) {
                _clearFieldError('password');
                _validatePasswordCriteria(value);
              },
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(letterSpacing: 1.5),
              decoration: InputDecoration(
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock_outline_rounded,
                    color: AppColors.outline, size: 20),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.onSurfaceVariant,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              child: _passwordController.text.isEmpty
                  ? const SizedBox(width: double.infinity)
                  : Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: _buildPasswordCriteria(context),
                    ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () => setState(() => _rememberMe = !_rememberMe),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() => _rememberMe = value ?? false);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Remember me',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBanner(BuildContext context) {
    final isError = _fieldError != null;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isError
            ? AppColors.crimson.withOpacity(0.08)
            : AppColors.secondaryContainer.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isError
              ? AppColors.crimson.withOpacity(0.3)
              : AppColors.secondaryContainer.withOpacity(0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 18,
            color: isError ? AppColors.crimson : AppColors.secondaryContainer,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _message ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isError
                        ? AppColors.crimson
                        : AppColors.secondaryContainer,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordCriteria(BuildContext context) {
    final items = <(bool, String)>[
      (_passwordCriteria.length, 'At least 8 characters'),
      (_passwordCriteria.uppercase, 'One uppercase letter'),
      (_passwordCriteria.lowercase, 'One lowercase letter'),
      (_passwordCriteria.number, 'One number'),
      (_passwordCriteria.special, 'One special character'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password must contain:',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            for (final (met, text) in items) _criteriaChip(context, met, text),
          ],
        ),
      ],
    );
  }

  Widget _criteriaChip(BuildContext context, bool met, String text) {
    return SizedBox(
      width: 160,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: met
                  ? AppColors.tertiaryContainer
                  : AppColors.surfaceContainerHigh,
            ),
            child: met
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: met
                        ? AppColors.tertiaryContainer
                        : AppColors.onSurfaceVariant,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fieldLabel(BuildContext context, String text) {
    return Text(text, style: Theme.of(context).textTheme.labelLarge);
  }

  Widget _buildSubmitButton(BuildContext context) {
    final isLoading = _submitState == _SubmitState.loading;
    final isSuccess = _submitState == _SubmitState.success;

    return ElevatedButton(
      onPressed: isLoading || isSuccess ? null : _handleSubmit,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSuccess ? AppColors.tertiaryContainer : AppColors.primaryContainer,
        disabledBackgroundColor:
            isSuccess ? AppColors.tertiaryContainer : AppColors.primaryContainer,
        disabledForegroundColor: Colors.white,
      ),
      child: isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Creating Account...',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : isSuccess
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.check_circle, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text('Success!'),
                  ],
                )
              : const Text('Sign up'),
    );
  }

  Widget _buildSignInRow(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            const TextSpan(text: 'Already have an account? '),
            TextSpan(
              text: 'Sign in',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()..onTap = _goToSignIn,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Text(
      '© 2026 Uganda Institute of Information and Communications '
      'Technology (UICT) · Developed By Maurice lubwama',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.outline,
            fontSize: 11,
          ),
    );
  }

  Widget _buildSuccessOverlay(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          color: AppColors.onSurface.withOpacity(0.35),
          padding: const EdgeInsets.all(24),
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.onSurface.withOpacity(0.2),
                    blurRadius: 32,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle,
                      size: 56, color: AppColors.tertiaryContainer),
                  const SizedBox(height: 16),
                  Text(
                    'Almost There!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Registration successful! Please check your email '
                    'inbox and click the verification link to activate '
                    'your account.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _resetForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.onSurface,
                    ),
                    child: const Text('Back to Sign up'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: _goToSignIn,
                    child: const Text('Go to Sign in'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}