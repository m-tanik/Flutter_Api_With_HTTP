import 'package:flutter/material.dart';
import '../models/image_model.dart';
 class ImageList extends StatelessWidget {
   final List<ImageModel> images;
    ImageList({required this.images});

   @override
   Widget build(BuildContext context) {
     return  Expanded(
       child: ListView.builder(
       itemCount: images.length,
           itemBuilder: (BuildContext context,int index) {
         return imageContainer(url: images[index].url, title: images[index].title);
           }),
     );
   }
 }

 Widget imageContainer({String? url, String? title}) {
   return Container(
     padding: EdgeInsets.all(20),
     child: Column(
       children: [
     Image.network(url!),
         SizedBox(height: 10,),
         Text(title!),
       ],
     ),
   );
 }


