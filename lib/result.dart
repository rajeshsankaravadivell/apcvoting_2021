// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'thankyou.dart';
//
// class Result extends StatefulWidget {
//   @override
//   _ResultState createState() => _ResultState();
// }
//
// class _ResultState extends State<Result> {
//   PageController controller = PageController(viewportFraction: 0.7);
//   int pageindex = 0;
//   int stepCounter = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: StreamBuilder(
//           stream:
//           FirebaseFirestore.instance.collection('APC-VOTING').snapshots(),
//           builder: (context, snapshot){
//             if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.7,
//                     child: Center(
//                       child: PageView(
//                         scrollDirection: Axis.horizontal,
//                         controller: controller,
//                         physics: NeverScrollableScrollPhysics(),
//                         onPageChanged: (int index) {
//                           setState(() {
//                             pageindex = index;
//                           });
//                         },
//                         children: [
//                       for (var j in snapshot.data.docs.get('PEOPLES'))
//                         Container(
//                           height: MediaQuery.of(context).size.height * 0.7,
//                           child: Card(
//                             shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(10.0))),
//                             clipBehavior: Clip.antiAlias,
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   Center(
//                                     child: Text(
//                                       snapshot.data.docs[j.key]
//                                           .get('HEADING'),
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headline,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: FlatButton(
//                               color: Colors.white,
//                               child: Center(child: Text('Back')),
//                               onPressed: () {
//                                 controller.previousPage(
//                                     duration: Duration(milliseconds: 1000),
//                                     curve: Curves.easeOutQuad);
//                               })),
//                       pageindex + 1 == snapshot.data.docs.length ? FlatButton(
//                         color: Colors.pink,
//                         child: Center(
//                             child: Text(
//                               'Submit',
//                               style: TextStyle(color: Colors.white),
//                             )),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ThankyouPage()));
//                         },
//                       ) :  FlatButton(
//                         color: Colors.pink,
//                         child: Center(
//                             child: Text(
//                               'Next',
//                               style: TextStyle(color: Colors.white),
//                             )),
//                         onPressed: () {
//                           controller.nextPage(
//                               duration: Duration(milliseconds: 1000),
//                               curve: Curves.easeOutQuad);
//                         },
//                       ),
//                     ],
//                   )
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webapp/admin_page.dart';
import 'thankyou.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  PageController controller = PageController(viewportFraction: 0.7);
  int pageindex = 0;
  int stepCounter = 0;
  bool result = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('APC-VOTING').orderBy('Index')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    //     return Center(
                    //   child: Text(
                    //   ' No Voting question available',
                    //       style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 50,
                    //   ),
                    // ))
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
                                for (var j
                                    in snapshot.data.docs.asMap().entries)
                                  // for (MapEntry j in snapshot.data.docs.get('PEOPLES').asMap().entries)
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
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
                                                    .headline5,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            DataTable(
                                              columns: [
                                                DataColumn(
                                                  label: Text(
                                                    'Name',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6,
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Expanded(
                                                    child: Text(
                                                      'Vote Count',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              rows: [
                                                for (var i in snapshot
                                                    .data.docs[j.key]
                                                    .get('PEOPLES'))
                                                  DataRow(cells: [
                                                    DataCell(
                                                      Text(
                                                        i,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        snapshot
                                                            .data.docs[j.key]
                                                            .get(i)
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ]),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
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
                                      controller.previousPage(
                                          duration:
                                              Duration(milliseconds: 1000),
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminPage1()));
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
                                          duration:
                                              Duration(milliseconds: 1000),
                                          curve: Curves.easeOutQuad);
                                    },
                                  ),
                          ],
                        )
                      ],
                    );
                  }
                },
              )
      ),
    );
  }
}
