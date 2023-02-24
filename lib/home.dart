import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'NoteModel.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<NoteModel> notesList = [];

  Future<List<NoteModel>> getUserApi() async {
    final response = await http
        .get(Uri.parse('https://cryptic-sea-72696.herokuapp.com/notes/list'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        notesList.add(NoteModel.fromJson(i));
      }
      return notesList;
    } else {
      return notesList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
                builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: notesList.length,
                    itemBuilder: (context, index) {
                      return Text(notesList[index].userid.toString());
                    });
                }),
          )
        ],
      )
    );
  }
}
