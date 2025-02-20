class Colors {
  // Primary Color Palette (Blue)
  static const ColorPalette primary = ColorPalette(
    shade50: '#E3F2FD',
    shade100: '#BBDEFB',
    shade200: '#90CAF9',
    shade300: '#64B5F6',
    shade400: '#42A5F5',
    shade500: '#2196F3', // Primary color
    shade600: '#1E88E5',
    shade700: '#1976D2',
    shade800: '#1565C0',
    shade900: '#0D47A1',
  );

  // Secondary Color Palette (Purple)
  static const ColorPalette secondary = ColorPalette(
    shade50: '#F3E5F5',
    shade100: '#E1BEE7',
    shade200: '#CE93D8',
    shade300: '#BA68C8',
    shade400: '#AB47BC',
    shade500: '#9C27B0', // Secondary color
    shade600: '#8E24AA',
    shade700: '#7B1FA2',
    shade800: '#6A1B9A',
    shade900: '#4A148C',
  );

  // Red Palette
  static const ColorPalette red = ColorPalette(
    shade50: '#FFEBEE',
    shade100: '#FFCDD2',
    shade200: '#EF9A9A',
    shade300: '#E57373',
    shade400: '#EF5350',
    shade500: '#F44336',
    shade600: '#E53935',
    shade700: '#D32F2F',
    shade800: '#C62828',
    shade900: '#B71C1C',
  );

  // Green Palette
  static const ColorPalette green = ColorPalette(
    shade50: '#E8F5E9',
    shade100: '#C8E6C9',
    shade200: '#A5D6A7',
    shade300: '#81C784',
    shade400: '#66BB6A',
    shade500: '#4CAF50',
    shade600: '#43A047',
    shade700: '#388E3C',
    shade800: '#2E7D32',
    shade900: '#1B5E20',
  );

  // Yellow Palette
  static const ColorPalette yellow = ColorPalette(
    shade50: '#FFFDE7',
    shade100: '#FFF9C4',
    shade200: '#FFF59D',
    shade300: '#FFF176',
    shade400: '#FFEE58',
    shade500: '#FFEB3B',
    shade600: '#FDD835',
    shade700: '#FBC02D',
    shade800: '#F9A825',
    shade900: '#F57F17',
  );

  // Orange Palette
  static const ColorPalette orange = ColorPalette(
    shade50: '#FFF3E0',
    shade100: '#FFE0B2',
    shade200: '#FFCC80',
    shade300: '#FFB74D',
    shade400: '#FFA726',
    shade500: '#FF9800',
    shade600: '#FB8C00',
    shade700: '#F57C00',
    shade800: '#EF6C00',
    shade900: '#E65100',
  );

  // Grey Palette
  static const ColorPalette grey = ColorPalette(
    shade50: '#FAFAFA',
    shade100: '#F5F5F5',
    shade200: '#EEEEEE',
    shade300: '#E0E0E0',
    shade400: '#BDBDBD',
    shade500: '#9E9E9E',
    shade600: '#757575',
    shade700: '#616161',
    shade800: '#424242',
    shade900: '#212121',
  );

  // Pink Palette
  static const ColorPalette pink = ColorPalette(
    shade50: '#FCE4EC',
    shade100: '#F8BBD0',
    shade200: '#F48FB1',
    shade300: '#F06292',
    shade400: '#EC407A',
    shade500: '#E91E63',
    shade600: '#D81B60',
    shade700: '#C2185B',
    shade800: '#AD1457',
    shade900: '#880E4F',
  );

  // Cyan Palette
  static const ColorPalette cyan = ColorPalette(
    shade50: '#E0F7FA',
    shade100: '#B2EBF2',
    shade200: '#80DEEA',
    shade300: '#4DD0E1',
    shade400: '#26C6DA',
    shade500: '#00BCD4',
    shade600: '#00ACC1',
    shade700: '#0097A7',
    shade800: '#00838F',
    shade900: '#006064',
  );

  // Basic Colors
  static const String black = '#000000';
  static const String white = '#FFFFFF';
  static const String transparent = 'transparent';
}

/// Represents a color palette with shades from 50 (lightest) to 900 (darkest).
class ColorPalette {
  final String shade50;
  final String shade100;
  final String shade200;
  final String shade300;
  final String shade400;
  final String shade500;
  final String shade600;
  final String shade700;
  final String shade800;
  final String shade900;

  const ColorPalette({
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    required this.shade800,
    required this.shade900,
  });

  /// Returns the primary shade (500) when used as a string.
  @override
  String toString() => shade500;

  /// Get a shade dynamically (e.g., `Colors.green.getShade(700)`)
  String getShade(int shade) {
    switch (shade) {
      case 50:
        return shade50;
      case 100:
        return shade100;
      case 200:
        return shade200;
      case 300:
        return shade300;
      case 400:
        return shade400;
      case 500:
        return shade500;
      case 600:
        return shade600;
      case 700:
        return shade700;
      case 800:
        return shade800;
      case 900:
        return shade900;
      default:
        throw ArgumentError('Invalid shade. Choose from 50, 100, 200, 300, 400, 500, 600, 700, 800, 900.');
    }
  }
}
