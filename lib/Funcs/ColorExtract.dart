import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';

Future<Color?> getDominantColorFromImageUrl(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    final Uint8List bytes = response.bodyBytes;
    final imageProvider = MemoryImage(bytes);
    final paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);

    // Ignorar a cor branca (ou qualquer outra cor específica)
    final dominantColor = paletteGenerator.dominantColor;
    if (dominantColor != null && dominantColor.color != Colors.white) {
      return dominantColor.color;
    } else {
      return Colors.white;
    }
  } else {

    return Colors.white;
  }
}
