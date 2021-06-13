import 'package:flutter/material.dart';
import '../components/bottom_sheet_box.dart';

class TaskBox extends StatefulWidget {
  String title;
  int id;
  Function? deleteTask;
  Function? updateTask;
  TaskBox({
    required this.title,
    required this.id,
    required this.deleteTask,
    required this.updateTask,
  });
  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: EdgeInsets.only(
          left: 15.0,
          top: 15.0,
          bottom: 15.0,
          right: 20.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color.fromRGBO(4, 26, 85, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color.fromRGBO(235, 7, 254, 1),
                  ),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: isChecked,
                      activeColor: Color.fromRGBO(235, 7, 254, 1),
                      onChanged: (val) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      shape: CircleBorder(),
                    ),
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.5,
                    fontSize: 16.0,
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 2.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 35.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    constraints: BoxConstraints(
                      maxHeight: 50.0,
                      maxWidth: 50.0,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (builder) {
                          return BottomSheetBox(
                            boxTitle: 'Edit Task',
                            id: widget.id,
                            addFunction: widget.updateTask,
                            editTitle: widget.title,
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.purple,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 35.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    constraints: BoxConstraints(
                      maxHeight: 35.0,
                      maxWidth: 35.0,
                    ),
                    onPressed: () {
                      // set up the buttons
                      Widget cancelButton = ElevatedButton(
                        child: Text("Cancel"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );
                      Widget continueButton = ElevatedButton(
                        child: Text("Delete Task"),
                        onPressed: () {
                          widget.deleteTask!(widget.id);
                          Navigator.pop(context);
                        },
                      );

                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: Text("Delete Task"),
                        content: Text(
                          "Would you like to delete the task?",
                        ),
                        actions: [
                          cancelButton,
                          continueButton,
                        ],
                      );

                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    icon: Icon(
                      Icons.restore_from_trash,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
