import 'package:bytesbrick/Core/Functions/sharedPreferences.dart';
import 'package:bytesbrick/UI/Utils/Styles/boxDecoration.dart';
import 'package:bytesbrick/UI/Utils/Styles/textStyle.dart';
import 'package:bytesbrick/UI/Widgets/flatButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ModalBottomSheet extends StatefulWidget {
  final TextEditingController text;
  ModalBottomSheet(this.text);
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  String imagePath = '';
  String image;
  TextEditingController text1 = TextEditingController();
  getImage() async{
    var data = await readData('image');
    print('This is data $data');
    setState(() {
      image = data;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
        height: MediaQuery.of(context).size.height * 0.70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
    if (pickedFile != null) {
    image = pickedFile.path;
    } else {
    print('No image selected.');
    }
    });
                    // imagePathList = res[0]?.thumbPath;

                 var response = await saveData(saveKey: 'image' , saveValue: '${pickedFile.path}');
                 print('This is response of picture save $response');
                 await  getImage();
                },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.camera,
                    size: 30,
                  ),
                  SizedBox(width: 20,),
                  Text('Upload Picture', style: h3BlackText,)
                ],
              ),
            ),
            image == ''|| image=='null'||image==null
                ? SizedBox()
                : Image.file(
                    File(image),
                    height: MediaQuery.of(context).size.height*0.30,
                    width: double.infinity,
                  ),
            TextFormField(
              controller: widget.text,
              keyboardType: TextInputType.multiline,
             decoration: buildInputDecoration('Enter Text'),
            ),
            flatButton(context, 'Show Screen', () async{
              await saveData(saveKey: 'text', saveValue: '${widget.text.text}');
              Navigator.pop(context);}, Colors.black)
          ],
        ));
  }
}

settingModalBottomSheet(context, TextEditingController controller) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ModalBottomSheet(controller));
}
