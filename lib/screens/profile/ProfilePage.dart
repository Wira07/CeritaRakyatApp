import 'package:flutter/material.dart';
import 'widgets/profile_header.dart';
import 'widgets/statistics_cards.dart';
import 'widgets/menu_section.dart';
import 'widgets/logout_button.dart';
import 'dialogs/profile_dialogs.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'Bahasa Indonesia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.brown[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.brown[800]),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.brown[700]),
            onPressed: () => ProfileDialogs.showEditProfileDialog(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ProfileHeader(),
            SizedBox(height: 24),
            StatisticsCards(),
            SizedBox(height: 24),
            _buildAccountSection(),
            SizedBox(height: 16),
            _buildSettingsSection(),
            SizedBox(height: 16),
            _buildHelpSection(),
            SizedBox(height: 24),
            LogoutButton(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSection() {
    return MenuSection(
      title: 'Akun',
      items: [
        MenuSection.buildMenuItem(
          Icons.person_outline,
          'Edit Profile',
          'Ubah informasi personal Anda',
          onTap: () => ProfileDialogs.showEditProfileDialog(context),
        ),
        MenuSection.buildMenuItem(
          Icons.security,
          'Keamanan',
          'Ubah password dan pengaturan keamanan',
          onTap: () => ProfileDialogs.showSecurityDialog(context),
        ),
        MenuSection.buildMenuItem(
          Icons.history,
          'Riwayat Aktivitas',
          'Lihat riwayat kuis dan pembelajaran',
          onTap: () => ProfileDialogs.showActivityHistory(context),
        ),
      ],
    );
  }

  Widget _buildSettingsSection() {
    return MenuSection(
      title: 'Pengaturan',
      items: [
        MenuSection.buildSwitchMenuItem(
          Icons.notifications_outlined,
          'Notifikasi',
          'Terima pemberitahuan aplikasi',
          _notificationsEnabled,
              (value) => setState(() => _notificationsEnabled = value),
        ),
        MenuSection.buildSwitchMenuItem(
          Icons.dark_mode_outlined,
          'Mode Gelap',
          'Gunakan tema gelap',
          _darkModeEnabled,
              (value) => setState(() => _darkModeEnabled = value),
        ),
        MenuSection.buildMenuItem(
          Icons.language,
          'Bahasa',
          _selectedLanguage,
          onTap: () => ProfileDialogs.showLanguageDialog(
            context,
            _selectedLanguage,
                (value) => setState(() => _selectedLanguage = value),
          ),
        ),
      ],
    );
  }

  Widget _buildHelpSection() {
    return MenuSection(
      title: 'Bantuan',
      items: [
        MenuSection.buildMenuItem(
          Icons.help_outline,
          'Pusat Bantuan',
          'FAQ dan panduan penggunaan',
          onTap: () => ProfileDialogs.showHelpCenter(context),
        ),
        MenuSection.buildMenuItem(
          Icons.feedback_outlined,
          'Berikan Feedback',
          'Bantu kami meningkatkan aplikasi',
          onTap: () => ProfileDialogs.showFeedbackDialog(context),
        ),
        MenuSection.buildMenuItem(
          Icons.info_outline,
          'Tentang Aplikasi',
          'Versi 1.0.0',
          onTap: () => ProfileDialogs.showAppAboutDialog(context),
        ),
      ],
    );
  }
}