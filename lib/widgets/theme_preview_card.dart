import 'package:flutter/material.dart';
import 'package:nomo_ui_kit/components/buttons/primary/nomo_primary_button.dart';
import 'package:nomo_ui_kit/components/buttons/secondary/nomo_secondary_button.dart';
import 'package:nomo_ui_kit/components/divider/nomo_divider.dart';
import 'package:nomo_ui_kit/components/text/nomo_text.dart';
import 'package:nomo_ui_kit/theme/nomo_theme.dart';
import 'package:nomo_ui_kit/theme/sub/nomo_color_theme.dart';
import 'package:nomo_ui_kit/utils/layout_extensions.dart';
import 'package:swap_theme_webon/theme.dart';

class ThemePreviewCard extends StatelessWidget {
  final NomoColorThemeDataNullable theme;
  final String themeName;
  final bool isSelected;
  final VoidCallback onSelect;
  final ColorMode colorMode;

  const ThemePreviewCard({
    Key? key,
    required this.theme,
    required this.themeName,
    required this.isSelected,
    required this.onSelect,
    required this.colorMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        height: 156,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colors.background1,
          border: Border.all(
            color: isSelected
                ? theme.colors.primary
                : Colors.grey.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: theme.colors.primary.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 1,
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme name header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colors.surface,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(11)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NomoText(
                    themeName,
                    style: TextStyle(
                      color: theme.colors.foreground1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: theme.colors.primary,
                      size: 24,
                    ),
                ],
              ),
            ),
            // Color preview section
            16.vSpacing,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              height: 8,
              decoration: BoxDecoration(
                color: theme.colors.foreground1,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            8.vSpacing,
            Container(
              height: 8,
              width: MediaQuery.of(context).size.width * 0.2,
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: theme.colors.foreground1,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            16.vSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PrimaryNomoButton(
                      onPressed: () {},
                      height: 44,
                      backgroundColor: theme.colors.primary,
                      child: NomoText(
                        "Primary",
                        style: context.theme.typography.b1.copyWith(
                          color: theme.colors.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  12.hSpacing,
                  Expanded(
                    child: SecondaryNomoButton(
                      onPressed: () {},
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      borderRadius: BorderRadius.circular(8),
                      backgroundColor: theme.colors.background3,
                      child: NomoText(
                        "Secondary",
                        style: context.theme.typography.b1.copyWith(
                          color: theme.colors.foreground1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
