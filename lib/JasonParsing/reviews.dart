import 'dart:convert';

List<Review> reviewFromJson(String str) => List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

String reviewToJson(List<Review> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Review {
  Review({
    this.name,
    this.review,
    this.starNum,
  });

  String name;
  String review;
  int starNum;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    name: json["name"],
    review: json["review"],
    starNum: json["starNum"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
    "starNum": starNum,
  };
}