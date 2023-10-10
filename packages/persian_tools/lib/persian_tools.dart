library persian_tools;

final RegExp _regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

String persianNumberToEnglish(String number, {bool divide = false}) {
  final Map<String, String> numbers = <String, String>{
    '۰': '0',
    '۱': '1',
    '۲': '2',
    '۳': '3',
    '۴': '4',
    '۵': '5',
    '۶': '6',
    '۷': '7',
    '۸': '8',
    '۹': '9',
  };

  numbers.forEach((String key, String value) {
    number = number.replaceAll(key, value);
  });

  if (divide) {
    number = divideDigits(number);
  }

  return number;
}

String englishNumberToPersian(String number, {bool divide = false}) {
  final Map<String, String> numbers = <String, String>{
    '0': '۰',
    '1': '۱',
    '2': '۲',
    '3': '۳',
    '4': '۴',
    '5': '۵',
    '6': '۶',
    '7': '۷',
    '8': '۸',
    '9': '۹',
  };

  numbers.forEach((String key, String value) {
    number = number.replaceAll(key, value);
  });

  if (divide) {
    number = divideDigits(number);
  }

  return number;
}

bool checkPhoneNumber(String number) {
  final String num = persianNumberToEnglish(number);
  if ((num[0] == '0' && num.length == 11) ||
      (num[0] == '9' && num.length == 10)) {
    return _regExp.hasMatch(num);
  }
  return false;
}

bool checkNationalCode(String nationalcode) {
  if (nationalcode.trim() == '') {
    return false;
  } else if (nationalcode.length != 10) {
    return false;
  } else {
    int sum = 0;

    for (int i = 0; i < 9; i++) {
      sum += int.parse(nationalcode[i]) * (10 - i);
    }

    int lastDigit;
    final int divideRemaining = sum % 11;

    if (divideRemaining < 2) {
      lastDigit = divideRemaining;
    } else {
      lastDigit = 11 - divideRemaining;
    }

    if (int.parse(nationalcode[9]) == lastDigit) {
      return true;
    } else {
      return false;
    }
  }
}

String divideDigits(String number) {
  String str = '';
  final List<String> numberSplit = number.split('.');
  number = numberSplit[0].replaceAll(',', '');
  for (int i = number.length; i > 0;) {
    if (i > 3) {
      str = ',${number.substring(i - 3, i)}$str';
    } else {
      str = number.substring(0, i) + str;
    }
    i = i - 3;
  }
  if (numberSplit.length > 1) {
    str += '.${numberSplit[1]}';
  }
  return str;
}
