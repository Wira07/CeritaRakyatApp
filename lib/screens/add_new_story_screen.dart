import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/story_model.dart';

class AddNewStoryScreen extends StatefulWidget {
  @override
  _AddNewStoryScreenState createState() => _AddNewStoryScreenState();
}

class _AddNewStoryScreenState extends State<AddNewStoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _regionController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _wisdomController = TextEditingController();
  final _fullStoryController = TextEditingController();
  final _charactersController = TextEditingController();
  final _settingController = TextEditingController();
  final _minutesController = TextEditingController();
  final _secondsController = TextEditingController();

  String _selectedCategory = 'Legenda';
  String? _selectedImagePath;
  String? _selectedAudioPath;

  final List<String> _categories = [
    'Legenda',
    'Dongeng',
    'Fabel',
    'Mitos',
    'Hikayat'
  ];

  final List<String> _regions = [
    'Aceh',
    'Sumatera Utara',
    'Sumatera Barat',
    'Riau',
    'Jambi',
    'Sumatera Selatan',
    'Bengkulu',
    'Lampung',
    'DKI Jakarta',
    'Jawa Barat',
    'Jawa Tengah',
    'DI Yogyakarta',
    'Jawa Timur',
    'Banten',
    'Bali',
    'Nusa Tenggara Barat',
    'Nusa Tenggara Timur',
    'Kalimantan Barat',
    'Kalimantan Tengah',
    'Kalimantan Selatan',
    'Kalimantan Timur',
    'Kalimantan Utara',
    'Sulawesi Utara',
    'Sulawesi Tengah',
    'Sulawesi Selatan',
    'Sulawesi Tenggara',
    'Gorontalo',
    'Sulawesi Barat',
    'Maluku',
    'Maluku Utara',
    'Papua',
    'Papua Barat'
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _regionController.dispose();
    _descriptionController.dispose();
    _wisdomController.dispose();
    _fullStoryController.dispose();
    _charactersController.dispose();
    _settingController.dispose();
    _minutesController.dispose();
    _secondsController.dispose();
    super.dispose();
  }

  void _selectImage() async {
    // In a real app, you would use image_picker package
    // For now, we'll simulate selecting an image
    setState(() {
      _selectedImagePath = 'assets/images/selected_image.jpg';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gambar berhasil dipilih'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _selectAudio() async {
    // In a real app, you would use file_picker package
    // For now, we'll simulate selecting an audio file
    setState(() {
      _selectedAudioPath = 'assets/audio/selected_audio.mp3';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Audio berhasil dipilih'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _saveStory() {
    if (_formKey.currentState!.validate()) {
      // Buat objek Story baru
      final newStory = Story(
        id: DateTime.now().millisecondsSinceEpoch.toString(), // Generate unique ID
        title: _titleController.text,
        region: _regionController.text.isEmpty ? 'Tidak diketahui' : _regionController.text,
        category: _selectedCategory,
        description: _descriptionController.text,
        audioUrl: _selectedAudioPath ?? 'assets/audio/default.mp3',
        imageUrl: _selectedImagePath ?? 'assets/images/default.jpg',
        duration: Duration(
          minutes: int.tryParse(_minutesController.text) ?? 0,
          seconds: int.tryParse(_secondsController.text) ?? 0,
        ),
        wisdom: _wisdomController.text.isEmpty ? 'Hikmah akan ditambahkan kemudian' : _wisdomController.text,
        fullStory: _fullStoryController.text,
        characters: _charactersController.text.isEmpty
            ? ['Karakter akan ditambahkan kemudian']
            : _charactersController.text.split(',').map((e) => e.trim()).toList(),
        setting: _settingController.text.isEmpty ? 'Setting akan ditambahkan kemudian' : _settingController.text,
      );

      // Langsung kembali ke home screen dengan cerita baru
      Navigator.of(context).pop(newStory);

      // Tampilkan snackbar sukses di home screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Text('Cerita "${_titleController.text}" berhasil ditambahkan!'),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Tambah Cerita Baru',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown[700],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: _saveStory,
            child: Text(
              'SIMPAN',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.brown[600]!, Colors.brown[800]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.auto_stories,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Cerita Rakyat Nusantara',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Lestarikan budaya Indonesia',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Basic Information Section
              _buildSectionTitle('Informasi Dasar'),
              SizedBox(height: 15),

              _buildTextField(
                controller: _titleController,
                label: 'Judul Cerita',
                icon: Icons.title,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul cerita harus diisi';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              _buildDropdownField(
                label: 'Asal Daerah',
                icon: Icons.location_on,
                value: _regionController.text.isEmpty ? null : _regionController.text,
                items: _regions,
                onChanged: (value) {
                  setState(() {
                    _regionController.text = value ?? '';
                  });
                },
              ),

              SizedBox(height: 16),

              _buildDropdownField(
                label: 'Kategori',
                icon: Icons.category,
                value: _selectedCategory,
                items: _categories,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value ?? 'Legenda';
                  });
                },
              ),

              SizedBox(height: 16),

              _buildTextField(
                controller: _descriptionController,
                label: 'Deskripsi Singkat',
                icon: Icons.description,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi harus diisi';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              // Media Section
              _buildSectionTitle('Media'),
              SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _buildMediaButton(
                      label: 'Pilih Gambar',
                      icon: Icons.image,
                      isSelected: _selectedImagePath != null,
                      onTap: _selectImage,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildMediaButton(
                      label: 'Pilih Audio',
                      icon: Icons.audiotrack,
                      isSelected: _selectedAudioPath != null,
                      onTap: _selectAudio,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Duration Section
              _buildSectionTitle('Durasi Audio'),
              SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _minutesController,
                      label: 'Menit',
                      icon: Icons.timer,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      controller: _secondsController,
                      label: 'Detik',
                      icon: Icons.timer,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Story Details Section
              _buildSectionTitle('Detail Cerita'),
              SizedBox(height: 15),

              _buildTextField(
                controller: _charactersController,
                label: 'Tokoh Utama (pisahkan dengan koma)',
                icon: Icons.people,
                placeholder: 'Contoh: Malin Kundang, Ibu, Pedagang',
              ),

              SizedBox(height: 16),

              _buildTextField(
                controller: _settingController,
                label: 'Latar Tempat',
                icon: Icons.landscape,
                placeholder: 'Contoh: Pantai, Desa nelayan',
              ),

              SizedBox(height: 16),

              _buildTextField(
                controller: _wisdomController,
                label: 'Pesan Moral',
                icon: Icons.lightbulb,
                maxLines: 2,
                placeholder: 'Nilai-nilai yang dapat dipetik dari cerita',
              ),

              SizedBox(height: 16),

              _buildTextField(
                controller: _fullStoryController,
                label: 'Cerita Lengkap',
                icon: Icons.menu_book,
                maxLines: 8,
                placeholder: 'Tulis cerita lengkap di sini...',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Cerita lengkap harus diisi';
                  }
                  return null;
                },
              ),

              SizedBox(height: 40),

              // Save Button
              Container(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _saveStory,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.save, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'SIMPAN CERITA',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.brown[800],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    String? placeholder,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          prefixIcon: Icon(icon, color: Colors.brown[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required IconData icon,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.brown[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (label == 'Asal Daerah') {
            // Asal daerah tidak wajib diisi
            return null;
          }
          if (value == null || value.isEmpty) {
            return '$label harus dipilih';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildMediaButton({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.brown[700],
        ),
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.brown[700],
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.green : Colors.white,
          side: BorderSide(
            color: isSelected ? Colors.green : Colors.brown[300]!,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: isSelected ? 3 : 1,
        ),
      ),
    );
  }
}