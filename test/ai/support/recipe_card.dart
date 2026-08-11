import 'dart:typed_data';

import 'package:image/image.dart' as img;

const _width = 1000;
const _margin = 40;

Uint8List renderRecipeCard(String recipeText) {
  final font = img.arial48;
  final lineHeight = font.lineHeight;

  final lines = <String>[];
  for (final paragraph in recipeText.trim().split('\n')) {
    lines.addAll(_wrap(paragraph.trimRight(), font, _width - _margin * 2));
  }

  final image = img.Image(
    width: _width,
    height: _margin * 2 + lineHeight * lines.length,
    numChannels: 3,
  );
  img.fill(image, color: img.ColorRgb8(255, 253, 248));

  final ink = img.ColorRgb8(20, 20, 24);
  var y = _margin;
  for (final line in lines) {
    if (line.isNotEmpty) {
      img.drawString(image, line, font: font, x: _margin, y: y, color: ink);
    }
    y += lineHeight;
  }

  return img.encodeJpg(image, quality: 85);
}

List<String> _wrap(String text, img.BitmapFont font, int maxWidth) {
  if (text.isEmpty) return const [''];

  final lines = <String>[];
  var current = '';

  for (final word in text.split(' ')) {
    final candidate = current.isEmpty ? word : '$current $word';
    if (_textWidth(candidate, font) <= maxWidth) {
      current = candidate;
      continue;
    }
    if (current.isNotEmpty) lines.add(current);
    current = word;
  }

  if (current.isNotEmpty) lines.add(current);
  return lines;
}

int _textWidth(String text, img.BitmapFont font) => text.codeUnits.fold(
  0,
  (total, unit) => total + (font.characters[unit]?.xAdvance ?? 0),
);
