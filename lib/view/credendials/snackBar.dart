import 'package:flutter/material.dart';

snackBar(context,text){

   var snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}