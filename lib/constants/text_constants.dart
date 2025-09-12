import 'package:flutter/material.dart';
import 'color_constants.dart';

/// ✨ Reusable custom text styles (beyond global theme)
class TextConstants {
  // Section Headers
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorConstants.textPrimary,
  );

  // Subtitles / Descriptions
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorConstants.textSecondary,
  );

  // Chip Labels
  static const TextStyle chipLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ColorConstants.textPrimary,
  );

  // Price Highlight
  static const TextStyle price = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: ColorConstants.primaryOrange,
  );

  // Empty State Text
  static const TextStyle emptyState = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorConstants.textSecondary,
  );
}