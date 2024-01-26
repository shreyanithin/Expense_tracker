import 'package:pragti/models/expense.dart';

class GetSmsInfo {
  GetSmsInfo({required this.smsContent}) : words = smsContent.replaceAll(",","").replaceAll("  ", " ").split(RegExp(r'[ ;  ]'));
  final String smsContent;
  List<String> words;
  String targetWord = '';

  String get amountFromSms {
    for (int i = 0; i < words.length - 1; i++) {
      if (words[i] == 'Rs.' || words[i] == 'Rs') {
        targetWord = words[i + 1];
        break;
      }
    }
    return targetWord;
  }

  Category get categoryFromSms {
    if (words[words.length - 1] == 'OneCard') {
      return Category.creditCard;
    }
    for (int i = 0; i < words.length - 1; i++) {
      if (words[i] == 'UPI') {
        return Category.upi;
      }
    }
    return Category.bankTransfer;
  }

  String get nameFromSms {
    if (words[words.length - 1] == 'OneCard') {
      return 'Credit Card';
    }
    for (int i = 0; i < words.length - 1; i++) {
      if (words[i] == 'UPI') {
        return 'UPI';
      }
    }
    return 'Bank Payment';
  }
}
