/// We create a model class to give dart a better idea of the types of data that we are going to work with
class ImageModel {
   late String url;
   late int id;
   late String title;
  ImageModel({required this.id, required this.title, required this.url});

   ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    title = json['title'];
  }
}