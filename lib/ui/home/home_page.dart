import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(context),
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text("Task Manager"),
              backgroundColor: Colors.black,
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(w * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.75,
                    width: w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3.0)),
                    child: provider.tasks.isNotEmpty
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                value: provider.tasks[index].completed,
                                onChanged: (value) {
                                  provider.changeState(value!, index);
                                },
                                activeColor: Colors.black,
                                title: Text(
                                    provider.tasks[index].title.toUpperCase()),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                secondary: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      provider.deleteTask(index);
                                    },
                                    color: Colors.red),
                              );
                            },
                            scrollDirection: Axis.vertical,
                            itemCount: provider.tasks.length,
                          )
                        : Text(
                            "Connect to the internet or \n Add Task manually!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: w * 0.05,
                            ),
                      textAlign: TextAlign.center,
                          ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                provider.showAlertDialog(context);
              },
              backgroundColor: Colors.black,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
