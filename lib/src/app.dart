import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_with_http/src/widgets/image_list.dart';
import 'package:http/http.dart' as http;
import 'models/image_model.dart';

class APP extends StatefulWidget {
  @override
  State<APP> createState() => _APPState();
}

class _APPState extends State<APP> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchData() async {
    counter++;
    String url = 'https://jsonplaceholder.typicode.com/photos/$counter';

    /// response is not json data
    /// it's an object that contains entire response such as status code, headers, body etc
    /// json data is nested inside of this response object
    var response = await http.get(Uri.parse(url));

    /// we first get the raw json from response.body
    /// json.decode converts raw JSON data to map data structure
    ImageModel imageModel =  ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter API with HTTP'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchData,
          child: const Icon(Icons.add),
        ),
        body:  Column(
          children: [
            const Text('Whenever you click the + icon button it\'ll add an image to the list, which is coming from the'
                ' api',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            ImageList(images: images),
          ],
        ),
      ),
    );
  }
}
