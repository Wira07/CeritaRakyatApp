import 'package:ceritarakyatapp/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'dashboard/components/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  List<OnboardingData> onboardingData = [
    OnboardingData(
      title: "Jelajahi Cerita Nusantara",
      description: "Temukan koleksi lengkap cerita rakyat dari berbagai daerah di Indonesia. Dari legenda hingga dongeng yang penuh makna.",
      icon: Icons.explore,
      color: Colors.blue[600]!,
    ),
    OnboardingData(
      title: "Dengarkan & Pelajari",
      description: "Nikmati audio cerita yang menarik dan pelajari nilai-nilai kearifan lokal dari setiap cerita yang ada.",
      icon: Icons.headphones,
      color: Colors.green[600]!,
    ),
    OnboardingData(
      title: "Uji Pemahaman",
      description: "Ikuti kuis interaktif untuk menguji pemahaman Anda tentang cerita yang telah dibaca dan tambahkan cerita favorit Anda sendiri.",
      icon: Icons.quiz,
      color: Colors.orange[600]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background putih
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Skip button
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Panduan Aplikasi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.brown[800],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Lewati',
                        style: TextStyle(
                          color: Colors.brown[600],
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      data: onboardingData[index],
                      index: index,
                    );
                  },
                ),
              ),

              // Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                      (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 8,
                    width: currentIndex == index ? 24 : 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? Colors.brown[700]
                          : Colors.brown[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Navigation buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Previous button
                    currentIndex > 0
                        ? TextButton.icon(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.brown[600]),
                      label: Text(
                        'Sebelumnya',
                        style: TextStyle(color: Colors.brown[600]),
                      ),
                    )
                        : SizedBox(width: 100),

                    // Next/Get Started button
                    ElevatedButton(
                      onPressed: () {
                        if (currentIndex == onboardingData.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                var begin = Offset(1.0, 0.0);
                                var end = Offset.zero;
                                var curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end).chain(
                                  CurveTween(curve: curve),
                                );

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                              transitionDuration: Duration(milliseconds: 500),
                            ),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[700],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            currentIndex == onboardingData.length - 1
                                ? 'Mulai'
                                : 'Selanjutnya',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            currentIndex == onboardingData.length - 1
                                ? Icons.home
                                : Icons.arrow_forward,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  final int index;

  const OnboardingPage({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Icon
          TweenAnimationBuilder(
            duration: Duration(milliseconds: 800),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double value, child) {
              return Transform.scale(
                scale: 0.5 + (value * 0.5),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: data.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(75),
                    border: Border.all(
                      color: data.color.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    data.icon,
                    size: 80,
                    color: data.color,
                  ),
                ),
              );
            },
          ),

          SizedBox(height: 50),

          // Title
          Text(
            data.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 25),

          // Description
          Text(
            data.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.brown[600],
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 40),

          // Additional decorative elements
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 3,
                decoration: BoxDecoration(
                  color: data.color.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 20,
                height: 3,
                decoration: BoxDecoration(
                  color: data.color.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}