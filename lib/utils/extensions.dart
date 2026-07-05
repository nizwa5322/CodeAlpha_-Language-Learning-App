import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

extension StringExtension on String {
  // Capitalize first letter
  String get capitalizeFirst {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  // Capitalize each word
  String get capitalizeWords {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalizeFirst).join(' ');
  }

  // Check if string is email
  bool get isEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  // Check if string is URL
  bool get isUrl {
    final urlRegex = RegExp(
      r'^(https?://)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*/?$',
      caseSensitive: false,
    );
    return urlRegex.hasMatch(this);
  }

  // Get language name from code
  String get toLanguageName {
    final language = AppConstants.supportedLanguages.firstWhere(
      (lang) => lang['code'] == this,
      orElse: () => {'name': this},
    );
    return language['name'] ?? this;
  }

  // Get language flag from code
  String get toLanguageFlag {
    final language = AppConstants.supportedLanguages.firstWhere(
      (lang) => lang['code'] == this,
      orElse: () => {'flag': ''},
    );
    return language['flag'] ?? '';
  }

  // Truncate string
  String truncate(int length, {String suffix = '...'}) {
    if (this.length <= length) return this;
    return substring(0, length) + suffix;
  }

  // Get initials
  String get initials {
    if (isEmpty) return '';
    final words = split(' ');
    if (words.length == 1) {
      return this[0].toUpperCase();
    }
    return (words[0][0] + words[1][0]).toUpperCase();
  }

  // Remove all whitespace
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  // Check if string contains special characters
  bool get hasSpecialCharacters {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);
  }

  // Check if string has uppercase
  bool get hasUppercase => RegExp(r'[A-Z]').hasMatch(this);

  // Check if string has lowercase
  bool get hasLowercase => RegExp(r'[a-z]').hasMatch(this);

  // Check if string has numbers
  bool get hasNumbers => RegExp(r'[0-9]').hasMatch(this);

  // Check if string is palindrome
  bool get isPalindrome {
    final clean = replaceAll(' ', '').toLowerCase();
    return clean == clean.split('').reversed.join();
  }

  // Count vowels
  int get vowelCount {
    return RegExp(r'[aeiouAEIOU]').allMatches(this).length;
  }

  // Count consonants
  int get consonantCount {
    return RegExp(
      r'[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]',
    ).allMatches(this).length;
  }

  // Get word count
  int get wordCount {
    if (isEmpty) return 0;
    return split(RegExp(r'\s+')).length;
  }

  // Reverse string
  String get reverse => split('').reversed.join('');

  // Check if string is numeric
  bool get isNumeric => double.tryParse(this) != null;

  // Check if string is integer
  bool get isInteger => int.tryParse(this) != null;

  // Check if string is double
  bool get isDouble => double.tryParse(this) != null;

  // Convert to safe file name
  String get toSafeFileName {
    return replaceAll(RegExp(r'[^a-zA-Z0-9\-_.]'), '_');
  }

  // Convert to slug
  String get toSlug {
    return toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'-+'), '-');
  }

  // Check if string contains emoji
  bool get containsEmoji {
    final emojiRegex = RegExp(
      r'[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}\u{1F700}-\u{1F77F}\u{1F780}-\u{1F7FF}\u{1F800}-\u{1F8FF}\u{1F900}-\u{1F9FF}\u{1FA00}-\u{1FA6F}\u{1FA70}-\u{1FAFF}\u{2600}-\u{26FF}\u{2700}-\u{27BF}]',
      unicode: true,
    );
    return emojiRegex.hasMatch(this);
  }

  // Extract emojis from string
  List<String> get extractEmojis {
    final emojiRegex = RegExp(
      r'[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}\u{1F700}-\u{1F77F}\u{1F780}-\u{1F7FF}\u{1F800}-\u{1F8FF}\u{1F900}-\u{1F9FF}\u{1FA00}-\u{1FA6F}\u{1FA70}-\u{1FAFF}\u{2600}-\u{26FF}\u{2700}-\u{27BF}]',
      unicode: true,
    );
    return emojiRegex.allMatches(this).map((match) => match.group(0)!).toList();
  }

  // Convert to title case
  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalizeFirst).join(' ');
  }

  // Check if string contains only letters
  bool get isAlpha => RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  // Check if string contains only letters and spaces
  bool get isAlphaSpace => RegExp(r'^[a-zA-Z\s]+$').hasMatch(this);

  // Check if string contains only alphanumeric
  bool get isAlphanumeric => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);

  // Check if string is a valid phone number
  bool get isPhoneNumber {
    final phoneRegex = RegExp(r'^[0-9+\-\s()]{8,15}$');
    return phoneRegex.hasMatch(this);
  }

  // Check if string is a valid date (YYYY-MM-DD)
  bool get isValidDate {
    final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegex.hasMatch(this)) return false;
    try {
      DateTime.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Check if string is a valid time (HH:MM)
  bool get isValidTime {
    final timeRegex = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
    return timeRegex.hasMatch(this);
  }

  // Check if string is a valid hex color
  bool get isHexColor {
    final hexRegex = RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');
    return hexRegex.hasMatch(this);
  }

  // Convert to hex color
  Color get toColor {
    if (!isHexColor) return Colors.black;
    String hex = this;
    if (hex.startsWith('#')) {
      hex = hex.substring(1);
    }
    if (hex.length == 3) {
      hex = hex.split('').map((c) => c + c).join('');
    }
    return Color(int.parse('FF$hex', radix: 16));
  }

  // Count occurrences of substring
  int countOccurrences(String substring) {
    if (substring.isEmpty) return 0;
    return RegExp(substring).allMatches(this).length;
  }

  // Mask string (e.g., for passwords)
  String mask({int visibleChars = 2, String maskChar = '*'}) {
    if (length <= visibleChars * 2) return this;
    final start = substring(0, visibleChars);
    final end = substring(length - visibleChars);
    final middle = maskChar * (length - visibleChars * 2);
    return '$start$middle$end';
  }

  // Check if string contains only whitespace
  bool get isWhitespace => trim().isEmpty;

  // Check if string is null or empty
  bool get isNullOrEmpty => isEmpty;
}

extension DateTimeExtension on DateTime {
  // Format date
  String formatDate({String pattern = 'MMM dd, yyyy'}) {
    return DateFormat(pattern).format(this);
  }

  // Format time
  String formatTime({String pattern = 'hh:mm a'}) {
    return DateFormat(pattern).format(this);
  }

  // Format date and time
  String formatDateTime({String pattern = 'MMM dd, yyyy hh:mm a'}) {
    return DateFormat(pattern).format(this);
  }

  // Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  // Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  // Check if date is tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  // Check if date is in the past
  bool get isPast => isBefore(DateTime.now());

  // Check if date is in the future
  bool get isFuture => isAfter(DateTime.now());

  // Get time ago string
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 7) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  // Get day of week name
  String get dayOfWeekName {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[weekday - 1];
  }

  // Get month name
  String get monthName {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  // Get short month name
  String get shortMonthName {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  // Get short day name
  String get shortDayName {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  // Get start of day
  DateTime get startOfDay => DateTime(year, month, day);

  // Get end of day
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  // Get start of week (Monday)
  DateTime get startOfWeek {
    var date = this;
    while (date.weekday != 1) {
      date = date.subtract(const Duration(days: 1));
    }
    return date;
  }

  // Get end of week (Sunday)
  DateTime get endOfWeek {
    var date = this;
    while (date.weekday != 7) {
      date = date.add(const Duration(days: 1));
    }
    return date;
  }

  // Get start of month
  DateTime get startOfMonth => DateTime(year, month, 1);

  // Get end of month
  DateTime get endOfMonth {
    final nextMonth = month == 12
        ? DateTime(year + 1, 1, 1)
        : DateTime(year, month + 1, 1);
    return nextMonth.subtract(const Duration(days: 1));
  }

  // Get start of year
  DateTime get startOfYear => DateTime(year, 1, 1);

  // Get end of year
  DateTime get endOfYear => DateTime(year, 12, 31);

  // Get age
  int get age {
    final now = DateTime.now();
    int age = now.year - year;
    if (now.month < month || (now.month == month && now.day < day)) {
      age--;
    }
    return age;
  }

  // Check if date is in this week
  bool get isThisWeek {
    final now = DateTime.now();
    final startOfWeek = now.startOfWeek;
    final endOfWeek = now.endOfWeek;
    return isAfter(startOfWeek) && isBefore(endOfWeek);
  }

  // Check if date is in this month
  bool get isThisMonth {
    final now = DateTime.now();
    return year == now.year && month == now.month;
  }

  // Check if date is in this year
  bool get isThisYear {
    final now = DateTime.now();
    return year == now.year;
  }

  // Get week number
  int get weekNumber {
    final firstDayOfYear = DateTime(year, 1, 1);
    final days = difference(firstDayOfYear).inDays;
    return ((days + firstDayOfYear.weekday - 1) / 7).ceil();
  }

  // Get next weekday
  DateTime nextWeekday(int targetWeekday) {
    var date = this;
    while (date.weekday != targetWeekday) {
      date = date.add(const Duration(days: 1));
    }
    return date;
  }

  // Get previous weekday
  DateTime previousWeekday(int targetWeekday) {
    var date = this;
    while (date.weekday != targetWeekday) {
      date = date.subtract(const Duration(days: 1));
    }
    return date;
  }

  // Add days
  DateTime addDays(int days) => add(Duration(days: days));

  // Subtract days
  DateTime subtractDays(int days) => subtract(Duration(days: days));

  // Add months
  DateTime addMonths(int months) {
    final newMonth = month + months;
    final newYear = year + (newMonth - 1) ~/ 12;
    final monthIndex = (newMonth - 1) % 12 + 1;
    return DateTime(newYear, monthIndex, day);
  }

  // Subtract months
  DateTime subtractMonths(int months) => addMonths(-months);

  // Add years
  DateTime addYears(int years) => DateTime(year + years, month, day);

  // Subtract years
  DateTime subtractYears(int years) => addYears(-years);

  // Get difference in days
  int daysUntil(DateTime other) {
    return other.difference(this).inDays.abs();
  }

  // Get difference in weeks
  int weeksUntil(DateTime other) {
    return (daysUntil(other) / 7).floor();
  }

  // Get difference in months
  int monthsUntil(DateTime other) {
    return (other.year - year) * 12 + (other.month - month);
  }

  // Get difference in years
  int yearsUntil(DateTime other) {
    return other.year - year;
  }

  // Check if date is between two dates
  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }

  // Get quarter
  int get quarter => ((month - 1) / 3).ceil();

  // Get semester
  int get semester => ((month - 1) / 6).ceil();

  // Get ordinal suffix (1st, 2nd, 3rd, etc.)
  String get dayOrdinal {
    final day = this.day;
    if (day >= 11 && day <= 13) return '${day}th';
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  // Get friendly date string
  String get friendlyDate {
    if (isToday) return 'Today';
    if (isYesterday) return 'Yesterday';
    if (isTomorrow) return 'Tomorrow';
    if (isThisWeek) return dayOfWeekName;
    if (isThisYear) return formatDate(pattern: 'MMM d');
    return formatDate(pattern: 'MMM d, yyyy');
  }

  // Get time of day
  String get timeOfDay {
    final hour = this.hour;
    if (hour < 6) return 'Night';
    if (hour < 12) return 'Morning';
    if (hour < 18) return 'Afternoon';
    if (hour < 22) return 'Evening';
    return 'Night';
  }
}

extension DurationExtension on Duration {
  // Format duration
  String formatDuration() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    if (hours > 0) {
      return '$hours:${twoDigits(minutes)}:${twoDigits(seconds)}';
    } else if (minutes > 0) {
      return '$minutes:${twoDigits(seconds)}';
    } else {
      return '${seconds}s';
    }
  }

  // Format duration in words
  String get formatDurationWords {
    final days = inDays;
    final hours = inHours.remainder(24);
    final minutes = inMinutes.remainder(60);

    final parts = <String>[];
    if (days > 0) parts.add('${days}d');
    if (hours > 0) parts.add('${hours}h');
    if (minutes > 0) parts.add('${minutes}m');
    if (parts.isEmpty) return '0m';
    return parts.join(' ');
  }

  // Get total minutes
  int get totalMinutes => inMinutes;

  // Get total hours
  double get totalHours => inHours + (inMinutes.remainder(60) / 60);

  // Get total days
  double get totalDays => inDays + (inHours.remainder(24) / 24);
}

extension ListExtension<T> on List<T> {
  // Check if list is null or empty
  bool get isNullOrEmpty => isEmpty;

  // Get random element
  T? get random {
    if (isEmpty) return null;
    return this[DateTime.now().millisecondsSinceEpoch % length];
  }

  // Get shuffled list
  List<T> get shuffled {
    final list = List<T>.from(this);
    list.shuffle();
    return list;
  }

  // Get unique elements
  List<T> get unique {
    final seen = <T>{};
    return where((element) => seen.add(element)).toList();
  }

  // Get first element or null
  T? get firstOrNull => isEmpty ? null : first;

  // Get last element or null
  T? get lastOrNull => isEmpty ? null : last;

  // Get element at index or null
  T? elementAtOrNull(int index) {
    return index >= 0 && index < length ? this[index] : null;
  }

  // Split into chunks
  List<List<T>> chunk(int size) {
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }

  // Remove duplicates by a key
  List<T> distinctBy<K>(K Function(T) key) {
    final seen = <K>{};
    return where((element) => seen.add(key(element))).toList();
  }

  // Group by a key
  Map<K, List<T>> groupBy<K>(K Function(T) key) {
    final map = <K, List<T>>{};
    for (final element in this) {
      final k = key(element);
      map.putIfAbsent(k, () => []).add(element);
    }
    return map;
  }

  // Sum values
  num sum(num Function(T) selector) {
    return fold<num>(0, (acc, element) => acc + selector(element));
  }

  // Average values
  double average(num Function(T) selector) {
    if (isEmpty) return 0.0;
    return sum(selector) / length;
  }

  // Min value
  T? minBy(num Function(T) selector) {
    if (isEmpty) return null;
    return reduce((a, b) => selector(a) < selector(b) ? a : b);
  }

  // Max value
  T? maxBy(num Function(T) selector) {
    if (isEmpty) return null;
    return reduce((a, b) => selector(a) > selector(b) ? a : b);
  }

  // Sort by key
  List<T> sortBy<K extends Comparable>(K Function(T) key) {
    final list = List<T>.from(this);
    list.sort((a, b) => key(a).compareTo(key(b)));
    return list;
  }

  // Sort by key descending
  List<T> sortByDescending<K extends Comparable>(K Function(T) key) {
    final list = List<T>.from(this);
    list.sort((a, b) => key(b).compareTo(key(a)));
    return list;
  }

  // Check if list contains any element from another list
  bool containsAny(List<T> other) {
    return any((element) => other.contains(element));
  }

  // Check if list contains all elements from another list
  bool containsAll(List<T> other) {
    return other.every((element) => contains(element));
  }
}

extension MapExtension<K, V> on Map<K, V> {
  // Get value or default
  V? getOrNull(K key) => containsKey(key) ? this[key] : null;

  // Get value with default
  V getOrDefault(K key, V defaultValue) {
    return containsKey(key) ? this[key]! : defaultValue;
  }

  // Merge maps
  Map<K, V> merge(Map<K, V> other) {
    final merged = Map<K, V>.from(this);
    merged.addAll(other);
    return merged;
  }

  // Filter map
  Map<K, V> filter(bool Function(K key, V value) predicate) {
    return Map.fromEntries(
      entries.where((entry) => predicate(entry.key, entry.value)),
    );
  }

  // Map entries to new map
  Map<K2, V2> mapEntries<K2, V2>(
    MapEntry<K2, V2> Function(K key, V value) transform,
  ) {
    final result = <K2, V2>{};
    forEach((key, value) {
      final entry = transform(key, value);
      result[entry.key] = entry.value;
    });
    return result;
  }

  // Get keys as list
  List<K> get keysList => keys.toList();

  // Get values as list
  List<V> get valuesList => values.toList();

  // Check if map is empty
  bool get isNullOrEmpty => isEmpty;

  // Check if map contains any key from a list
  bool containsAnyKey(List<K> keys) {
    return keys.any((key) => containsKey(key));
  }

  // Check if map contains all keys from a list
  bool containsAllKeys(List<K> keys) {
    return keys.every((key) => containsKey(key));
  }

  // Invert map (swap keys and values)
  Map<V, K> invert() {
    final inverted = <V, K>{};
    forEach((key, value) {
      inverted[value] = key;
    });
    return inverted;
  }
}

extension NullableExtension<T> on T? {
  // Check if value is null
  bool get isNull => this == null;

  // Check if value is not null
  bool get isNotNull => this != null;

  // Get value or default
  T orDefault(T defaultValue) => this ?? defaultValue;

  // Execute if not null
  void ifNotNull(void Function(T value) action) {
    if (this != null) action(this!);
  }

  // Map if not null
  R? map<R>(R Function(T value) mapper) {
    if (this != null) return mapper(this!);
    return null;
  }

  // Get value or throw exception
  T orThrow(String message) {
    if (this == null) throw Exception(message);
    return this!;
  }

  // Get value or compute default
  T orElse(T Function() defaultValue) => this ?? defaultValue();
}
