import 'package:bmicalculator/results_page.dart';
import 'package:flutter/material.dart';
import './icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './reusable_card.dart';
import './constants.dart';
import './results_page.dart';
import './bottom_button.dart';
import 'calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState(); 
    // TODO: implement createState
}

class _InputPageState extends State<InputPage>{
Color maleCardColour = inactiveCardColor;
Color femaleCardColour = inactiveCardColor;
Gender  selectedGender;
int height = 180;
int weight = 60;
int age = 19;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title:Text("BMI CALCULATOR"),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(children: <Widget>[
            Expanded(child: ReusableCard(
              onPress: (){
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              colour: selectedGender == Gender.male ? colorContainer : inactiveCardColor, 
            cardChild: IconContent(icon: FontAwesomeIcons.mars,label:'MALE'),
             
            ),
    ),
    Expanded(child:  ReusableCard(
      onPress: (){
        setState(() {
          selectedGender = Gender.female;
        });
      },
      colour: selectedGender ==Gender.female? colorContainer:inactiveCardColor,
      cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),),
    ),
          ],
          ),
          ),
Expanded(child:  ReusableCard(colour: colorContainer,
cardChild: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children:<Widget>[
    Text('HEIGHT',style: labelTextStyle),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
       Text(height.toString(),style: NumberTextStyle,),
       Text(
         'cm',
         style: labelTextStyle,),
      ],
      ),
      SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: Color(0xFF8D8E98),
          thumbColor: Color(0xFFEB1555),
          overlayColor: Color(0x29EB1555),
          thumbShape:RoundSliderThumbShape(enabledThumbRadius: 15.0),
           overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          
        ),
              child: Slider(
          value: height.toDouble(),
          min: 120.0,
          max: 220.0,
          
          
          onChanged:(double newValue){
              setState(() {
                height = newValue.round();
              });
          },
        ),
      ),
  ],
),)
    ),
    Expanded(child: Row(children: <Widget>[

      Expanded(child:  ReusableCard(colour: colorContainer,
      cardChild: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('WEIGHT', style: labelTextStyle,),
        Text(weight.toString(),
        style: NumberTextStyle,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
           RoundIconButton(
             icon: FontAwesomeIcons.minus,
             onPressed: (){
               setState(() {
                 weight -- ;
               });
             },
           ),
            SizedBox(width: 10.0,),
            RoundIconButton(icon: FontAwesomeIcons.plus,
            onPressed: (){
              setState(() {
                weight++;
              });
            },),
          ],
        ),
      ],),
      ),
      ),
    
    Expanded(child:  ReusableCard(colour: colorContainer,
    cardChild: Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: <Widget>[
        Text('AGE',style:labelTextStyle),
        Text(age.toString(),style: NumberTextStyle,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
          RoundIconButton(icon: FontAwesomeIcons.minus,
          onPressed: (){
            setState(() {
              age --;
            });
          },),
          SizedBox(width:10.0),
          RoundIconButton(icon: FontAwesomeIcons.plus,
          onPressed: 
          (){
            setState(() {
              age ++;
            });
          },)
        ]
        )
      ],
    ),),),
    
    ],),),
     BottomButton(buttonTitle: 'CALCULATE',
     onTap:(){ 
       Calculator calc = Calculator(height:height,weight: weight);
       Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
         bmiResult: calc.calculateBMI(),
         resultText: calc.getResult(),
         interpretation: calc.getInterpretation(),
       ),
       ),
       );
     },),
        ],
    ),
      );
        
    
    
  }

}

class RoundIconButton extends StatelessWidget {

RoundIconButton({this.icon,this.onPressed}); 
 final IconData icon;
 final Function onPressed;
 
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width:56.0,
        height:56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      
    );
  }
}
