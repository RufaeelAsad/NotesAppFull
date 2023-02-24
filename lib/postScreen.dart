import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostScreen extends StatefulWidget {
  @override
  PostScreenState createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController tittleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void addNewNote(String userId, String tittle, String content) async {
    try {
      Response response = await post(
          Uri.parse('https://cryptic-sea-72696.herokuapp.com/notes/add'),
          body: {'userid': userId, 'tittle': tittle, 'content': content});

      if (response.statusCode == 200) {
        print('new note added');
      } else {
        print('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add a new Note'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: const Image(
                  image: AssetImage('assets/login.jpg'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3.0)),
                    labelText: 'User ID',
                    hintText: 'User ID',
                    labelStyle:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: tittleController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3.0)),
                    labelText: 'Tittle ',
                    hintText: 'Tittle ',
                    labelStyle:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3.0)),
                    labelText: 'Content ',
                    hintText: 'Content ',
                    labelStyle:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  addNewNote(
                      userIdController.text.toString(),
                      tittleController.text.toString(),
                      contentController.text.toString());
                },
                child: const Text("Enter a New Note"),
              ),
            ],
          ),
        ));
  }
}
