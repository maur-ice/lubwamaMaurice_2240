import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';

/// Forgot-password screen for the UICT Online Attendance portal.
///
/// Mirrors the web app's `ForgotPassword` React page: a two-state card
/// (email form → success confirmation) with a floating icon, animated
/// accents, and a link back to the login screen.
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  bool _isLoading = false;
  bool _emailSent = false;
  String _message = '';
  String _error = '';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _error = '';
      _message = '';
    });

    // TODO: replace with real call to POST `${API_URL}/auth/forgot-password`.
    await Future.delayed(const Duration(milliseconds: 1400));

    if (!mounted) return;

    // Simulated success — swap for real response handling.
    setState(() {
      _isLoading = false;
      _emailSent = true;
      _message = 'Password reset link sent!';
    });
  }

  void _handleResend() {
    setState(() {
      _emailSent = false;
      _message = '';
      _error = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Stack(
          children: [
            // Ambient decorative illumination, matching the login screen.
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
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    child: _emailSent
                        ? _buildSuccessCard(context)
                        : _buildFormCard(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Shared decoration
  // ---------------------------------------------------------------------

  Widget _blurredCircle(double size, Color color, double opacity) {
    return IgnorePointer(
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
          child: Container(
            height: size,
            width: size,
            color: color.withValues(alpha: opacity),
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child, required Key key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }

  // ---------------------------------------------------------------------
  // State 1 — email form
  // ---------------------------------------------------------------------

  Widget _buildFormCard(BuildContext context) {
    return _card(
      key: const ValueKey('form'),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Forgot your password?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.bodySmall,
                children: [
                  const TextSpan(
                    text:
                        'Enter your registered email below to receive '
                        'password reset instructions. If you don\'t receive '
                        'an email, please check your spam folder or reach '
                        'out to the developer at ',
                  ),
                  TextSpan(
                    text: 'mauricelubwama@gmail.com',
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Floating mail illustration
            Center(child: _mailIllustration()),
            const SizedBox(height: 24),

            // Email field
            Text(
              'Email',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: _emailController,
              validator: _validateEmail,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _handleSubmit(),
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                prefixIcon: Icon(
                  Icons.mail_outline_rounded,
                  color: AppColors.outline,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Error banner
            if (_error.isNotEmpty) ...[
              _banner(
                context,
                icon: Icons.error_outline,
                background: AppColors.error.withValues(alpha: 0.08),
                border: AppColors.error.withValues(alpha: 0.25),
                iconColor: AppColors.error,
                textColor: AppColors.error,
                text: _error,
              ),
              const SizedBox(height: 16),
            ],

            // Submit button
            ElevatedButton(
              onPressed: _isLoading ? null : _handleSubmit,
              child: _isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Sending...',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : const Text('Send'),
            ),
            const SizedBox(height: 12),

            // Remember password? Login
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    const TextSpan(text: 'Remember password? '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  // State 2 — success confirmation
  // ---------------------------------------------------------------------

  Widget _buildSuccessCard(BuildContext context) {
    return _card(
      key: const ValueKey('success'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Email has been sent!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Please check your inbox and click the received link to reset '
            'your password.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 24),

          Center(child: _mailIllustration(success: true)),
          const SizedBox(height: 24),

          if (_message.isNotEmpty) ...[
            _banner(
              context,
              icon: Icons.check_circle_outline,
              background: AppColors.tertiaryContainer.withValues(alpha: 0.10),
              border: AppColors.tertiaryContainer.withValues(alpha: 0.35),
              iconColor: AppColors.emerald,
              textColor: AppColors.emerald,
              text: _message,
            ),
            const SizedBox(height: 16),
          ],

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Login'),
          ),
          const SizedBox(height: 12),

          Center(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall,
                children: [
                  const TextSpan(text: "Didn't receive the link? "),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GestureDetector(
                      onTap: _handleResend,
                      child: Text(
                        'Resend',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------

  /// Floating mail icon with an animated accent bubble, matching the
  /// `motion.div` illustration in the React source.
  Widget _mailIllustration({bool success = false}) {
    final accentStart =
        success ? const Color(0xFF34D399) : const Color(0xFFF87171);
    final accentEnd =
        success ? const Color(0xFF10B981) : const Color(0xFFEC4899);
    final accentIcon =
        success ? Icons.check_rounded : Icons.send_rounded;

    return SizedBox(
      height: 160,
      width: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Glow
          Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (success
                      ? AppColors.tertiaryContainer
                      : AppColors.primaryContainer)
                  .withValues(alpha: 0.15),
            ),
          ),
          // Icon card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.onSurface.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Icon(
              Icons.mail_outline_rounded,
              size: 72,
              color: AppColors.primaryContainer,
            ),
          ),
          // Accent bubble
          Positioned(
            right: 8,
            bottom: 8,
            child: _PulsingBubble(
              gradientStart: accentStart,
              gradientEnd: accentEnd,
              icon: accentIcon,
            ),
          ),
        ],
      ),
    );
  }

  Widget _banner(
    BuildContext context, {
    required IconData icon,
    required Color background,
    required Color border,
    required Color iconColor,
    required Color textColor,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}

/// Small gradient circle with an icon, gently floating — replaces the
/// `motion.div` accent bubble in the React component.
class _PulsingBubble extends StatefulWidget {
  const _PulsingBubble({
    required this.gradientStart,
    required this.gradientEnd,
    required this.icon,
  });

  final Color gradientStart;
  final Color gradientEnd;
  final IconData icon;

  @override
  State<_PulsingBubble> createState() => _PulsingBubbleState();
}

class _PulsingBubbleState extends State<_PulsingBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeInOut.transform(_controller.value);
        return Transform.translate(
          offset: Offset(0, -6 * t),
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [widget.gradientStart, widget.gradientEnd],
          ),
          boxShadow: [
            BoxShadow(
              color: widget.gradientEnd.withValues(alpha: 0.35),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(widget.icon, color: Colors.white, size: 20),
      ),
    );
  } //
}