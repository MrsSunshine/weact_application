import 'package:http/http.dart' as http;
import 'package:weact_application/JasonParsing/reviews.dart';

class reviewsService{
  static const String url=
      static Future<List<Review>> getReview() async{
    try{
      final response = await http.get(url);
      if(200==response.statusCode){
        final List<Review> reviews = reviewFromJson(response.body);
        return reviews;
      }
    }catch(e){
      return List<Review>();
    }
  }
}