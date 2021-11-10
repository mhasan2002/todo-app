import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  bool IsComplete = false;
  TextEditingController todoTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All todos",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(index.toString()),
                  background: Container(
                    child: Icon(Icons.delete),
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 20),
                  ),
                  onDismissed: (direction) {},
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        IsComplete = !IsComplete;
                      });
                    },
                    leading: Container(
                      padding: EdgeInsets.all(2),
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle),
                      child: IsComplete
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : Container(),
                    ),
                    title: Text(
                      "title",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                );
              },
              itemCount: 5,
            )
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
                  title: Row(
                    children: [
                      Text(
                        "Add Todo",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  ),
                  children: [
                    Divider(),
                    TextFormField(
                      controller: todoTitleController,
                      style: TextStyle(
                          fontSize: 16, height: 1.5, color: Colors.white),
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Enter To Do ",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            if (todoTitleController.text.isNotEmpty) {
                              Navigator.pop(context);
                            }
                          },
                          child: Text("Add"),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.pink)),
                        ))
                  ],
                );
              });
        },
      ),
    );
  }
}
