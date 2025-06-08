import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'add_new_story_screen.dart';
import '../models/story_model.dart';
import '../widgets/common/header_widget.dart';
import '../widgets/story/category_filter_widget.dart';
import '../widgets/story/story_card_widget.dart';
import 'story_detail_screen.dart'; // Ensure StoryDetailScreen is correctly imported.

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Semua';
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

  bool showMenu = false; // Toggle for the menu (Quiz and Add New Story)

  // Method untuk menambahkan cerita baru
  void _addNewStory(Story newStory) {
    setState(() {
      stories.add(newStory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cerita Rakyat Nusantara"),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white, // This makes the text white
        elevation: 0, // Remove shadow
      ),
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(),
            CategoryFilterWidget(
              selectedCategory: selectedCategory,
              onCategoryChanged: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: filteredStories.length,
                itemBuilder: (context, index) {
                  return StoryCardWidget(
                    story: filteredStories[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryDetailScreen(
                            story: filteredStories[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          // Main Floating Action Button
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.brown[700],
              onPressed: () {
                setState(() {
                  showMenu = !showMenu; // Toggle the menu when clicked
                });
              },
              child: Icon(
                showMenu ? Icons.close : Icons.add, // Change icon based on showMenu state
                color: Colors.white,
              ),
            ),
          ),
          // Floating Action Menu (Quiz and Add New Story)
          if (showMenu)
            Positioned(
              bottom: 100,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Quiz Menu Item
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizScreen()), // Navigate to Quiz screen
                      );
                    },
                    child: Icon(
                      Icons.quiz,
                      color: Colors.brown[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  // Add New Story Menu Item
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () async {
                      // Tutup menu terlebih dahulu
                      setState(() {
                        showMenu = false;
                      });

                      // Navigate to Add New Story screen dan tunggu hasil
                      final newStory = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewStoryScreen(),
                        ),
                      );

                      // Jika ada cerita baru yang dikembalikan, tambahkan ke list
                      if (newStory != null && newStory is Story) {
                        _addNewStory(newStory);

                        // Tampilkan konfirmasi bahwa cerita berhasil ditambahkan
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
                    child: Icon(
                      Icons.add,
                      color: Colors.brown[700],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}