import 'dart:developer';
import 'dart:io';

import 'package:intl/intl.dart';

class FormValidationServices {
//--------------->>>-----PhoneNumber Validation----->>>------------------------

  static bool phoneNumberValidation(String? phoneNumber) {
    if (phoneNumber != null &&
        phoneNumber.isNotEmpty &&
        phoneNumber.length == 10) {
      return true;
    }
    return false;
  }

//--------------->>>-----Full Name Validation----->>>------------------------

  static bool fullNameValidation(String? fullName) {
    if (fullName != null && fullName.isNotEmpty && fullName.length >= 3) {
      return true;
    }
    return false;
  }

//--------------->>>-----Email Validation----->>>------------------------

  static bool emailValidation(String? email) {
    if (email != null &&
        email.isNotEmpty &&
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return true;
    }
    return false;
  }

  //--------------->>>-----OTP Validation----->>>------------------------

  static bool otpValidation(String? otp) {
    if (otp != null && otp.length == 6 && int.tryParse(otp) != null) {
      return true;
    }
    return false;
  }

//--------------->>>-----Birthday Validation----->>>------------------------

  static bool validateBirthday(String? date) {
    if (date != null) {
      try {
        DateTime parseDate;

        // Try parsing the date in the "dd/MM/yyyy" format
        try {
          parseDate = DateFormat('dd/MM/yyyy').parse(date);
        } catch (_) {
          // If parsing fails, try parsing in another format or handle accordingly
          parseDate = DateFormat('your_alternate_format').parse(date);
        }

        DateTime currentDate = DateTime.now();

        if (parseDate.isBefore(currentDate) && isAdult(parseDate)) {
          return true;
        }
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  static bool isAdult(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    // Check if the birthday has occurred this year
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age >= 18;
  }
}

//--------------->>>-----Image Validation----->>>------------------------

class ImageValidationService {
  double getImageSize(File selectedImage) {
    final bytes = selectedImage.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    // final mb = kb / 1024;
    if (kb < 2000.0) {
      log("Image is Less than 5MB");
    } else {
      log("Image is More than 5MB...!!!");
    }
    return kb;
  }
}
