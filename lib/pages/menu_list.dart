import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  _MenuList createState() => _MenuList();
}

class _MenuList extends State<MenuList>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(restorationId: 'Aye');
  }
}