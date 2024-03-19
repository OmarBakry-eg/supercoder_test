// import 'package:flutter/material.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:supercoder_test/src/utils/exports.dart';

sealed class FilePickerClass {
  static const List<String> _fileExtensions = [
    'TXT',
    'PDF',
    'DOC',
    'DOCX',
    'PPT',
    'PPTX',
    'XLS',
    'XLSX',
    'ZIP',
    'RAR',
    '7Z',
    'TAR',
    'GZ',
    'MP3',
    'EXE',
    'APK',
    'HTML',
    'CSS',
    'JS',
    'JSON',
    'XML',
    'CSV',
    'SQL',
    'JAVA',
    'PY',
    'C',
    'CPP'
  ];

  static Future<List<File>?> pickImages() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        List<File> files = result.files.map((e) => File(e.path!)).toList();
        return files;
      }
    } catch (e) {
      logError('Error picking files: $e');
      Constants.showSnackBar(content: e.toString());
    }
    return null;
  }

  static Future<List<File>?> pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: _fileExtensions,
        allowMultiple: false,
      );
      if (result != null) {
        List<File> files = result.files.map((e) => File(e.path!)).toList();
        return files;
      }
    } catch (e) {
      logError('Error picking files: $e');
      Constants.showSnackBar(content: e.toString());
    }
    return null;
  }
}
