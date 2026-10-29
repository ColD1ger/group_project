import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 44,
            backgroundColor: Color(0xFF7C3AED),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 48,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Իմ պրոֆիլը',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Ֆիլմասեր',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
