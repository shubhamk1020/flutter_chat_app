import 'package:flutter/material.dart';
import 'package:flutter_chat_app/theme.dart';

class GlowingActionButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final double size;
  final VoidCallback onPressed;

  const GlowingActionButton({super.key, required this.color, required this.icon, required this.size, required this.onPressed});

  


  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: color, 
    shape: BoxShape.circle, boxShadow: [
      BoxShadow(
        color: color.withOpacity(0.3),
        spreadRadius: 8,
        blurRadius: 24
      )

    ]),
    child: ClipOval(child: Material(color: color,
    child: InkWell(splashColor: AppColors.cardLight,
    onTap: onPressed,
    child: SizedBox(width: size, height: size, 
    child: Icon(icon, size: 24,
    color: Colors.white,
    ),
    ),
    ),
    )
    ),
    );
  }
}