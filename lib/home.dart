import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

  int radioValue = 0 ;
  double _finalResult = 0.0;
  String _formattedString = "";
  final TextEditingController _weightController = new TextEditingController();

  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;
      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text,0.06);
          _formattedString = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
        break;
        case 1:
          _finalResult = calculateWeight(_weightController.text,0.38);
          _formattedString = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedString = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";

          break;

          
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weight on Planet X'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('assets/images/planet.png',
              width: 200.0,
              height: 133.0,),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your Wieght on Earth",
                      labelStyle: TextStyle(fontSize: 30.0,color: Colors.black),
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline,size:45.0,)
                    ),
                  ),
                   new Padding(padding: new EdgeInsets.all(15.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text('Pluto',style: new TextStyle(color: Colors.white30,fontSize: 25.0) ,),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text('Mars',style: new TextStyle(color: Colors.white30,fontSize: 25.0) ,),

                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text('Venus',style: new TextStyle(color: Colors.white30,fontSize: 25.0) ,),

                    ],
                  ),
                 new Padding(padding: new EdgeInsets.all(15.6)),
                     new Text(

                     _weightController.text.isEmpty ? "Please enter your weight!!" : "$_formattedString lbs",
                       style: new TextStyle(
                        color: Colors.white,fontSize: 19.4,fontWeight:FontWeight.w500),
                    ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      return int.parse(weight)*multiplier;
    } else {
      print("Wrong!!");
      return int.parse("180")*0.38;
    }
  }
}
