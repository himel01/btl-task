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
            appBar: AppBar(
              title: Text("Task Manager"),
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
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          value: true,
                          onChanged: (value) {},
                          activeColor: Colors.black,
                          title: Text("get car"),
                          controlAffinity: ListTileControlAffinity.leading,
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          secondary: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {},
                              color: Colors.red),
                        );
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: 20,
                    ),
                  ),

                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.add),
              backgroundColor: Colors.black,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
