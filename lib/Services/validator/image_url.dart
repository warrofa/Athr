import 'package:http/http.dart' as http;
import 'package:formz/formz.dart';

enum ImageURLValidator { empty, pageDoesNotExist, urlNotImage }

class ImageURL {
  
  
  static ImageURLValidator? validator(String value) {
    if (value.isEmpty) {
      return ImageURLValidator.empty;
    } else if(RegExp('[-+_!;`"\'\\/\$%^&*., ?]').hasMatch(value)){
      return ImageURLValidator.pageDoesNotExist;
    }else{
      return null;
    }
  }

  static String? showEmailErrorText(ImageURLValidator? error) {
    if (error == ImageURLValidator.empty) {
      return "* field is empty";
    } else if (error == ImageURLValidator.pageDoesNotExist) {
      return "A valid community only allows ~ @ # as special characters";
    } else {
      return null;
    }
  }
}

Future<bool> validateURL(String imageUrl) async {
    http.Response res;
    try {
      res = await http.get(Uri.parse(imageUrl));
      return true;
    } catch (e) {
      return false;
    }
  }