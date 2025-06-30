import 'package:flutter/material.dart';

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
            onPressed: () => _showEditProfileDialog(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(),
            SizedBox(height: 24),

            // Statistics Cards
            _buildStatisticsCards(),
            SizedBox(height: 24),

            // Menu Items
            _buildMenuSection('Akun', [
              _buildMenuItem(
                Icons.person_outline,
                'Edit Profile',
                'Ubah informasi personal Anda',
                onTap: () => _showEditProfileDialog(),
              ),
              _buildMenuItem(
                Icons.security,
                'Keamanan',
                'Ubah password dan pengaturan keamanan',
                onTap: () => _showSecurityDialog(),
              ),
              _buildMenuItem(
                Icons.history,
                'Riwayat Aktivitas',
                'Lihat riwayat kuis dan pembelajaran',
                onTap: () => _showActivityHistory(),
              ),
            ]),

            SizedBox(height: 16),

            _buildMenuSection('Pengaturan', [
              _buildSwitchMenuItem(
                Icons.notifications_outlined,
                'Notifikasi',
                'Terima pemberitahuan aplikasi',
                _notificationsEnabled,
                    (value) => setState(() => _notificationsEnabled = value),
              ),
              _buildSwitchMenuItem(
                Icons.dark_mode_outlined,
                'Mode Gelap',
                'Gunakan tema gelap',
                _darkModeEnabled,
                    (value) => setState(() => _darkModeEnabled = value),
              ),
              _buildMenuItem(
                Icons.language,
                'Bahasa',
                _selectedLanguage,
                onTap: () => _showLanguageDialog(),
              ),
            ]),

            SizedBox(height: 16),

            _buildMenuSection('Bantuan', [
              _buildMenuItem(
                Icons.help_outline,
                'Pusat Bantuan',
                'FAQ dan panduan penggunaan',
                onTap: () => _showHelpCenter(),
              ),
              _buildMenuItem(
                Icons.feedback_outlined,
                'Berikan Feedback',
                'Bantu kami meningkatkan aplikasi',
                onTap: () => _showFeedbackDialog(),
              ),
              _buildMenuItem(
                Icons.info_outline,
                'Tentang Aplikasi',
                'Versi 1.0.0',
                onTap: () => _showAboutDialog(),
              ),
            ]),

            SizedBox(height: 24),

            // Logout Button
            _buildLogoutButton(),

            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.brown[100],
                backgroundImage: AssetImage('assets/profile_placeholder.png'), // Ganti dengan gambar profil
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.brown[300],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.brown[700],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Sri Yanti S.Pd',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
          SizedBox(height: 4),
          Text(
            'sriyanti@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.brown[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Member sejak Jan 2024',
              style: TextStyle(
                fontSize: 12,
                color: Colors.brown[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsCards() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard('Kuis Selesai', '24', Icons.quiz_outlined),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _buildStatCard('Poin Total', '1,250', Icons.stars_outlined),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _buildStatCard('Peringkat', '#15', Icons.leaderboard_outlined),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.brown[700], size: 24),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.brown[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.brown[700], size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.brown[800],
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
      onTap: onTap,
    );
  }

  Widget _buildSwitchMenuItem(IconData icon, String title, String subtitle, bool value, Function(bool) onChanged) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.brown[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.brown[700], size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.brown[800],
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.brown[700],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _showLogoutDialog(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red[50],
          foregroundColor: Colors.red[700],
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.red[200]!),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, size: 20),
            SizedBox(width: 8),
            Text(
              'Keluar',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog Methods
  void _showEditProfileDialog() {
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

  void _showSecurityDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fitur keamanan akan segera tersedia')),
    );
  }

  void _showActivityHistory() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Menampilkan riwayat aktivitas...')),
    );
  }

  void _showLanguageDialog() {
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
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() => _selectedLanguage = value!);
                Navigator.pop(context);
              },
            ),
            RadioListTile<String>(
              title: Text('English'),
              value: 'English',
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() => _selectedLanguage = value!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showHelpCenter() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Membuka pusat bantuan...')),
    );
  }

  void _showFeedbackDialog() {
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

  void _showAboutDialog() {
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

  void _showLogoutDialog() {
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
              // Implement logout logic here
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