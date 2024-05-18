import 'package:firebase_storage/firebase_storage.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:io';
import 'package:intl/intl.dart'; // for use DateFormat
import 'package:image_picker/image_picker.dart';
export 'package:image_picker/image_picker.dart';
export 'dart:io'; // for use FILE type
export 'package:flutter/foundation.dart'; // for use listEquals
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
export 'package:flutter/material.dart';

var logger = Logger(
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
);

class UtilService {
  static String generateHash(String input) {
    final bytes = utf8.encode(input); // UTF-8 인코딩
    final hashVal = sha256.convert(bytes); // SHA-256 해시 값 생성
    return hashVal.toString(); // 문자열로 변환
  }

  static String formatUpdateTime(DateTime updateTime) {
    DateTime now = DateTime.now();

    DateTime justNowDate = DateTime(now.year, now.month, now.day);
    DateTime justUpdateDate = DateTime(updateTime.year, updateTime.month, updateTime.day);

    int dayDiff = justNowDate.difference(justUpdateDate).inDays;

    if (dayDiff == 0) {
      return DateFormat.jm().format(updateTime);
    } else if (dayDiff == 1) {
      return '어제';
    } else if (updateTime.year == now.year) {
      return DateFormat('M월 d일').format(updateTime);
    } else {
      return DateFormat('yyyy. MM. dd').format(updateTime);
    }
  }

  // 닉네임 유효성 검사
  static Map<String, dynamic> validateDisplayName(String value) {
    if (value.length > 10 || value.length < 3) {
      return {
        'helperText': '닉네임은 3글자 이상 10글자 이하입니다.',
        'isCheckButtonEnabled': false,
        'helperTextColor': Colors.red
      };
    } else if (RegExp(r'[^a-zA-Z0-9가-힣]').hasMatch(value)) {
      return {
        'helperText': '닉네임은 영문, 한글, 숫자만 가능합니다.',
        'isCheckButtonEnabled': false,
        'helperTextColor': Colors.red
      };
    } else {
      return {
        'helperText': '',
        'isCheckButtonEnabled': true,
        'helperTextColor': Colors.black
      };
    }
  }


  // 기본 이미지인지 구별하기 위한 메소드
  static bool isDefaultImage(String? imgPath) {
    if (imgPath == null) {
      return true;
    } else {
      return false;
    }
  }



  // 팀장인지 아닌지 구별하기 위한 메소드
  static bool isMember(Map<String, dynamic> studyData, String userId) {
    // 사용자가 'std_members' 목록에 있는지 확인합니다.
    final members = studyData['std_members'];
    if (members == null) {
      // members가 null이면 false를 반환합니다.
      return false;
    }
    return members.any((member) => member['uid'] == userId);
  }

  // stdMake1, prf1, stdhome5, set2에서 갤러리에서 사진 가져오는 메소드
  static Future<XFile?> getImageFromGallery() async {
  try {
    final XFile? returnedImg = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImg == null) {
      logger.w("No image selected from gallery.");
    }
    return returnedImg;
  } catch (e) {
      logger.w("Error picking image from gallery: $e");
    return null;
  }
}

  // stdMake1, prf1, stdhome5, set2에서 사진 촬영해서 사진 가져오는 메소드
  static Future<XFile?> getImageFromCamera() async {
  try {
    final XFile? returnedImg = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImg == null) {
      logger.w("No image captured with camera.");
    }
    return returnedImg;
  } catch (e) {
    logger.w("Error capturing image from camera: $e");
    return null;
  }
}

  Future<String?> storeStudyImageToStorage(imagePath, stdName) async {
    if (imagePath == null) {
      return null;
    }
    File file = File(imagePath);
    // Firebase Storage에 이미지 업로드
    TaskSnapshot snapshot = await FirebaseStorage.instance
      .ref('study/$stdName/uploads/${file.uri.pathSegments.last}')
      .putFile(file);

    // 업로드된 파일의 URL 획득
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  static List<String> sortTime(stdTimes) {
    Map<String, int> dayPriority = {'월': 1, '화': 2, '수': 3, '목': 4, '금': 5, '토': 6, '일': 7};
    if (stdTimes != null) {
      stdTimes!.sort((a, b) {
      int? priorityA = dayPriority[a];
      int? priorityB = dayPriority[b];

      if (priorityA != null && priorityB != null) {
        return priorityA.compareTo(priorityB);
      } else if (priorityA != null && priorityB == null) {
        return -1;
      } else if (priorityA == null && priorityB != null) {
        return 1;
      } else {
        return 0;
      }
      });
    }
    return stdTimes;
  }

  static Future<void> showDialogWithMessage(BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
