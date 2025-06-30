import 'package:flutter/material.dart';

class ProfileDialogs {
  static void showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }

  static void showSecurityDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fitur keamanan akan segera tersedia')),
    );
  }

  static void showActivityHistory(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Menampilkan riwayat aktivitas...')),
    );
  }

  static void showLanguageDialog(
      BuildContext context,
      String selectedLanguage,
      Function(String) onLanguageChanged,
      ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pilih Bahasa'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: Text('Bahasa Indonesia'),
              value: 'Bahasa Indonesia',
              groupValue: selectedLanguage,
              onChanged: (value) {
                onLanguageChanged(value!);
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: Text('English'),
              value: 'English',
              groupValue: selectedLanguage,
              onChanged: (value) {
                onLanguageChanged(value!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  static void showHelpCenter(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Membuka pusat bantuan...')),
    );
  }

  static void showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Berikan Feedback'),
        content: TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Tulis feedback Anda di sini...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Kirim'),
          ),
        ],
      ),
    );
  }

  static void showAppAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Aplikasi Kuis',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2024 Tim Pengembang',
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('Aplikasi pembelajaran interaktif dengan fitur kuis dan materi edukatif.'),
        ),
      ],
    );
  }

  static void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Konfirmasi Keluar'),
        content: Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Berhasil keluar dari aplikasi')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[700],
            ),
            child: Text('Keluar'),
          ),
        ],
      ),
    );
  }
}