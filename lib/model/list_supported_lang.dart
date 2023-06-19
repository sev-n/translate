import 'package:speech_to_text/speech_to_text.dart' as stt;

class ListLanguage {
  static final langs = {
    'Automatic': 'auto',
    'Afghanistan (Pashto)': 'ps',
    'Armenia (Armenian)': 'hy',
    'Azerbaijan (Azerbaijani)': 'az',
    'Bahrain (Arabic)': 'ar',
    'Bangladesh (Bengali)': 'bn',
    'Brunei (Malay)': 'ms',
    'Cambodia (Khmer)': 'km',
    'Chinese (Simplified)': 'zh-cn',
    'Chinese (Traditional)': 'zh-tw',
    'Cyprus (Greek)': 'el',
    'Cyprus (Turkish)': 'tr',
    'English (International)': 'en',
    'Georgia (Georgian)': 'ka',
    'India (Hindi)': 'hi',
    'Indonesia (Indonesian)': 'id',
    'Indonesia (Javanese)': 'jw',
    'Iran (Kurdish - Kurmanji)': 'ku',
    'Iran (Persian)': 'fa',
    'Iraq (Kurdish - Kurmanji)': 'ku',
    'Iraq (Kurdish - Sorani)': 'ckb',
    'Israel (Hebrew)': 'iw',
    'Japan (Japanese)': 'ja',
    'Jordan (Arabic)': 'ar',
    'Kazakhstan (Kazakh)': 'kk',
    'Korea (Korean)': 'ko',
    'Kuwait (Arabic)': 'ar',
    'Kyrgyzstan (Kyrgyz)': 'ky',
    'Laos (Lao)': 'lo',
    'Lebanon (Arabic)': 'ar',
    'Lebanon (French)': 'fr',
    'Macau (Chinese - Simplified)': 'zh-cn',
    'Malaysia (Malayalam)': 'ml',
    'Maldives (Dhivehi)': 'dv',
    'Mongolia (Mongolian)': 'mn',
    'Nepal (Nepali)': 'ne',
    'Oman (Arabic)': 'ar',
    'Palestine (Arabic)': 'ar',
    'Pakistan (Urdu)': 'ur',
    'Philippines (Filipino - Tagalog)': 'tl',
    'Qatar (Arabic)': 'ar',
    'Russia (Russian)': 'ru',
    'Saudi Arabia (Arabic)': 'ar',
    'Singapore (Malay)': 'ms',
    'Singapore (Tamil)': 'ta',
    'Sri Lanka (Sinhala)': 'si',
    'Syria Arabic': 'ar',
    'Taiwan (Chinese - Traditional)': 'zh-tw',
    'Tajikistan (Tajik)': 'tg',
    'Thailand (Thai)': 'th',
    'Timor-Leste (Portuguese)': 'pt',
    'Turkey (Turkish)': 'tr',
    'Turkey (Kurdish - Kurmanji)': 'ku',
    'Turkmenistan	 (Turkmen)': 'tk',
    'United Arab Emirates (Arabic)': 'ar',
    'Uzbekistan (Uzbek)': 'uz',
    'Vietnam (Vietnamese)': 'vi',
    'Yemen (Arabic)': 'ar',
  };
}

class TranslateToLanguages {
  static final tLangs = {'English (International)': 'en', 'Philippines (Filipino - Tagalog)': 'tl',};
}

// speech section

class SttSupportedLanguages {
  static List<stt.LocaleName> supLanguanges = [];
}

class TranslateToLanguagesStt {
  static final sttLangs = {'en_US': 'English', 'fil_PH': 'Filipino'};
}
