import 'package:flutter/material.dart';
import './components/task_box.dart';
import './components/bottom_sheet_box.dart';
import './class/task.dart';

void main() {
  runApp(const MyApp());
}

TasksList tasks = TasksList();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(52, 80, 161, 1),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addTask(String title) {
    setState(() {
      tasks.addTask(title);
    });
  }

  void deleteTask(int id) {
    setState(() {
      tasks.deleteTask(id);
    });
  }

  void updateTask(id, title) {
    setState(() {
      tasks.updateTask(id, title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        leading: Icon(Icons.menu),
        elevation: 0.0,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'What\'s up, Olivia!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Tasks'.toUpperCase(),
              style: TextStyle(
                color: Color.fromRGBO(137, 166, 242, 1),
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.tasksList.length,
                itemBuilder: (context, index) {
                  var task = tasks.tasksList[index];
                  return TaskBox(
                    title: task.title,
                    id: task.id,
                    deleteTask: deleteTask,
                    updateTask: updateTask,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(235, 7, 254, 1),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (builder) {
              return BottomSheetBox(
                boxTitle: 'Add Task',
                addFunction: addTask,
              );
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
