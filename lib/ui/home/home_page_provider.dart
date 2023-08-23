import 'package:flutter/material.dart';
import 'package:task_manager/models/todo_model.dart';
import 'package:task_manager/services/api_service.dart';

class HomeProvider extends ChangeNotifier{
  List<ModelTask> tasks = [];
  TextEditingController newTask= TextEditingController();

  HomeProvider(BuildContext context) {
    getTasks();
  }


  Future<void> getTasks() async {
    tasks= await ApiService().fetchTasks();
    notifyListeners();
  }

  changeState(bool isComplete,int index){
    tasks[index].completed=isComplete;
    notifyListeners();
  }

  deleteTask(int id){
    tasks.removeAt(id);
    notifyListeners();
  }

  addTask(ModelTask modelTask){
    //tasks.add(modelTask);
    tasks.insert(0,modelTask);
    notifyListeners();
  }

  Future<void> showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Task!'),
          content: TextField(
            controller: newTask,
            textAlign: TextAlign.start,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
                hintText: "todo?",
                hintStyle: TextStyle(fontSize: 14),
                alignLabelWithHint: true,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black),
                ),
                labelStyle: TextStyle(fontSize: 16)),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                ModelTask model=ModelTask(userId: 1, id: 1, title: newTask.text, completed: false);
                addTask(model);
                newTask.text="";
                notifyListeners();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}