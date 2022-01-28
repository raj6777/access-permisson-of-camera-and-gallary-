import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main()=>runApp(MyApp());
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{
  File? _image;
  Future getImage(bool isCamera) async{
    XFile? image;
    if(isCamera){
      image =(await ImagePicker().pickImage(source: ImageSource.camera));
    }
    else{
      image = (await ImagePicker().pickImage(source: ImageSource.gallery));
    }
    setState(() {
      _image = File(image!.path);
    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(title: Text('Image Pick Demo'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                IconButton(onPressed: (){
                  getImage(false);
                },
                  icon: Icon(Icons.insert_drive_file),
                ),
                SizedBox(
                  height:10.0,
                ),
                IconButton(onPressed: (){
                  getImage(true);
                },
                  icon: Icon(Icons.camera_alt),
                ),
                _image==null? Container() : Image.file(_image!,height: 300.0,width: 300.0,),
              ],
            ),
          ),
        )
    );
  }
}