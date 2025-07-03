import 'package:flutter/material.dart';

class StatisticsCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              'Kuis Selesai',
              '24',
              Icons.quiz_rounded,
              Colors.blue[50]!,
              Colors.blue[600]!,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              'Poin Total',
              '1,250',
              Icons.stars_rounded,
              Colors.amber[50]!,
              Colors.amber[700]!,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              'Peringkat',
              '#15',
              Icons.leaderboard_rounded,
              Colors.green[50]!,
              Colors.green[600]!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color bgColor,
    Color accentColor,
  ) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          // Icon with colored background
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accentColor, size: 24),
          ),

          SizedBox(height: 12),

          // Value with better typography
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.grey[800],
              letterSpacing: -0.5,
            ),
          ),

          SizedBox(height: 4),

          // Title with refined styling
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
