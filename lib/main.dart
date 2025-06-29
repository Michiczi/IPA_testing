import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // runApp(DevicePreview(builder: (context) => MorrolingoApp()));
  runApp(MorrolingoApp());
}

class MorrolingoApp extends StatelessWidget {
  const MorrolingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'morrolingo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF222222),
        fontFamily: 'Segoe UI',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF00FF00),
          secondary: Colors.black,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: const MorrolingoHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MorrolingoHomePage extends StatefulWidget {
  const MorrolingoHomePage({super.key});

  @override
  State<MorrolingoHomePage> createState() => _MorrolingoHomePageState();
}

class _MorrolingoHomePageState extends State<MorrolingoHomePage>
    with TickerProviderStateMixin {
  late AnimationController _drawerController;
  late Animation<double> _drawerAnimation;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _drawerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _drawerController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _drawerController.forward();
      } else {
        _drawerController.reverse();
      }
    });
  }

  static const _instaUrl =
      'https://www.instagram.com/_.sliwka?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==';
  static const String _ttUrl =
      'https://www.tiktok.com/@_.sliwka?_t=8oG073Tcc6L&_r=1';
  static const String _ytUrl = 'https://www.youtube.com/@sliwkayt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Główna zawartość
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00FF00), Color(0xFF222222)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                transform: GradientRotation(135 * 3.1415926535 / 180),
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  padding: const EdgeInsets.fromLTRB(24, 48, 24, 48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Tytuł
                      const Text(
                        'Gdybyś zapomniała jaka z ciebie diwa',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Color(0xFF00FF00),
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 20,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Strzałka + podpis
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const _AnimatedArrow(),
                          const SizedBox(width: 16),
                          // const Text(
                          //   'Polecam to konto',
                          //   style: TextStyle(
                          //     fontSize: 22,
                          //     fontWeight: FontWeight.w500,
                          //     color: Color(0xFF00FF00),
                          //     shadows: [
                          //       Shadow(
                          //         color: Colors.black,
                          //         blurRadius: 8,
                          //         offset: Offset(0, 2),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      // Link do Instagrama jako własny przycisk
                      _InstagramButton(
                        onTap: () async {
                          final uri = Uri.parse(_instaUrl);
                          if (Theme.of(context).platform ==
                                  TargetPlatform.android ||
                              Theme.of(context).platform ==
                                  TargetPlatform.iOS) {
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          } else {
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.platformDefault,
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      _TikTokButton(
                        onTap: () async {
                          final uri = Uri.parse(_ttUrl);
                          if (Theme.of(context).platform ==
                                  TargetPlatform.android ||
                              Theme.of(context).platform ==
                                  TargetPlatform.iOS) {
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          } else {
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.platformDefault,
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      _YouTubeButton(
                        onTap: () async {
                          final uri = Uri.parse(_ytUrl);
                          if (Theme.of(context).platform ==
                                  TargetPlatform.android ||
                              Theme.of(context).platform ==
                                  TargetPlatform.iOS) {
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          } else {
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.platformDefault,
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Wysuwana sekcja z prawej strony
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: AnimatedBuilder(
              animation: _drawerAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    (1 - _drawerAnimation.value) *
                        (MediaQuery.of(context).size.width * 0.7),
                    0,
                  ),
                  child: child,
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(-5, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Uchwyt
                    Container(
                      width: double.infinity,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFF00FF00),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                    // Zawartość sekcji
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Psss.. ',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00FF00),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Otwórz przy pomocy safari a następnie dodaj do ekranu głównego😉',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Uchwyt na prawej krawędzi ekranu
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: _toggleDrawer,
              child: Container(
                width: 20,
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    width: 6,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00FF00),
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(-2, 0),
                        ),
                      ],
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
}

class _AnimatedArrow extends StatefulWidget {
  const _AnimatedArrow();

  @override
  State<_AnimatedArrow> createState() => _AnimatedArrowState();
}

class _AnimatedArrowState extends State<_AnimatedArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0,
      end: 16,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, _animation.value),
        child: child,
      ),
      child: SizedBox(
        width: 48,
        height: 48,
        child: CustomPaint(painter: _ArrowPainter()),
      ),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00FF00)
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // pionowa linia
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.125),
      Offset(size.width / 2, size.height * 0.875),
      paint,
    );
    // grot strzałki
    final path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.625);
    path.lineTo(size.width / 2, size.height * 0.875);
    path.lineTo(size.width * 0.75, size.height * 0.625);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Nowy widget przycisku
class _InstagramButton extends StatelessWidget {
  final VoidCallback onTap;
  const _InstagramButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 8, 20, 8),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(70),
          border: Border.all(color: Color(0xFF00FF00), width: 3),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF00FF00).withOpacity(0.3),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/lnstagram_account_logo.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              '@_.sliwka na Instagramie',
              style: TextStyle(
                color: Color(0xFF00FF00),
                fontWeight: FontWeight.bold,
                fontSize: 22,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TikTokButton extends StatelessWidget {
  final VoidCallback onTap;
  const _TikTokButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 8, 20, 8),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(70),
          border: Border.all(color: Color(0xFF00FF00), width: 3),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF00FF00).withOpacity(0.3),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/lnstagram_account_logo.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              '@_.sliwka na TikToku',
              style: TextStyle(
                color: Color(0xFF00FF00),
                fontWeight: FontWeight.bold,
                fontSize: 22,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _YouTubeButton extends StatelessWidget {
  final VoidCallback onTap;
  const _YouTubeButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 8, 20, 8),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(70),
          border: Border.all(color: Color(0xFF00FF00), width: 3),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF00FF00).withOpacity(0.3),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/lnstagram_account_logo.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              '@sliwkayt na YouTube',
              style: TextStyle(
                color: Color(0xFF00FF00),
                fontWeight: FontWeight.bold,
                fontSize: 22,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
