import 'package:animalprojects/views/Animals/AnimalError.dart';
import 'package:flutter/material.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/error_handler.dart';
import '../models/Animal.dart';
import '../resources/UrlResources.dart';

class AnimalProvider with ChangeNotifier
{
  List<Animal> alldata;
  animaladd(context) async
  {
    try
    {
      await ApiHandler.get(UrlResources.URL).then((json){
        alldata = json.map<Animal>((obj)=> Animal.fromJson(obj)).toList();
        notifyListeners();
      });
    }
    on ErrorHandler catch(e)
    {
      if(e.message=="Internet Connection Failure")
      {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>AnimalError())
        );
      }
    }
  }
  animalview() async
  {

  }

}