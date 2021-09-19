import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:webapp/submitpage.dart';
import 'package:webapp/thankyou.dart';
import 'login_page.dart';
String people;
List<String> _peoples = List();
List _docid =[];
var docid;
final _firestore = FirebaseFirestore.instance;
dynamic snapshot;

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool ischecked = false;
  int pageindex = 0;
  int stepCounter = 0;
  int index;
  String check = "false";
  PageController controller = PageController(viewportFraction: 0.7);
  @override
  Widget build(BuildContext selectedDoc) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('APC-VOTING').orderBy("Index").snapshots(),
          builder: (context, snapshot) {

            if (!snapshot.hasData) {
              print(snapshot.error);
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: controller,
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (int index) {
                          setState(() {
                            pageindex = index;
                          });
                        },
                        children: [
                          for (MapEntry j in snapshot.data.docs.asMap().entries)
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                clipBehavior: Clip.antiAlias,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          snapshot.data.docs[j.key]
                                              .get('HEADING'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      RadioGroup(snapshot, j),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                              color: Colors.white,
                              child: Center(child: Text('Back')),
                              onPressed: () {
                                _peoples.clear();
                                controller.previousPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.easeOutQuad);
                              })),
                      pageindex + 1 == snapshot.data.docs.length
                          ? FlatButton(
                              color: Colors.pink,
                              child: Center(
                                  child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              )),
                              onPressed: () {
                               if(_peoples.contains(null)) {
                                 print('select any');
                               }else{
                                 displayDialog(context);
                                 setState(() {
                                   _peoples.add(people);
                                   print(_peoples);
                                   _docid.add(docid);
                                   print(_docid);
                                 });

                               }

                              },
                            )
                          : FlatButton(
                              color: Colors.pink,
                              child: Center(
                                  child: Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              )),
                              onPressed: () {




                                controller.nextPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.easeOutQuad);
                                setState(() {
                                  _peoples.add(people);
                                  print(_peoples);
                                  _docid.add(docid);
                                  print(_docid);
                                  people = null;
                                });
                              },
                            ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

}

class RadioGroup extends StatefulWidget {
  final snapshot, j;
  RadioGroup(this.snapshot, this.j);
  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {

  List disabled = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadioButtonGroup(
          orientation: GroupedButtonsOrientation.VERTICAL,
          labels: widget.snapshot.data.docs[widget.j.key].get('PEOPLES'),
          picked: people,
          itemBuilder: (Radio rb, Text txt, int i) {
            return SizedBox(
              width: 420,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${i +1 } )'),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      CircleAvatar(backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage("${widget.snapshot.data.docs[widget.j.key]
                            .get('images')[i] }"),radius: 50,
                      ),
                      SizedBox(width: MediaQuery.of(context).size
                        .width*0.25,
                      child:Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          txt,
                          Text(widget.snapshot.data.docs[widget.j.key]
                              .get('DESCRIPTION')[i],textAlign: TextAlign.center,),
                          rb

                        ],
                      )
                      ),

                    ],
                  ),
                  Divider(),
                ],
              ),
            );
          },
          onSelected: (String selected) {
            setState(() {
              people = selected;
              disabled = widget.snapshot.data.docs[widget.j.key].get('PEOPLES');
              // FirebaseFirestore.instance
              //      .collection('APC-VOTING')
              //      .doc(widget.snapshot.data.docs[widget.j.key].id)
              //      .update({
              //  people: FieldValue.increment(1),
              //  });
              docid =   widget.snapshot.data.docs[widget.j.key].id;
              print(docid);

            });



          }





          ),
    );
  }
}
// class alertDialog extends StatefulWidget {
//   @override
//   _alertDialogState createState() => _alertDialogState();
// }
//
// class _alertDialogState extends State<alertDialog> {
//
//   displayDialog(BuildContext context) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Are you Sure ??'),
//             content: Container(
//               width: double.maxFinite,
//               height: 300.0,
//               child: ListView(
//                 padding: EdgeInsets.all(8.0),
//                 //map List of our data to the ListView
//                 children: _peoples.map((data) => Text(data)?? null).toList(),
//               ),
//             ),
//             actions: <Widget>[
//               FlatButton(
//                 child: new Text('Submit'),
//                 onPressed: () async{
//                 setState(() {
//                   for( var j in _docid)
//
//                     _firestore.collection('APC-VOTING').doc(j).update({
//                       people : FieldValue.increment(1),
//                     });
//                 });
//
//                   await _firestore
//                       .collection('mycollection')
//                       .doc(DocId)
//                       .update({
//                     'login_check' : 'true',
//                   });
//                   print(_peoples);
//                   print(DocId);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ThankyouPage()));
//                 },
//               ),
//               new FlatButton(
//                 child: new Text('CANCEL'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               )
//             ],
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ListView in AlertDialog'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text('Show Alert Dialog'),
//           color: Colors.red,
//           onPressed: () => displayDialog(context),
//         ),
//       ),
//     );
//   }
// }



displayDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you Sure ??'),
          content: Container(
            width: double.maxFinite,
            height: 300.0,
            child: ListView(
              padding: EdgeInsets.all(8.0),
              //map List of our data to the ListView
              children: _peoples.map((data) => Text(data)?? null).toList(),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: new Text('Submit'),
              onPressed: () async{
                for( var j in _docid.asMap().entries)

                  _firestore.collection('APC-VOTING').doc(j.value).update({
                    _peoples[j.key] : FieldValue.increment(1),
                  });

                await _firestore
                    .collection('mycollection')
                    .doc(DocId)
                    .update({
                  'login_check' : 'true',
                });
                print(_peoples);
                print(DocId);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThankyouPage()));
              },
            ),
            new FlatButton(
              child: new Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
