import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
  ));
}
class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp> {
  final String title = "Exam organizer";
  List<Map<String, String>> elements = [
    {'name': 'Menadzment informaciski sistemi',
      'date' : '18.1.2022 16:00'},
    {'name': 'Mobilni informaciski sistemi',
      'date' : '17.1.2022 10:00'},
    {'name': 'Voved vo pametni gradovi',
      'date' : '19.1.2022 13:00'},
    {'name': 'Timski proekt',
      'date' : '21.1.2022 13:00'},
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void addItemToList(){
    setState(() {
      Map<String, String> map = {"name": nameController.text,
      "date":dateController.text};
      elements.add(map);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(onPressed: () {
              showDialog(context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20
                      ),
                      title: Row(
                        children: [
                          Text("Dodadi ispit"),
                          Spacer(),
                          IconButton(onPressed: () {Navigator.pop(context);},
                              icon: Icon(Icons.cancel))
                        ],
                      ),
                      children: [
                        Divider(height: 5,indent: 5),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Ime na predmet",
                          ),
                        ),
                        TextFormField(
                          controller: dateController,
                          decoration: InputDecoration(
                            hintText: "Datum i vreme",
                          ),
                        ),
                        Divider(height: 5,indent: 5),
                        Spacer(),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                            child: Text("Dodadi"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: (){
                              addItemToList();
                            },

                          ),
                        )
                      ],
                    );  });
            } ,
              icon: Icon(Icons.add, size: 35),
              padding: EdgeInsets.only(right: 40),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: elements.length,
                  itemBuilder: (context, index){
                    print(elements[index]);
                    return Card(
                      elevation: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColorDark,
                                width: 3,
                              ),
                            ),
                            child:Text(
                              elements[index].values.first,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColorDark,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            child: Text(
                              elements[index].values.elementAt(1),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
            )
          ],
        )

    );
  }

}