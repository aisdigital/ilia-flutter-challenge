class LanguageHelper {
  static const Map<String, String> _languages = {
    'en': 'English',
    'hi': 'Hindi',
    'zh': 'Chinese',
    'pt': 'Portuguese',
    'es': 'Spanish',
    'fr': 'French',
    'it': 'Italian',
    'ja': 'Japanese',
    'ko': 'Korean',
    'de': 'German',
  };

  static String getLanguage(String code) {
    return _languages[code] ?? 'Unknown';
  }
}
