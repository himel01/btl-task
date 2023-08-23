import 'package:http/http.dart' as http;
import 'package:task_manager/models/todo_model.dart';


class ApiService {
  final String tasksApi = "https://jsonplaceholder.typicode.com/todos";


  Future<List<ModelTask>> fetchTasks() async {
    var response;
    try{
      response = await http.get(
        Uri.parse(tasksApi),
      );

    }catch(e){
      print(e);
    }
    if (response!=null && response.statusCode == 200) {
      return taskModelFromJson(response.body);
    } else {
      return [];
    }

  }


}
