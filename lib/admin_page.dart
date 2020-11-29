import 'package:flutter/material.dart';
List<String> peoples;
class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}



class AddTask extends StatefulWidget {
  final Function AddtaskCallBack;
  AddTask(this.AddtaskCallBack);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    String newTaskTile;
    String newTaskTile2;
    return Container(
      color: Colors.black,
      child: Container(height: 500,
        padding: EdgeInsets.only(left: 30,right: 30,bottom: 30,top: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.pink),
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              autofocus: true,
              textAlign: TextAlign.center,decoration: InputDecoration(hintText: 'ENTER HEADING'),
              onChanged: (newText) {
                newTaskTile = newText;
              },
            ),

            SizedBox(height: 5,),
            FlatButton(
              onPressed: () {
                widget.AddtaskCallBack(newTaskTile);
                Navigator.pop(context);
              },
              color: Colors.pink,
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 5,),
            FloatingActionButton(
              backgroundColor: Colors.pink,
              child: Icon(Icons.add,color: Colors.white,size: 25,),
              onPressed: (){
                AddPeople((newTaskTile2){
                  peoples.add('$newTaskTile2');
                });
              },
            )
          ],
        ),
      ),
    );
  }
}



class AddPeople extends StatelessWidget {
  final Function AddpeopleCallBack;
  AddPeople(this.AddpeopleCallBack);
  @override
  Widget build(BuildContext context) {
    String newTaskTile;
    return Container(
      color: Colors.black,
      child: Container(height: 500,
        padding: EdgeInsets.only(left: 30,right: 30,bottom: 30,top: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: TextField(
          style: TextStyle(color: Colors.black),
          autofocus: true,
          textAlign: TextAlign.center,decoration: InputDecoration(hintText: 'ENTER People'),
          onChanged: (newText) {
            newTaskTile = newText;
            AddpeopleCallBack(newTaskTile);
          },
        ),
      ),
    );
  }
}

class _AdminPageState extends State<AdminPage> {
  List<String> heading;

  @override
  void initState() {
    super.initState();
    heading = List();

  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTask((newTasktile) {
                setState(() {
                  heading.add("$newTasktile");
                  print(newTasktile);
                });
              },));
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Admin Area'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: list(),
        ),
      ),
    );
  }
  Widget list() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(20.0),
      itemCount: heading.length,
      itemBuilder: (BuildContext context, int index) {
        return row(context, index);
      },
    );
  }

  Widget row(context, index){
    return  SizedBox(height: 300,width: 100,
      child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
      color: Color(0xFFFDF5E6)),
        child: ListTile(
          title: Text(' ${heading[index]}',style:TextStyle(color: Colors.black) ,),
          
        ),
      ),
    );}
}




