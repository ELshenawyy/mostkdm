import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const ContactButton({
    super.key,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label,
                  style: const TextStyle(color: Colors.white, fontSize: 13)),
              const SizedBox(width: 6),
              Icon(icon, color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}