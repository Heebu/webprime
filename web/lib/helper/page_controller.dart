class PageController {
  int _currentPage = 0;
  void Function(int)? _onPageChanged;

  /// Get the current page index
  int get currentPage => _currentPage;

  /// Jump to a specific page instantly
  void jumpToPage(int page) {
    _currentPage = page;
    _onPageChanged?.call(_currentPage);
  }

  /// Animate to a specific page
  void animateToPage(int page) {
    _currentPage = page;
    _onPageChanged?.call(_currentPage);
  }

  /// Attach a callback for page changes
  void addListener(void Function(int) listener) {
    _onPageChanged = listener;
  }
}
