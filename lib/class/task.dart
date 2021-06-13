class Task {
  int id;
  String title;
  Task(this.id, this.title);
  void changeTitle(String text) {
    this.title = text;
  }
}

class TasksList {
  List _tasksList = [
    Task(1, 'Daily meeting with team'),
    Task(2, 'Coding in Dart'),
  ];

  get tasksList {
    return _tasksList;
  }

  void addTask(String title) {
    int newId = 0;
    if (_tasksList.length == 0) {
      newId = 1;
    } else {
      newId = _tasksList[_tasksList.length - 1].id + 1;
    }
    _tasksList.add(Task(newId, title));
  }

  void deleteTask(int id) {
    for (int i = 0; i < _tasksList.length; i++) {
      if (id == _tasksList[i].id) {
        _tasksList.removeWhere((task) => task.id == id);
      }
    }
  }

  void updateTask(int id, String title) {
    for (int i = 0; i < _tasksList.length; i++) {
      if (id == _tasksList[i].id) {
        _tasksList[i].changeTitle(title);
      }
    }
  }
}
