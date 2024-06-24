class DropdownHelper {
  static String findKeyByValue(String value , Map<String , String> languageList) {
    return languageList.entries
        .firstWhere((entry) => entry.value == value, orElse: () => const MapEntry('', ''))
        .key;
  }
}