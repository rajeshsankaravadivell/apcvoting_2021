import 'package:flutter/material.dart';
import 'admin.dart';
typedef OnDelete();
class UserForm extends StatefulWidget {

  final User user;
  final  state = _UserFormState();
  final OnDelete onDelete;
UserForm({ Key key,this.user,this.onDelete}) : super(key : key);
  @override
  _UserFormState createState() => state;
  bool isValid()=> state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              leading: Icon(Icons.people ),
              title: Text('User Form'),
              actions: [
                IconButton(
                 icon: Icon(Icons.delete_outline),
                    onPressed: (){
                   widget.onDelete;
                    },
                ),


              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (val) => widget.user.heading,
                initialValue: widget.user.heading,
                validator:  (val) => val.length > 3 ? null : " Heading is invalid",
                decoration: InputDecoration(
                  labelText: 'HEADING',
                  hintText: 'ENTER HEADING'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (val) => widget.user.persons,
                initialValue: widget.user.persons,
                validator:  (val) => val.length > 3 ? null : " Person is invalid",
                decoration: InputDecoration(
                    labelText: 'PERSONS',
                    hintText: 'ENTER PERSONS'
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool validate(){
    var valid = form.currentState.validate();
    if(valid) form.currentState.save();
    return valid;
  }
}
