import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
      }
    }
    
    class HomeState extends State<Home> {

      final TextEditingController _ageController= new TextEditingController();
      final TextEditingController _heightController= new TextEditingController();
      final TextEditingController _weightController= new TextEditingController();
      double _bmi=0.0;
      bool _validate= false;
      String _bmiStatus = "";

      void _showBmi()
      {
        setState(() {

            _ageController.text.isEmpty ? _validate = true : _validate = false;
            _bmi= _calculateBmi(_weightController.text,_heightController.text);
          
            if(_bmi<18.5)
            {
              _bmiStatus = "Underweight";
            }
            else if(_bmi>=18.5 && _bmi<=24.9)
            {
              _bmiStatus = "Normal";
            }
            else if(_bmi>=25 && _bmi<=29.9)
            {
              _bmiStatus = "Overweight";
            }
            else if(_bmi>=30.0)
            {
              _bmiStatus = "Obese";
            }
            else{
              _bmiStatus="Invalid";
            }

                  });
                }
            @override
            Widget build(BuildContext context) {
              return new Scaffold(
                appBar: new AppBar(
                  title: new Text("BMI"),
                  centerTitle: true,
                  backgroundColor: Color(0xffff6347),
                ),
          
              body: new Container(
                
                alignment: Alignment.topCenter,
                child: new ListView(
                  padding: const EdgeInsets.all(2.5),
                  children: <Widget>[
                    new Image.asset('images/bmi.png',
                    height : 133.0,
                    width : 200.0,),
          
                    new Container(
                      color: Colors.pink.shade100,
                      margin: const EdgeInsets.all(3.0),
                      alignment: Alignment.center,
                      child: new Column(
                        children: <Widget>[
                          new Padding(padding: const EdgeInsets.all(1.5),),
          
                          new TextField(
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              labelText: "Enter Age",
                              icon: new Icon(Icons.person),
                              errorText: _validate? "Value Can\'t Be Empty" : null,
                            ),
                          ),
          
                          new Padding(padding: const EdgeInsets.all(1.5),),
          
                          new TextField(
                            controller: _heightController,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              labelText: "Enter Height",
                              hintText: "In Centimeters",
                              icon: new Icon(Icons.insert_chart),
                              errorText: _validate? "Value Can\'t Be Empty" : null,
                              
                            ),
                          ),
          
                          new Padding(padding: const EdgeInsets.all(1.5),),
          
                          new TextField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              labelText: "Enter Weight",
                              hintText: "In Kilograms",
                              icon: new Icon(Icons.line_weight),
                              errorText: _validate? "Value Can\'t Be Empty" : null,
                              
                            ),
                          ),
          
                          new Padding(padding: const EdgeInsets.all(10.5),),
          
                          new RaisedButton(
                            
                            onPressed: _showBmi,
                            
                                              child: new Text("Calculate BMI!"),
                                              color: Color(0xffff6347),
                                              splashColor: Colors.red,
                                            ),
                                            
                                            new Padding(padding: const EdgeInsets.all(10.5),),
                            
                                          ],
                                        ),
                                        
                                      ),
                            
                                      new Container(
                                        child: new Column(
                                          children: <Widget>[
                                            new Padding(padding: const EdgeInsets.all(5.5),),
                            
                                            new Text("Your BMI Is ${_bmi.toStringAsFixed(1)}",
                                                  style: new TextStyle(
                                                    fontSize: 25.4,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff006699),
                                                  ),),
                            
                                            new Padding(padding: const EdgeInsets.all(5.5),),
                            
                                            new Text("Your BMI Status Is: $_bmiStatus",
                                                  style: new TextStyle(
                                                    fontSize: 19.4,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.brown,
                                                  ),),
                            
                                          ],
                                        ),
                                      ),
                            
                            
                            
                            
                                    ],
                                  ),
                                ),
                                );
                            
                                
                              }
          
            double _calculateBmi(String weight, String height) {
              if(weight.isNotEmpty && height.isNotEmpty)
              {
                return (int.parse(weight)*10000)/(int.parse(height)*int.parse(height));
              }
              else
              return 0.0;
            }

} 
