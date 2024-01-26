import 'package:telephony/telephony.dart';
import 'sms_info.dart';
import 'package:pragti/models/expense.dart';

class SmsMessagesList {
  SmsMessagesList({required this.addSmsExpense});
  final void Function(Expense expense) addSmsExpense;
  GetSmsInfo? smsInfo;
  List<SmsMessage> filteredMessages = [];

  void filterSmsMessages() async {
    Telephony telephony = Telephony.instance;
    List<SmsMessage> messages = await telephony.getInboxSms(
      sortOrder: [
        OrderBy(SmsColumn.DATE, sort: Sort.DESC),
      ],
    );
    String keywordPattern =
       r'((?=.*\bpaid\b)(?=.*\bbill\b)(?=.*\bRs\b)(?=.*\bon\b))|((?=.*\bRs\b)(?=.*\bdebited\b)(?=.*\bon\b))|(?=.*\bOneCard\b)';
    RegExp regex = RegExp(keywordPattern);
    filteredMessages = messages.where((message) {
      return regex.hasMatch(message.body ?? '');
    }).toList();
    
    for (int i = 0; i < filteredMessages.length - 1; i++) {
      smsInfo = GetSmsInfo(smsContent: filteredMessages[i].body!);
      addSmsExpense(
        Expense(
            title: smsInfo!.nameFromSms,
            amount: double.tryParse(smsInfo!.amountFromSms) ?? 200,
            date:
                DateTime.fromMillisecondsSinceEpoch(filteredMessages[i].date!),
            category: smsInfo!.categoryFromSms),
      );
    }
  }
}