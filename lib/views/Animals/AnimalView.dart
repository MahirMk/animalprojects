import 'package:animalprojects/providers/AniamlProvider.dart';
import 'package:animalprojects/resources/StyleResources.dart';
import 'package:flutter/material.dart';

import '../../models/Animal.dart';

class AnimalView extends StatefulWidget {

  Animal obj;

  AnimalView({this.obj});

  @override
  State<AnimalView> createState() => _AnimalViewState();
}

class _AnimalViewState extends State<AnimalView> {
  AnimalProvider provider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60,),
              Image.network(widget.obj.imageLink,width: 200,),
              SizedBox(height: 30,),
              Text(widget.obj.name,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.latinName,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.animalType,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.activeTime,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.lengthMin,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.lengthMax,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.weightMin,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.weightMax,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.lifespan,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.habitat,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.diet,style: StyleResources.btntextstyle,),
              SizedBox(height: 20,),
              Text(widget.obj.geoRange,style: StyleResources.btntextstyle,),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
