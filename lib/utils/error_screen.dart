import 'package:flutter/material.dart';
import 'package:labook/utils/thems/styles_manager.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,body: Center(child: Text('ERROR HERE',style: getBoldStyle(fontSize: 17),),),
    );
  }
}
