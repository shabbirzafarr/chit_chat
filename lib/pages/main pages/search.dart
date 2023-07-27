

import 'dart:js_interop';

import 'package:chit_chat/pages/database/data.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
class search extends StatefulWidget {
  search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final DatabaseService a=DatabaseService(phoneNumber: FirebaseAuth.instance.currentUser!.phoneNumber!);
  dynamic contact=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadData();
  }
  void LoadData()async{
    final PermissionStatus permission = await Permission.contacts.status;

    if(permission==PermissionStatus.denied){
      await [Permission.contacts].request();
    }
    if(permission==PermissionStatus.granted){
      
      contact = await FastContacts.getAllContacts();
      List<Contact> c=contact.toList();
      // c.sort(contact.d)
    //   for (int i = 0; i < 50; i++) {
    //     // dynamic a=;
    //     (c[i].displayName!=null)?print(c[i].phones.first.number.toString()):print("g mrao");
    // }
    setState(() {
      
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(color: Color(0xff769CFF)),
      child: Column(children: [
          Container(
                  height: height/30,
          ),
          Container(
            height: height/1.3,
            width: width,
            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(height/15),topRight: Radius.circular(height/15)),color: Colors.white,),
            child: (contact.length==0)?Expanded(child: Center(child: CircularProgressIndicator())) :Container(
              margin: EdgeInsets.only(top: 30),
              child: ListView.builder(
                itemCount: contact.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(contact[index].displayName),
                      subtitle: Text(contact[index].phones.first.number),
                    ),
                  );
                },
              ),
            ),
          )
          // (contact)

      ]
  )
    );
  }
}