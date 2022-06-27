import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:postman/post_modal.dart';

Future<List<PostOffice>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://api.postalpincode.in/pincode/110081'));
  return compute(parseData, response.body);
}

List<PostOffice> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<PostOffice>((json) => PostOffice.fromJson(json)).toList();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostOffice>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          return Text(PostOffice().country.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

// class PhotosList extends StatelessWidget {
//   final List<PostOffice> photos = [];

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 1,
//       ),
//       itemBuilder: (context, index) {
//         return Text(photos.toString());
//       },
//     );
//   }
// }
