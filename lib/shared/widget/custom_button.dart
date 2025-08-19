import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:artora/shared/widget/glassmorphism.dart';


class CustomButton extends StatelessWidget {
  final ThemeData theme;
  final String text;
  final IconData icon;
  const CustomButton({
    super.key,
    required this.theme,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GlassMorphism(
        backgroundColor: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const Gap(4),
              Text(
                text,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              const Gap(4),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
