import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:postman/post_modal.dart';

// void fetchPost() async {
//   String url = 'https://api.postalpincode.in/pincode/110081';
//   var response = await http.get(Uri.parse(url));
//   // String data = response.body;
//   var data = jsonDecode(response.body.toString());
//   print(data);
// }

class ApiService {
  Future<PostOffice> getData() async {
    String url = 'https://api.postalpincode.in/pincode/110081';
    var response = await http.get(Uri.parse(url));

    return PostOffice.fromJson(jsonDecode(response.body));
  }
}
