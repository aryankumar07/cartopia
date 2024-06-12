import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void showsnackbar(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text))
  );
}


Future<List<File>> pickImages() async {
  List<File> images=[];

  try{
     var rec_files = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
     );

     if(rec_files!=null && rec_files.files.isNotEmpty){
      for(int i=0;i<rec_files.files.length; i++){
        images.add(File(rec_files.files[i].path!));
      }
     }
  }catch(e){
    print('error ocured');
    debugPrint(e.toString());
  }

  return images;

}