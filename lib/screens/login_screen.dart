import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';
import 'register_screen.dart';

/// Login screen for the UICT Online Attendance portal, matching the
/// "Executive Precision" design (see design/DESIGN.md + code.html).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum _SubmitState { idle, loading, success }

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _regNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberDevice = true;
  _SubmitState _submitState = _SubmitState.idle;

  @override
  void dispose() {
    _regNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateRegNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Registration number is required';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitState = _SubmitState.loading);

    // TODO: replace with real authentication call against the UICT backend.
    await Future.delayed(const Duration(milliseconds: 1400));

    if (!mounted) return;
    setState(() => _submitState = _SubmitState.success);

    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;
    setState(() => _submitState = _SubmitState.idle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Stack(
          children: [
            // Ambient decorative illumination (matches the blurred
            // primary/secondary-fixed circles in the reference design).
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
                      _buildSsoSection(context),
                      const SizedBox(height: 16),
                      _buildSignUpRow(context),
                      const SizedBox(height: 16),
                      _buildFooter(context),
                    ],
                  ),
                ),
              ),
            ),
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
          'Sign In',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
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
            _fieldLabel(context, 'Registration Number *'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _regNumberController,
              validator: _validateRegNumber,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Enter registration number',
                prefixIcon: Icon(
                  Icons.badge_outlined,
                  color: AppColors.emerald,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _fieldLabel(context, 'Password *'),
            const SizedBox(height: 6),
            TextFormField(
              controller: _passwordController,
              validator: _validatePassword,
              obscureText: _obscurePassword,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(letterSpacing: 2),
              decoration: InputDecoration(
                hintText: '••••••••••••',
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.outline,
                  size: 20,
                ),
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
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() => _rememberDevice = !_rememberDevice);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 18,
                        width: 18,
                        child: Checkbox(
                          value: _rememberDevice,
                          onChanged: (value) {
                            setState(
                                () => _rememberDevice = value ?? false);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Remember device',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: navigate to forgot-password flow.
                  },
                  child: const Text('Forgot password?'),
                ),
              ],
            ),
            const SizedBox(height: 4),
            _buildSubmitButton(context),
          ],
        ),
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
                  'Signing in...',
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
                    Text('Signed In!'),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Sign In'),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
    );
  }

  Widget _buildSsoSection(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(color: AppColors.surfaceContainerHigh, height: 1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'OR CONTINUE VIA',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Expanded(
              child: Divider(color: AppColors.surfaceContainerHigh, height: 1),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
                child: _ssoButton(context, 'Google', 'assets/icons/google.svg')),
            const SizedBox(width: 8),
            Expanded(
                child: _ssoButton(context, 'GitHub', 'assets/icons/github.svg')),
          ],
        ),
      ],
    );
  }

  Widget _ssoButton(BuildContext context, String label, String iconAsset) {
    return Material(
      color: AppColors.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          // TODO: wire up SSO provider.
        },
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.onSurface.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconAsset,
                width: 18,
                height: 18,
                colorFilter: label == 'GitHub'
                    ? const ColorFilter.mode(
                        AppColors.onSurface, BlendMode.srcIn)
                    : null,
              ),
              const SizedBox(width: 8),
              Text(label, style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpRow(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            const TextSpan(text: "Don't have an account? "),
            TextSpan(
              text: 'Sign up',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
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
}