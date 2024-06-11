import 'package:flutter/material.dart';

class MenuBuilder extends StatefulWidget {
  const MenuBuilder({Key? key}) : super(key: key);

  @override
  _MenuBuilder createState() => _MenuBuilder();
}

class _MenuBuilder extends State<MenuBuilder>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(restorationId: 'Aye');
  }
}