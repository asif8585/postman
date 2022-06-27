import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallingApi extends StatefulWidget {
  CallingApi({Key? key}) : super(key: key);

  @override
  State<CallingApi> createState() => _CallingApiState();
}

class _CallingApiState extends State<CallingApi> {
  final url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  getData() async {
    var res = await http.get(Uri.parse(url));
    // print(res.body);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Card(
            child: ListTile(
                title: Text("Id Number:" + data[index]['id'].toString()),
                subtitle: Text(data[index]["title"]),
                leading: Image.network(data[index]['url'])),
          );
        }));
  }
}
