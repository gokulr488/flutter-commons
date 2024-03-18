import 'dart:convert';
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talos_commons/utils/Alerts.dart';

class Utils {
  //To avoid non-static access to util methods
  Utils._hideConstructor();

  static String getFormattedDate(DateTime date, String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(date);
  }

  static Future<DateTime> pickDate(
      {DateTime? selectedDate, required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
        //initialDatePickerMode: DatePickerMode.year,
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));
    if (picked != null) {
      return picked;
    }
    return selectedDate ?? DateTime.now();
  }

  static DateTime getStartOfMonth(DateTime dayOfMonth) {
    final DateTime start = DateTime(dayOfMonth.year, dayOfMonth.month);
    return start;
  }

  static DateTime getEndOfMonth(DateTime dayOfMonth) {
    final int millis =
        DateTime(dayOfMonth.year, dayOfMonth.month + 1).millisecondsSinceEpoch -
            1;
    final DateTime end = DateTime.fromMillisecondsSinceEpoch(millis);
    return end;
  }

  static final NumberFormat curFormat = NumberFormat('##,##,##,##0.00');

  static String formatDouble(double? value) {
    if (value == null) return '0.00';
    return curFormat.format(value);
  }

  static String formatInt(int? value) {
    if (value == null) return '0';
    return value.toStringAsFixed(0);
  }

  static double toDecimal(String? priceInLong, int factor) {
    int intValue = int.parse(priceInLong ?? '0');
    return intValue / factor;
  }

  static String toDecimalString(String? priceInLong, int factor) {
    int intValue = int.parse(priceInLong ?? '0');
    return intToDecimalStr(intValue, factor);
  }

  static String intToDecimalStr(int? priceInLong, int factor) {
    int intValue = priceInLong ?? 0;
    double parseValue = intValue / factor;
    return parseValue.toStringAsFixed(2);
  }

  static int stringToLong(String? priceInDecimal, int factor) {
    double intValue = double.parse(priceInDecimal ?? '0');
    int longValue = (intValue * factor) as int;
    return longValue;
  }

  static String timestampToTime(int? timeStamp) {
    if (timeStamp == null) {
      return '';
    }
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    String formattedDateTimeString = DateFormat('HH:mm:ss').format(dateTime);
    return formattedDateTimeString;
  }

  static String productof(String? qty, String? price) {
    int quantity = int.tryParse(qty ?? '1') ?? 1;
    double itemPrice = double.tryParse(price ?? '0') ?? 0;
    double product = quantity * itemPrice;

    return product.toStringAsFixed(2);
  }

  static Future<void> cacheData(String key, String data) async {
    log('Caching Data $key:$data');
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setString(key, data);
  }

  static Future<String?> getCachedData(String label) async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(label);
    return data;
  }

  static String getSymbolName(String? contractCode) {
    if (contractCode != null) {
      List<String> parts = contractCode.split('_');
      if (parts.length < 3) return '';
      return '${parts[2]} ${parts[3]}';
    }
    return '';
  }

  static String getShortSymbolName(String? contractCode) {
    if (contractCode != null) {
      List<String> parts = contractCode.split('_');
      if (parts.length < 3) return '';
      return parts[3];
    }
    return '';
  }

  static String getExchangeName(String? contractCode) {
    if (contractCode != null) {
      List<String> parts = contractCode.split('_');
      if (parts.length < 3) return '';
      return '${parts[0]} ${parts[1]}';
    }
    return '';
  }

  static String getCurrentDateTimeString() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy_HH/mm/ss').format(now);
    return formattedDate;
  }

  static void downloadCSV(String file, String fileName) async {
    Uint8List bytes = Uint8List.fromList(utf8.encode(file));
    await FileSaver.instance.saveFile(
      name: fileName,
      bytes: bytes,
      ext: 'csv',
      mimeType: MimeType.csv,
    );
  }
}
