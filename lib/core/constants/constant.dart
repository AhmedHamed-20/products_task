import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'app_strings.dart';

class Constants {
  static String uid = '';
  static void showToast(
      {required String message,
      required Color backgroundColor,
      required Color textColor}) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: backgroundColor, textColor: textColor);
  }

  static Future<File> generateFileForimage(Map<String, Object?> row) async {
    var imgBytes = row[AppStrings.productImage] as List<int>;
    var fileName = 'image_${row['id']}.png'; // Generate unique file name
    var imageFile = await getLocalFilePath(fileName); // Get the local file
    await imageFile.writeAsBytes(imgBytes);
    return imageFile;
  }

  static Future<File> getLocalFilePath(String fileName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, fileName);
    return File(path);
  }

  //refresh image widget after update image
  static void refreshImageWidget(GlobalKey imageKey) {
    final container = imageKey.currentContext?.findRenderObject() as RenderBox?;
    container?.markNeedsPaint();
  }
}
