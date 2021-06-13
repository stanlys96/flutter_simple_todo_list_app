import 'package:flutter/material.dart';

class BottomSheetBox extends StatelessWidget {
  String? title;
  Function? addFunction;
  String boxTitle;
  int? id;
  BottomSheetBox({
    required this.boxTitle,
    required this.addFunction,
    this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 250.0,
        color: Color(0xFF737373),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                boxTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueAccent,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Task',
                  ),
                  onChanged: (val) {
                    title = val;
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    id == null ? addFunction!(title) : addFunction!(id, title);
                    Navigator.pop(context);
                  },
                  child: Text('Submit'),
                ),
              ),
              ButtonTheme(
                minWidth: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
