import 'package:flutter/material.dart';
import 'package:webapp/form.dart';

import 'admin.dart';


class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<UserForm> forms = [];
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    forms.clear();
    for(int i =0 ; i< users.length; i++ ){
      forms.add(UserForm(
        key: GlobalKey(),
        user: users[i],
        onDelete: () => onDelete(i),

      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
        actions: [
          FlatButton(
            child: Text('Save'),
            onPressed: onSave ,
          )
        ],

      ),
      body: users.length <= 0 ? Center(
        child: Text('Add Form by tapping [+] button bellow',style: TextStyle(color: Colors.black),),
      ) : ListView.builder(
        itemBuilder: (_,i) => forms[i],
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAddForm,
      ),
    );
  }

  void onDelete(int index){
    setState(() {
      try
          {
           users.removeLast();
          }
          catch(e)
      {
        print(e);
      }
    });
  }

  void onAddForm(){
    setState(() {
      users.add(User());
    });
  }

  void onSave(){
    forms.forEach((form) => form.isValid() );
  }
}
