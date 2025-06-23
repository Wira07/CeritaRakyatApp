import 'package:flutter/material.dart';
import '../navigasi/CustomBottomNavigation.dart';
import 'quiz_screen.dart';
import 'add_new_story_screen.dart';
import '../models/story_model.dart';
import '../widgets/common/header_widget.dart';
import '../widgets/story/category_filter_widget.dart';
import '../widgets/story/story_card_widget.dart';
import 'story_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  String selectedCategory = 'Semua';
  bool showMenu = false;
  int _currentIndex = 0;

  // Animation Controllers
  late AnimationController _headerAnimationController;
  late AnimationController _contentAnimationController;
  late AnimationController _fabAnimationController;

  // Animations
  late Animation<Offset> _headerSlideAnimation;
  late Animation<double> _headerFadeAnimation;
  late Animation<double> _contentFadeAnimation;
  late Animation<Offset> _contentSlideAnimation;
  late Animation<double> _fabScaleAnimation;

  List<Story> stories = [
    Story(
      id: '1',
      title: 'Malin Kundang',
      region: 'Sumatera Barat',
      category: 'Legenda',
      description: 'Kisah tentang anak durhaka yang dikutuk menjadi batu',
      audioUrl: 'assets/audio/malin_kundang.mp3',
      imageUrl: 'assets/images/malin_kundang.jpg',
      duration: Duration(minutes: 8, seconds: 30),
      wisdom: 'Berbakti kepada orang tua adalah kewajiban yang mulia',
      fullStory: '',
      characters: ['Malin', 'Ibu', 'Batu'],
      setting: 'Pantai',
    ),
    Story(
      id: '2',
      title: 'Sangkuriang',
      region: 'Jawa Barat',
      category: 'Legenda',
      description: 'Legenda terbentuknya Gunung Tangkuban Perahu',
      audioUrl: 'assets/audio/sangkuriang.mp3',
      imageUrl: 'assets/images/sangkuriang.jpg',
      duration: Duration(minutes: 12, seconds: 15),
      wisdom: 'Kesabaran dan kebijaksanaan mengalahkan amarah',
      fullStory: '',
      characters: ['Sangkuriang', 'Dayang Sumbi'],
      setting: 'Gunung',
    ),
    Story(
      id: '3',
      title: 'Timun Mas',
      region: 'Jawa Tengah',
      category: 'Dongeng',
      description: 'Petualangan gadis kecil melawan raksasa',
      audioUrl: 'assets/audio/timun_mas.mp3',
      imageUrl: 'assets/images/timun_mas.jpg',
      duration: Duration(minutes: 10, seconds: 45),
      wisdom: 'Keberanian dan kecerdikan dapat mengalahkan kekuatan',
      fullStory: '',
      characters: ['Timun Mas', 'Raksasa'],
      setting: 'Hutan',
    ),
  ];

  List<Story> get filteredStories {
    if (selectedCategory == 'Semua') {
      return stories;
    }
    return stories.where((story) => story.category == selectedCategory).toList();
  }

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _headerAnimationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _contentAnimationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    // Initialize animations
    _headerSlideAnimation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _headerAnimationController,
      curve: Curves.easeOutBack,
    ));

    _headerFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _headerAnimationController,
      curve: Curves.easeOut,
    ));

    _contentFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _contentAnimationController,
      curve: Curves.easeOut,
    ));

    _contentSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _contentAnimationController,
      curve: Curves.easeOutCubic,
    ));

    _fabScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.elasticOut,
    ));

    // Start animations with delays
    _startAnimations();
  }

  void _startAnimations() async {
    // Start header animation immediately
    _headerAnimationController.forward();

    // Start content animation after short delay
    await Future.delayed(Duration(milliseconds: 300));
    _contentAnimationController.forward();

    // Start FAB animation after content
    await Future.delayed(Duration(milliseconds: 500));
    _fabAnimationController.forward();
  }

  @override
  void dispose() {
    _headerAnimationController.dispose();
    _contentAnimationController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  void _addNewStory(Story newStory) {
    setState(() {
      stories.add(newStory);
    });
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
      showMenu = false; // Close FAB menu when changing tabs
    });

    switch (index) {
      case 0:
      // Already on Home
        break;
      case 1:
      // Navigate to Favorites (you can implement this)
        _showComingSoonDialog('Favorit');
        break;
      case 2:
      // Navigate to Quiz
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => QuizScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            transitionDuration: Duration(milliseconds: 300),
          ),
        );
        break;
      case 3:
      // Navigate to Profile (you can implement this)
        _showComingSoonDialog('Profile');
        break;
    }
  }

  void _showComingSoonDialog(String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Segera Hadir'),
        content: Text('Fitur $feature akan segera tersedia dalam update berikutnya.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return Column(
      children: [
        // Animated Header Widget
        SlideTransition(
          position: _headerSlideAnimation,
          child: FadeTransition(
            opacity: _headerFadeAnimation,
            child: HeaderWidget(),
          ),
        ),

        // Animated Category Filter
        SlideTransition(
          position: _contentSlideAnimation,
          child: FadeTransition(
            opacity: _contentFadeAnimation,
            child: CategoryFilterWidget(
              selectedCategory: selectedCategory,
              onCategoryChanged: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
          ),
        ),

        // Animated Story List
        Expanded(
          child: SlideTransition(
            position: _contentSlideAnimation,
            child: FadeTransition(
              opacity: _contentFadeAnimation,
              child: AnimatedList(
                padding: EdgeInsets.all(16),
                initialItemCount: filteredStories.length,
                itemBuilder: (context, index, animation) {
                  if (index >= filteredStories.length) return SizedBox.shrink();

                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutCubic,
                    )),
                    child: FadeTransition(
                      opacity: animation,
                      child: TweenAnimationBuilder(
                        duration: Duration(milliseconds: 300 + (index * 100)),
                        tween: Tween<double>(begin: 0, end: 1),
                        builder: (context, double value, child) {
                          return Transform.translate(
                            offset: Offset(0, 30 * (1 - value)),
                            child: Opacity(
                              opacity: value,
                              child: StoryCardWidget(
                                story: filteredStories[index],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          StoryDetailScreen(story: filteredStories[index]),
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
                                      transitionDuration: Duration(milliseconds: 400),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SlideTransition(
          position: _headerSlideAnimation,
          child: FadeTransition(
            opacity: _headerFadeAnimation,
            child: AppBar(
              title: Text("Cerita Rakyat Nusantara"),
              backgroundColor: Colors.brown[700],
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: _buildHomeContent(),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap, favoriteStories: [], onRemoveFromFavorites: (Story ) {  },
      ),
      floatingActionButton: ScaleTransition(
        scale: _fabScaleAnimation,
        child: FloatingActionButton(
          backgroundColor: Colors.brown[700],
          onPressed: () async {
            final newStory = await Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => AddNewStoryScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
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
                transitionDuration: Duration(milliseconds: 400),
              ),
            );

            if (newStory != null && newStory is Story) {
              _addNewStory(newStory);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Cerita "${newStory.title}" berhasil ditambahkan!'),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 3),
                ),
              );
            }
          },
          tooltip: 'Tambah Cerita Baru',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}