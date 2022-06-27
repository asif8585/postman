import 'dart:convert';
import 'dart:math';
import 'package:postman/post_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class nestedJson extends StatefulWidget {
  @override
  State<nestedJson> createState() => _nestedJsonState();
}

class _nestedJsonState extends State<nestedJson> {
  final url = "https://api.postalpincode.in/pincode/110081";
  var data;
  PostModal _postModal = PostModal();

  Future<PostModal> getData() async {
    final response = await http.get(Uri.parse(url));
    data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return PostModal.fromJson(data);
    } else {
      return PostModal.fromJson(data);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<PostModal>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(_postModal.message.toString()),
                          ],
                        );
                      });
                } else {
                  return Center(
                    child: Text(_postModal.message.toString()),
                  );
                }
              }),
        ),
      ],
    );
  }
}
