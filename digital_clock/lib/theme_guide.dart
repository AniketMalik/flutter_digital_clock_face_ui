import 'package:flutter/material.dart';
import 'dart:ui';

/// ## Description
///
/// ThemeGuide class constains all the `Theme` related properties that UI
/// widgets need like text-styles, background-colors, image-filter, etc.
/// Defined at a single place.
///
/// All the properties and styles are mentioned with heading for both card
/// types -- big and small -- separately.
///

class ThemeGuide {
  // [ Text Styles ] Cards Text Style which displays the time in bottom-left side.
  static const TextStyle bigCardTextStyle = TextStyle(
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );
  static const TextStyle smallCardTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // [ Background Color ] Cards background color
  static const Color cardBackground = Color.fromRGBO(0, 0, 0, 0.1);

  // [ Border Radius ] Border Radius for the big and small cards
  static final BorderRadius bigCardBorderRadius = BorderRadius.circular(10);
  static final BorderRadius smallCardBorderRadius = BorderRadius.circular(8);

  // [ Image Filter ] Image filter as a background for all the cards
  static final ImageFilter bigCardImageFilter = ImageFilter.blur(
    sigmaX: 10.0,
    sigmaY: 10.0,
  );
  static final ImageFilter smallCardImageFilter = ImageFilter.blur(
    sigmaX: 5.0,
    sigmaY: 5.0,
  );

  // [ Box Constraints ] Box Constraints for the big cards, set them according
  // to the size of the device.
  static const BoxConstraints bigBoxConstraints = BoxConstraints(
    maxHeight: 120,
    maxWidth: 120,
  );

  // [ Padding ] Padding for all the cards.
  static const EdgeInsets bigCardPadding = EdgeInsets.all(20.0);
  static const EdgeInsets smallCardPadding = EdgeInsets.all(10.0);
}
