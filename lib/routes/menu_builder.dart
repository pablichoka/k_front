import 'package:flutter/material.dart';

class MenuBuilder extends StatefulWidget {
  const MenuBuilder({Key? key}) : super(key: key);

  @override
  MenuBuilderBuilder createState() => MenuBuilderBuilder();
}

class MenuBuilderBuilder extends State<MenuBuilder>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(restorationId: 'Aye');
  }
}