import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class finalApi extends StatefulWidget {
  finalApi({Key? key}) : super(key: key);

  @override
  State<finalApi> createState() => _finalApiState();
}

class _finalApiState extends State<finalApi> {
  final url = "https://api.postalpincode.in/pincode/110081";
  var data;
  getData() async {
    var response = await http.get(Uri.parse(url));
    data = jsonDecode(response.body);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data[0]['Message']),
    );
  }
}
