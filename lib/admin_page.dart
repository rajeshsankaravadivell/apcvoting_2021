// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// List<String> peoples;
// List<String> heading;
// String newTaskTile2;
// class AdminPage extends StatefulWidget {
//   @override
//   _AdminPageState createState() => _AdminPageState();
// }
//
//
//
// class AddTask extends StatefulWidget {
//   final Function AddtaskCallBack;
//   AddTask(this.AddtaskCallBack);
//
//   @override
//   _AddTaskState createState() => _AddTaskState();
// }
//
// class _AddTaskState extends State<AddTask> {
//   @override
//   Widget build(BuildContext context) {
//     String newTaskTile;
//
//     return SingleChildScrollView(
//       child: Container(height: 600,
//         color: Colors.black,
//         child: Container(height: 500,
//           padding: EdgeInsets.only(left: 30,right: 30,bottom: 30,top: 0),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20), topRight: Radius.circular(20))),
//           child: Column(
//             children: [
//               Text(
//                 'Add Task',
//                 style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.pink),
//               ),
//               TextField(
//                 style: TextStyle(color: Colors.black),
//                 autofocus: true,
//                 textAlign: TextAlign.center,decoration: InputDecoration(hintText: 'ENTER HEADING'),
//                 onChanged: (newText) {
//                   newTaskTile = newText;
//                 },
//               ),
//
//               SizedBox(height: 5,),
//               FlatButton(
//                 onPressed: () {
//                   widget.AddtaskCallBack(newTaskTile);
//
//                 },
//                 color: Colors.pink,
//                 child: Text(
//                   'ADD',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               SizedBox(height: 5,),
//               FloatingActionButton(
//                 backgroundColor: Colors.pink,
//                 child: Icon(Icons.add,color: Colors.white,size: 25,),
//                 onPressed: (){
//                 },
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
//
//
//
// class AddPeople extends StatelessWidget {
//   final Function AddpeopleCallBack;
//   AddPeople(this.AddpeopleCallBack);
//   @override
//   Widget build(BuildContext context) {
//     String newTaskTile;
//     return Container(
//       color: Colors.black,
//       child: Container(height: 500,
//         padding: EdgeInsets.only(left: 30,right: 30,bottom: 30,top: 0),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20), topRight: Radius.circular(20))),
//         child: TextField(
//           style: TextStyle(color: Colors.black),
//           autofocus: true,
//           textAlign: TextAlign.center,decoration: InputDecoration(hintText: 'ENTER People'),
//           onChanged: (newText) {
//             newTaskTile = newText;
//             AddpeopleCallBack(newTaskTile);
//           },
//         ),
//       ),
//     );
//   }
// }
//
//
// class _AdminPageState extends State<AdminPage> {
//
//
//   @override
//   void initState() {
//     super.initState();
//     heading = List();
//     peoples = List();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//               context: context,
//               builder: (context) => AddTask((newTasktile) {
//                 setState(() {
//                   heading.add("$newTasktile");
//                   print(newTasktile);
//                 });
//               },));
//         },
//         backgroundColor: Colors.pink,
//         child: Icon(Icons.add),
//       ),
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: Text('Admin Area'),
//       ),
//       body: SafeArea(
//         child: Grid(),
//       ),
//     );
//   }
//
// }
//
// Widget list() {
//   return ListView.builder(
//     shrinkWrap: true,
//     physics: NeverScrollableScrollPhysics(),
//     padding: EdgeInsets.all(20.0),
//     itemCount: heading.length,
//     itemBuilder: (BuildContext context, int index) {
//       return row(context, index);
//     },
//   );
// }
//
// Widget row(context, index){
//   return  SizedBox(height: 300,width: 100,
//     child: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Color(0xFFFDF5E6)),
//       child: ListTile(
//         title: Text(' ${heading[index]}',style:TextStyle(color: Colors.black) ,),
//
//       ),
//     ),
//   );}
//
//
//
//   Widget Grid(){
//   return GridView.builder(itemBuilder: (BuildContext context, int index) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(height: 400,width: 400,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Color(0xFFFDF5E6)),
//         child: new GridTile(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 new Text(heading[index]
//                 ),
//               ],
//             )
//           ), //just for testing, will fill with image later
//         ),
//       ),
//     );
//   },
//     itemCount: heading.length,
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//
//   ));
//   }







//
// import 'package:flutter/material.dart';
//
// class AdminPage1 extends StatefulWidget {
//   @override
//   _AdminPage1State createState() => _AdminPage1State();
// }
//
// class _AdminPage1State extends State<AdminPage1> {
//   List<String> _peoples = List();
//   List<Widget> people = List();
//   List<String> total = List();
//   List<String> _title = List();
//   TextEditingController title = TextEditingController();
//   String name;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.grey[200],
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               onpressed();
//             },
//             child: Icon(Icons.add),
//           ),
//           body: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//               ),
//               itemCount: total.length,
//               itemBuilder: (context, index) {
//                 print('Total : $total');
//                 return Card(
//                  child: new GridTile(
//                    child: Padding(
//                        padding: const EdgeInsets.all(20.0),
//                        child: Column(
//                          children: [
//                            new Text(_title[index]
//                            ),
//                            Text(
//                               for(var item in  total[index].replaceAll('[', '').replaceAll(']', ''))),
//                          ],
//                        )
//                    ), //just for testing, will fill with image later
//                  ),
//
//
//                   // child: ListTile(
//                   //   title: Text(_title[index]),
//                   //   subtitle: Text(
//                   //       total[index].replaceAll('[', '').replaceAll(']', '')),
//                   // ),
//                 );
//               })),
//     );
//   }
//
//   onpressed() {
//     showModalBottomSheet<dynamic>(
//         isScrollControlled: true,
//         context: context,
//         builder: (context) {
//           return Center(
//             child: StatefulBuilder(
//                 builder: (BuildContext context, StateSetter stateSetter) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Text(
//                               "Enter Required data",
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               maxLines: 1,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             controller: title,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12.0)),
//                                 hintText: 'Title'),
//                           ),
//                         ),
//                         Expanded(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               Widget widget = people.elementAt(index);
//                               return Row(
//                                 children: [
//                                   widget,
//                                   IconButton(
//                                       icon: Icon(
//                                         Icons.close,
//                                       ),
//                                       onPressed: () {
//                                         deleted(stateSetter, index);
//                                       })
//                                 ],
//                               );
//                             },
//                             itemCount: people.length,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: FloatingActionButton(
//                             backgroundColor: Color(0xFF34A373),
//                             onPressed: () {
//                               updated(stateSetter);
//                               name != null
//                                   ? _peoples.add(name)
//                                   : print('Null value');
//                               print('Controller : $name');
//                             },
//                             child: new Icon(Icons.add),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             FlatButton(
//                               onPressed: () {
//                                 _title.add(title.text);
//                                 _peoples.add(name);
//                                 print('Controller : $name');
//                                 total.add(_peoples.toString());
//                                 print('Total : ${total.toString()}');
//                                 _peoples.clear();
//                                 people.clear();
//                                 title.clear();
//                                 setState(() {
//                                   name = null;
//                                 });
//
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('Submit'),
//                             ),
//                             FlatButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('Cancel'),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   );
//                 }),
//           );
//         });
//   }
//
//   Future updated(StateSetter updateState) {
//     updateState(() {
//       TextEditingController controller = TextEditingController();
//       people.add(Expanded(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: new TextFormField(
//             onChanged: (val) {
//               setState(() {
//                 name = val;
//               });
//             },
//             autovalidate: true,
//             controller: controller,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0)),
//                 hintText: '(${people.length + 2}) Subtitle'),
//           ),
//         ),
//       ));
//       setState(() {});
//       // print('Controller : ${controller.text}');
//     });
//   }
//
//   deleted(StateSetter updateState, index) {
//     updateState(() {
//       people.removeAt(index);
//     });
//   }
// }



//try this


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:webapp/result.dart';
// import 'package:webapp/user_management.dart';
//
// final _firestore = FirebaseFirestore.instance;
//
// class AdminPage1 extends StatefulWidget {
//   @override
//   _AdminPage1State createState() => _AdminPage1State();
// }
//
// class _AdminPage1State extends State<AdminPage1> {
//   List<String> _peoples = List();
//   List<Widget> people = List();
//   List<String> total = List();
//   List<String> totaldescription = List();
//   List<String> _title = List();
//   List<String> _descriptions = List();
//   List<Widget> description = List();
//   bool result = true;
//   List <File> _image = [];
//   final picker = ImagePicker();
//   var item;
//   var descriptionItems;
//   TextEditingController title = TextEditingController();
//   String name;
//   String Description;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.grey[200],
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: Colors.pink,
//             onPressed: () {
//               onpressed();
//             },
//             child: Icon(Icons.add),
//           ),
//           body:result ? Center(
//             child: FlatButton(
//               color: Colors.pink,
//               onPressed: (){
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         Result(),
//                   ),
//                 );
//               },
//               child: Text('View Result'),
//             ),
//           ) :  GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//               ),
//               itemCount: total.length,
//               itemBuilder: (context, index) {
//                 print('Total : $item');
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: Color(0xFFFDF5E6),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: Text(_title[index],
//                               style: Theme.of(context).textTheme.headline6),
//                         ),
//                         for (item in total[index]
//                             .replaceAll('[', '')
//                             .replaceAll('[', '')
//                             .replaceAll(']', '')
//                             .replaceAll('[', '')
//                             .replaceAll(']', '')
//                             .split(','))
//                           Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Text(
//                               '(${total.length +1}) $item',
//                                     style:
//                                     Theme.of(context).textTheme.subtitle1,
//                                   ),
//                                 ],
//                               )),
//                         for (descriptionItems in totaldescription[index]
//                             .replaceAll('[', '')
//                             .replaceAll('[', '')
//                             .replaceAll(']', '')
//                             .replaceAll('[', '')
//                             .replaceAll(']', '')
//                             .split(','))
//                           Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     '( des :  $descriptionItems',
//                                     style:
//                                     Theme.of(context).textTheme.subtitle1,
//                                   ),
//                                 ],
//                               )),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//       ),
//     );
//   }
//
//   onpressed() {
//     showModalBottomSheet<dynamic>(
//         isScrollControlled: true,
//         context: context,
//         backgroundColor: Colors.transparent,
//         builder: (context) {
//           return Container(
//             height: MediaQuery.of(context).size.height * 0.80,
//             decoration: new BoxDecoration(
//               color: Colors.white,
//               borderRadius: new BorderRadius.only(
//                 topLeft: const Radius.circular(25.0),
//                 topRight: const Radius.circular(25.0),
//               ),
//             ),
//             child: StatefulBuilder(
//                 builder: (BuildContext context, StateSetter stateSetter) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Text(
//                               "Enter Required data",
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               maxLines: 1,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             controller: title,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12.0)),
//                                 hintText: 'Title'),
//                           ),
//                         ),
//                         Expanded(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               Widget widget = people.elementAt(index);
//                               return Row(
//                                 children: [
//                                   widget,
//                                   IconButton(
//                                       icon: Icon(
//                                         Icons.close,
//                                       ),
//                                       onPressed: () {
//                                         deleted(stateSetter, index);
//                                       }),
//                                   IconButton(
//                                     icon: Icon(Icons.image),
//                                     onPressed: (){
//                                       ChooseImage();
//                                     },
//                                   )
//                                 ],
//                               );
//                             },
//                             itemCount: people.length,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: FloatingActionButton(
//                             backgroundColor: Colors.pink,
//                             onPressed: () {
//                               updated(stateSetter);
//                               name != null
//                                   ? _peoples.add(name)
//                                   : print('Null value');
//                               print('Controller : $name');
//                               Description != null ? _descriptions.add(Description) : print('Null value');
//                             },
//                             child: new Icon(Icons.add),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             FlatButton(
//                               onPressed: () async {
//                                 _title.add(title.text);
//                                 _peoples.add(name);
//                                 _descriptions.add(Description);
//                                 print('Controller : $name, $Description');
//                                 total.add(_peoples.toString());
//                                 totaldescription.add(_descriptions.toString());
//                                 print('Total : ${total.toString()}');
//
//                                 await _firestore.collection('APC-VOTING').add({
//                                   'HEADING': title.text,
//                                   'PEOPLES': _peoples,
//                                   'DESCRIPTION' : _descriptions,
//                                 }).then((value) async {
//                                   for (var i in _peoples)
//                                     await _firestore
//                                         .collection('APC-VOTING')
//                                         .doc(value.id)
//                                         .update({
//                                       _peoples[_peoples.indexOf(i)]: 0,
//                                     });
//                                 });
//                                 _peoples.clear();
//                                 people.clear();
//                                 title.clear();
//                                 _descriptions.clear();
//                                 setState(() {
//                                   name = null;
//                                   Description =null;
//                                   result = false;
//                                 });
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('Submit'),
//                             ),
//                             FlatButton(
//                               onPressed: () {
//                                 // _peoples.clear();
//                                 // people.clear();
//                                 title.clear();
//
//                                 setState(() {
//                                   name = null;
//                                 });
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('Cancel'),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   );
//                 }),
//           );
//         });
//   }
//
//   Future updated(StateSetter updateState) {
//     updateState(() {
//       people.add(Expanded(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: new TextFormField(
//                 onChanged: (val) {
//                   setState(() {
//                     name = val;
//                   });
//                 },
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12.0)),
//                     hintText: '(${people.length + 1}) Candidate Name'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: new TextFormField(
//                 onChanged: (val) {
//                   setState(() {
//                     Description = val;
//                   });
//                 },
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12.0)),
//                     hintText: 'Description'),
//               ),
//             ),
//           ],
//         )
//       ));
//       setState(() {});
//     });
//   }
//
//   deleted(StateSetter updateState, index) {
//     updateState(() {
//       people.removeAt(index);
//     });
//   }
//   ChooseImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       _image.add(File((pickedFile?.path)));
//     });
//     if(pickedFile.path == null ) retrieveLostData();
//   }
//
//   Future <void> retrieveLostData() async {
//     final LostData response = await picker.getLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if ( response.file != null){
//       setState(() {
//         _image.add(File(response.file.path));
//       });
//     }
//     else
//       {
//         print(response.file);
//       }
//   }
//  }

import 'dart:html';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webapp/result.dart';
import 'package:webapp/user_management.dart';
import 'package:firebase/firebase.dart' as fb;
final _firestore = FirebaseFirestore.instance;
Uri uri;
class AdminPage1 extends StatefulWidget {
  @override
  _AdminPage1State createState() => _AdminPage1State();
}

class _AdminPage1State extends State<AdminPage1> {
  List<String> _peoples = List();
  List image = List();
  List<Widget> people = List();
  List<String> total = List();
  List<String> totaldescription = List();
  List<String> _title = List();
  List<String> _descriptions = List();
  List<Widget> description = List();
  bool result = true;
  var item;
  Uri uri;
  var descriptionItems;
  TextEditingController title = TextEditingController();
  String name;
  String descriptions;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () {
            onpressed();
          },
          child: Icon(Icons.add),
        ),
        body: result
            ? Center(
          child: FlatButton(
            color: Colors.pink,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(),
                ),
              );
            },
            child: Text('View Result'),
          ),
        )
            : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: _title.length,
            itemBuilder: (context, index) {
              print('Total : $item');
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFFDF5E6),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(_title[index],
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline6),
                      ),
                      for (var item in total[index]
                          .replaceAll('[', '')
                          .replaceAll(']', '')
                          .split(',')
                          .asMap()
                          .entries)
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${item.value}',
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .subtitle,
                                ),
                                Text(
                                  "  ${totaldescription[index].replaceAll(
                                      '[', '').replaceAll(']', '').replaceAll(
                                      ']', '').replaceAll(']', '').split(
                                      ',')[item.key]}",
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText2,
                                ),
                              ],
                            )),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  onpressed() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter stateSetter) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Enter Required data",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: title,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                hintText: 'Title'),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              Widget widget = people.elementAt(index);
                              return Row(
                                children: [
                                  widget,
                                  IconButton(
                                      icon: Icon(
                                        Icons.close,
                                      ),
                                      onPressed: () {
                                        deleted(stateSetter, index);
                                      }),
                                  IconButton(
                                    icon: Icon(Icons.image),
                                    onPressed: () {
                                      name == null? print('Null Name'):
                                     uploadToStorage(fileName: name);
                                    },
                                  )
                                ],
                              );
                            },
                            itemCount: people.length,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                            backgroundColor: Colors.pink,
                            onPressed: () {
                              updated(stateSetter);
                              name != null
                                  ? _peoples.add(name)
                                  : print('Null value');
                              print('Controller : $name');
                              descriptions != null
                                  ? _descriptions.add(descriptions)
                                  : print('Null value');
                              setState(() {
                                name = null;
                                print(image.length);
                              });
                            },
                            child: new Icon(Icons.add),
                          ),
                        ),
                        Row(
                          children: [
                            FlatButton(
                              onPressed: () async {
                                _title.add(title.text);
                                _peoples.add(name);
                                _descriptions.add(descriptions);
                                print('Controller : $name, $descriptions');
                                total.add(_peoples.toString());
                                totaldescription.add(_descriptions.toString());
                                print('Total : ${totaldescription.toString()}');

                                await _firestore.collection('APC-VOTING').add({
                                  'HEADING': title.text,
                                  'PEOPLES': _peoples,
                                  'DESCRIPTION': _descriptions,
                                  "images" : image,
                                }).then((value) async {
                                  for (var i in _peoples)
                                    await _firestore
                                        .collection('APC-VOTING')
                                        .doc(value.id)
                                        .update({
                                      _peoples[_peoples.indexOf(i)].toString(): 0,
                                    });
                                });
                                _peoples.clear();
                                people.clear();
                                title.clear();
                                _descriptions.clear();
                                image.clear();
                                setState(() {
                                  name = null;
                                  descriptions = null;
                                  result = false;
                                  print(image);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text('Submit'),
                            ),
                            FlatButton(
                              onPressed: () {
                                // _peoples.clear();
                                // people.clear();
                                title.clear();

                                setState(() {
                                  name = null;
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          );
        });
  }

  Future updated(StateSetter updateState) {
    updateState(() {
      people.add(Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      hintText: '(${people.length + 1}) Candidate Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onChanged: (val) {
                    setState(() {
                      descriptions = val;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      hintText: 'Description'),
                ),
              ),

            ],
          )));
      setState(() {});
    });
  }

  deleted(StateSetter updateState, index) {
    updateState(() {
      people.removeAt(index);
    });
  }


  void uploadImage({@required Function(File file) onSelected}) {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
        showDialog(
          context:context,
          builder: (BuildContext context) {
            return
            AlertDialog(content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularProgressIndicator(),
                  Text('Loading...')
                ]
            ),);

          }
        );
      });
    });
  }

  void uploadToStorage({fileName}) {
    final path = 'CandiDate/$fileName';
    uploadImage(onSelected: (file) {
      fb
          .storage()
          .refFromURL('gs://fir-app-54cb1.appspot.com/')
          .child(path)
          .put(file)
          .future
          .then((data) async {
        Uri uri = await data.ref.getDownloadURL();
        image.add(uri.toString());
        Navigator.pop(context);
      });
    });
  }
}

