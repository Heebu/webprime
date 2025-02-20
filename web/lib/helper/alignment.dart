// Alignment Enum
enum Alignment {
  start,
  center,
  end,
}

extension AlignmentExtension on Alignment {
  String get cssValue {
    switch (this) {
      case Alignment.start:
        return 'flex-start';
      case Alignment.center:
        return 'center';
      case Alignment.end:
        return 'flex-end';
    }
  }
}



enum MainAxisAlignment {
  start,
  end,
  center,
  spaceBetween,
  spaceAround,
  spaceEvenly,
}

enum CrossAxisAlignment {
  start,
  end,
  center,
  stretch,
}

// Extensions to Convert Enums to CSS
extension MainAxisAlignmentExtension on MainAxisAlignment {
  String get cssValue {
    switch (this) {
      case MainAxisAlignment.start:
        return 'flex-start';
      case MainAxisAlignment.end:
        return 'flex-end';
      case MainAxisAlignment.center:
        return 'center';
      case MainAxisAlignment.spaceBetween:
        return 'space-between';
      case MainAxisAlignment.spaceAround:
        return 'space-around';
      case MainAxisAlignment.spaceEvenly:
        return 'space-evenly';
    }
  }
}

extension CrossAxisAlignmentExtension on CrossAxisAlignment {
  String get cssValue {
    switch (this) {
      case CrossAxisAlignment.start:
        return 'flex-start';
      case CrossAxisAlignment.end:
        return 'flex-end';
      case CrossAxisAlignment.center:
        return 'center';
      case CrossAxisAlignment.stretch:
        return 'stretch';
    }
  }
}