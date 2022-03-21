import 'dart:convert';

class user_model
{
  int id;
  String name;
  String family;
  String username;

  user_model({
    required this.id,
    required this.name,
    required this.family,
    required this.username
  });


  factory user_model.from_json(Map<String,dynamic> json)
  {
    return user_model(id: json['id'], name: json['name'], family: json['family'], username: json['username']);
  }


}