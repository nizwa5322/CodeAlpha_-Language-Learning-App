import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  final FlutterTts _flutterTts = FlutterTts();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isSpeaking = false;
  bool _isPlaying = false;

  // Initialize TTS
  Future<void> initTTS() async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setVolume(1.0);

    _flutterTts.setCompletionHandler(() {
      _isSpeaking = false;
    });

    _flutterTts.setErrorHandler((error) {
      _isSpeaking = false;
      print('TTS Error: $error');
    });
  }

  // Speak text with TTS
  Future<void> speak(String text, {String? language}) async {
    if (_isSpeaking) {
      await stopSpeaking();
    }

    try {
      _isSpeaking = true;

      if (language != null) {
        final langCode = _getLanguageCode(language);
        await _flutterTts.setLanguage(langCode);
      }

      await _flutterTts.speak(text);
    } catch (e) {
      print('TTS Error: $e');
      _isSpeaking = false;
      try {
        await _flutterTts.setLanguage('en-US');
        await _flutterTts.speak(text);
      } catch (e2) {
        print('TTS Fallback Error: $e2');
      }
    }
  }

  // Stop speaking
  Future<void> stopSpeaking() async {
    if (_isSpeaking) {
      await _flutterTts.stop();
      _isSpeaking = false;
    }
  }

  // ✅ FIXED: Play audio file using UrlSource, AssetSource, or DeviceFileSource
  Future<void> playAudio(String audioPath) async {
    try {
      await _audioPlayer.stop();
      _isPlaying = true;

      // Use the appropriate source type
      if (audioPath.startsWith('http://') || audioPath.startsWith('https://')) {
        await _audioPlayer.play(UrlSource(audioPath));
      } else if (audioPath.startsWith('assets/')) {
        await _audioPlayer.play(AssetSource(audioPath));
      } else {
        await _audioPlayer.play(DeviceFileSource(audioPath));
      }

      _audioPlayer.onPlayerComplete.listen((event) {
        _isPlaying = false;
      });
    } catch (e) {
      print('Audio Play Error: $e');
      _isPlaying = false;
    }
  }

  // Stop audio playback
  Future<void> stopAudio() async {
    if (_isPlaying) {
      await _audioPlayer.stop();
      _isPlaying = false;
    }
  }

  // Pause audio
  Future<void> pauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    }
  }

  // Resume audio
  Future<void> resumeAudio() async {
    if (_isPlaying) {
      await _audioPlayer.resume();
    }
  }

  // Set audio volume
  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
  }

  // Set speech rate
  Future<void> setSpeechRate(double rate) async {
    await _flutterTts.setSpeechRate(rate);
  }

  // Set pitch
  Future<void> setPitch(double pitch) async {
    await _flutterTts.setPitch(pitch);
  }

  // Get available languages
  Future<List<Map<String, String>>> getAvailableLanguages() async {
    final languages = await _flutterTts.getLanguages;
    return languages.map((lang) {
      final parts = lang.split('_');
      return {
        'code': lang,
        'name': parts.length > 1 ? parts[1] : parts[0],
        'flag': _getLanguageFlag(lang),
      };
    }).toList();
  }

  // Check if TTS is available
  Future<bool> isTTSAvailable() async {
    try {
      final engines = await _flutterTts.getEngines;
      return engines.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  // Play pronunciation slowly
  Future<void> speakSlowly(String text, {String? language}) async {
    await _flutterTts.setSpeechRate(0.3);
    await speak(text, language: language);
    await _flutterTts.setSpeechRate(0.5);
  }

  // Play word with emphasis
  Future<void> speakWithEmphasis(String text, {String? language}) async {
    await _flutterTts.setPitch(1.2);
    await speak(text, language: language);
    await _flutterTts.setPitch(1.0);
  }

  // Play word multiple times
  Future<void> speakRepeatedly(
    String text, {
    int times = 3,
    String? language,
  }) async {
    for (int i = 0; i < times; i++) {
      await speak(text, language: language);
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  // Helper methods
  String _getLanguageCode(String language) {
    switch (language.toLowerCase()) {
      case 'french':
        return 'fr-FR';
      case 'spanish':
        return 'es-ES';
      case 'german':
        return 'de-DE';
      case 'italian':
        return 'it-IT';
      case 'japanese':
        return 'ja-JP';
      case 'chinese':
        return 'zh-CN';
      case 'korean':
        return 'ko-KR';
      case 'arabic':
        return 'ar-SA';
      case 'russian':
        return 'ru-RU';
      default:
        return 'en-US';
    }
  }

  String _getLanguageFlag(String languageCode) {
    final code = languageCode.split('_').first.toLowerCase();
    switch (code) {
      case 'en':
        return '🇺🇸';
      case 'fr':
        return '🇫🇷';
      case 'es':
        return '🇪🇸';
      case 'de':
        return '🇩🇪';
      case 'it':
        return '🇮🇹';
      case 'ja':
        return '🇯🇵';
      case 'zh':
        return '🇨🇳';
      case 'ko':
        return '🇰🇷';
      case 'ar':
        return '🇸🇦';
      case 'ru':
        return '🇷🇺';
      default:
        return '🌍';
    }
  }

  // Dispose audio resources
  void dispose() {
    _flutterTts.stop();
    _audioPlayer.dispose();
  }
}
