import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/theme_helper.dart';

class CustomSnackBar {
  void basicSnackbar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class myAuth {
  static String getMessageFromErrorCode(errorCode) {
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
        break;
      default:
        return "Login failed. Please try again.";
        break;
    }
  }

  // static Future signUp(
  //   context,
  //   String email,
  //   String password,
  //   String userName,
  //   String name,
  //   String dob,
  //   String business,
  //   String gender,
  // ) async {
  //   var userModel = Provider.of<UserModel>(context, listen: false);

  //   try {
  //     final UserCredential userCredential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     final result = await MyApiService.createNewUser({
  //       'email': email,
  //       'username': userName,
  //       'name': name,
  //       'dob': dob,
  //       'business': business,
  //       'gender': gender,
  //     });
  //     userModel.updateData(
  //         email: email,
  //         username: userName,
  //         name: name,
  //         dob: dob,
  //         business: business,
  //         gender: gender);
  //     return (result != null);
  //   } catch (error) {
  //     if (error is FirebaseAuthException) {
  //       String errorMessage = getMessageFromErrorCode(error.code);
  //       CustomSnackBar().basicSnackbar(context, errorMessage);
  //     } else {
  //       print("An error occurred: $error");
  //     }
  //   }
  //   return false;
  // }

  bool checkUserLoggedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  static String get getUid {
    var user = FirebaseAuth.instance.currentUser;
    return user?.uid ?? '';
  }

  getUserToken() {
    var token = FirebaseAuth.instance.currentUser!.getIdToken();
    return token;
  }

  bool usernameAvailable() {
    return true;
  }

// static void logout(context) {
//   FirebaseAuth.instance.signOut().then((value) => {
//         Provider.of<UserModel>(context, listen: false).resetState(),
//         Navigator.pushReplacementNamed(context, '/login')
//       });
// }
}

myLoader(context, {color}) {
  // bool IsDark = IsDarkTheme(context);
  bool IsDark = false;
  return SizedBox(
    height: 16,
    width: 16,
    child: CircularProgressIndicator(
      strokeWidth: 2.5,
      color: (color != null)
          ? color
          : IsDark
              ? Colors.black
              : PrimaryColors().white,
    ),
  );
}

String getTimeAgo(timestamp) {
  if (timestamp.toString().isNotEmpty) {
    final now = DateTime.now();
    final dateTime = timestamp;
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'Now';
    }
  } else {
    return "";
  }
}

Color getRandomDarkColor() {
  Random random = Random();
  int r = random.nextInt(128);
  int g = random.nextInt(128);
  int b = random.nextInt(128);
  Color color = Color.fromARGB(255, r, g, b);

  return color;
}

Color getRandomLightColor() {
  Random random = Random();

  int r = random.nextInt(128) + 128;
  int g = random.nextInt(128) + 128;
  int b = random.nextInt(128) + 128;
  Color color = Color.fromARGB(255, r, g, b);
  return color;
}

// Color getRandomColor(context) {
//   bool isDark = IsDarkTheme(context);
//   return isDark ? getRandomLightColor() : getRandomDarkColor();
// }

// Future compressImage(String imagePath) async {
//   var result = await FlutterImageCompress.compressWithFile(
//     imagePath,
//     quality: 50,
//   );
//   File compressedFile = File(imagePath);
//   await compressedFile.writeAsBytes(result!.toList(), flush: true);
//   return compressedFile;
// }

Future pickFileFromGallery(context, {type, image = false}) async {
  try {
    PlatformFile? file;

    FilePickerResult? result;
    if (image) {
      var pickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxWidth: 600,
          maxHeight: 600,
          imageQuality: 75);
      if (pickedImage != null) {
        return File(pickedImage.path);
      }
    } else if (type == FileType.video) {
      result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['mp4', 'avi', 'mov', 'mkv']);
    } else if (type == FileType.audio) {
      result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['mp3', 'wav', 'ogg', 'aac']);
    } else {
      result = await FilePicker.platform.pickFiles();
    }

    if (result != null) {
      file = result.files.first;

      if (file != null) {
        if (file.size <= 50 * 1024 * 1024) {
          return File(file.path.toString());
        } else {
          CustomSnackBar().basicSnackbar(
              context, "file bigger than 50mb can't be uploaded");
        }
      }
    }
  } catch (e) {
    print("Error $e");
  }
  return null;
}

// Future getThumbnailFromVideoUrl(String videoUrl) async {
//   try {
//     final uint8list = await VideoThumbnail.thumbnailFile(
//       video: videoUrl,
//       thumbnailPath: (await getTemporaryDirectory()).path,
//       imageFormat: ImageFormat.WEBP,
//       maxHeight: 64,
//       quality: 75,
//     );
//     return uint8list;
//   } catch (e) {
//     return "";
//   }
// }

// getNotificationByType(type) {
//   if (type == NotificationTypes.post_liked)
//     return "liked your post";
//   else if (type == NotificationTypes.post_disliked)
//     return "disliked your post";
//   else if (type == NotificationTypes.comment_liked)
//     return "liked your comment";
//   else if (type == NotificationTypes.comment_disliked)
//     return "disliked your comment";
//   else if (type == NotificationTypes.comment_created)
//     return "commented on your post";
//   else if (type == NotificationTypes.comment_reply)
//     return "replied to your comment";
//   else if (type == NotificationTypes.msg_request)
//     return "sent a message request";
// }

String AppVersion = '';
