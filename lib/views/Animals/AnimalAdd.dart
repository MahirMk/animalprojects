
import 'package:animalprojects/views/Animals/AnimalView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../models/Animal.dart';
import '../../providers/AniamlProvider.dart';
class AnimalAdd extends StatefulWidget {

  @override
  State<AnimalAdd> createState() => _AniamlAddState();
}

class _AniamlAddState extends State<AnimalAdd> {
  AnimalProvider provider;
  List<Animal> alldata;

  getdata() async
  {

  await provider.animaladd(context);

    // Uri url = Uri.parse(UrlResources.URL);
    // var response = await http.get(url);
    // //200 ok 400 api problem 500 server error
    // if(response.statusCode==200)
    // {
    //   var body = response.body.toString();
    //   var json = jsonDecode(body);
    //   setState((){
    //     provider.alldata = json.map<Animal>((obj)=> Animal.fromJson(obj)).toList();
    //   });
    // }
    // else
    // {
    //   print("API Error");
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<AnimalProvider>(context,listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AnimalProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal View"),
      ),
      body: (provider.alldata!=null)?ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context,index)
        {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>AnimalView(obj: provider.alldata[index],))
                        );
                      },
                      child: Card(
                        color: Colors.red.shade100,
                        child: Column(
                          children: [
                            SizedBox(height: 10.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.network(provider.alldata[index].imageLink.toString(),width: 300,height: 100,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].name,
                                    style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w700,fontSize: 20,
                                      decoration: TextDecoration.underline,
                                      decorationStyle: TextDecorationStyle.wavy,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].latinName.toString(),style: TextStyle(color: Colors.blue.shade900,fontSize: 12),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(provider.alldata[index].diet.toString(),style: TextStyle(color: Colors.blue.shade900,fontSize: 6),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ):Center(
        child: LoadingAnimationWidget.prograssiveDots(
          color: Colors.purple,
          size: 80,
        ),
      ),
    );
  }
}
