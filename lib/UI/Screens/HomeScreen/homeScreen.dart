import 'package:bytesbrick/Core/Functions/sharedPreferences.dart';
import 'package:bytesbrick/UI/Utils/Styles/textStyle.dart';
import 'package:bytesbrick/UI/Widgets/flatButton.dart';
import 'package:flutter/material.dart';
import 'package:bytesbrick/UI/Screens/HomeScreen/Widgets/bottomSheet.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imagePath ;
  TextEditingController text = TextEditingController();
  String text1;

  getText() async{
    var text = await readData('text');
    setState(() {
      this.text.text = text;
    });
    print('This is text1 $text');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(50, 20, 50, 10),
        child: ListView(
          children: [
            flatButton(context, 'Start', () {
            settingModalBottomSheet(context, text);
              getText();
              }, Colors.black),
           SizedBox(height: 50,),
           text.text == null || text.text==''?SizedBox():Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(width: 1.0, color: Colors.blueGrey),)
                ),
                child: Text('${text.text}',style: h3BlackText,)),
          ],
        ),
      )
    );
  }
}
