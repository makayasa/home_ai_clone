import 'package:flutter/material.dart';
import 'package:home_ai_clone/l10n/app_localizations.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<String> _imageUrls = <String>[
    'https://www.figma.com/api/mcp/asset/a971ce0a-7115-485d-9cca-97b8328a307d',
    'https://www.figma.com/api/mcp/asset/5a365426-5339-46ce-8d62-aa7c37603265',
    'https://www.figma.com/api/mcp/asset/36951406-fabf-487a-a9e8-3f17e0af907f',
  ];

  List<_OnboardingItem> _localizedItems(AppLocalizations l10n) {
    return <_OnboardingItem>[
      _OnboardingItem(
        imageUrl: _imageUrls[0],
        title: l10n.onboardingWelcomeTitle,
        subtitle: l10n.onboardingWelcomeSubtitle,
        ctaLabel: l10n.ctaGetStarted,
      ),
      _OnboardingItem(
        imageUrl: _imageUrls[1],
        title: l10n.onboardingInteriorTitle,
        subtitle: l10n.onboardingInteriorSubtitle,
        ctaLabel: l10n.ctaContinue,
      ),
      _OnboardingItem(
        imageUrl: _imageUrls[2],
        title: l10n.onboardingLandscapeTitle,
        subtitle: l10n.onboardingLandscapeSubtitle,
        ctaLabel: l10n.ctaContinue,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleCtaTap() {
    if (_currentPage < _imageUrls.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.onboardingCompleted),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final List<_OnboardingItem> items = _localizedItems(l10n);
    final _OnboardingItem item = items[_currentPage];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                items[index].imageUrl,
                fit: BoxFit.cover,
              );
            },
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0x00000000),
                  Color(0x804B352A),
                ],
                stops: <double>[0.58, 1],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 30,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (_currentPage == 0) ...<Widget>[
                  const Icon(
                    Icons.home_rounded,
                    color: Colors.white,
                    size: 34,
                  ),
                  const SizedBox(height: 24),
                ],
                SizedBox(
                  width: 256,
                  child: Column(
                    children: <Widget>[
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40 / 1.65,
                          height: 22 / (40 / 1.65),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Manrope',
                        ),
                      ),
                      const SizedBox(height: 11),
                      Text(
                        item.subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 22 / 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Manrope',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 31),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: _handleCtaTap,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const StadiumBorder(),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 22 / 16,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    child: Text(item.ctaLabel),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(items.length, (int index) {
                    final bool isActive = index == _currentPage;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: isActive ? 17 : 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: isActive
                            ? Colors.white
                            : (_currentPage == items.length - 1
                                  ? const Color(0xFFD9D9D9)
                                  : Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingItem {
  const _OnboardingItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.ctaLabel,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final String ctaLabel;
}
