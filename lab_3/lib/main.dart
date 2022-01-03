import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exams Organizer',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home:  MyHomePage(title: 'Exams Organizer',
          elements : [
            {'name': 'Menadzment informaciski sistemi',
              'date' : '18.1.2022 16:00'},
            {'name': 'Mobilni informaciski sistemi',
              'date' : '17.1.2022 10:00'},
            {'name': 'Voved vo pametni gradovi',
              'date' : '19.1.2022 13:00'},
            {'name': 'Timski proekt',
              'date' : '21.1.2022 13:00'},
          ]),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({required this.title,required this.elements});

  final String title;
  List<Map<String, String>> elements;
  @override
  Widget build(BuildContext context) {
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
                    decoration: InputDecoration(
                      hintText: "Ime na predmet",
                    ),
                  ),
                  TextFormField(
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
                      onPressed: (){},

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
     /* floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("FloatingActionTap"),
      ),*/
      body: ListView.builder(
        itemCount: elements.length,
        itemBuilder: (contx, index){
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
                    color: Theme.of(contx).primaryColorDark,
                    width: 3,
                  ),
                ),
                child:Text(
                  elements[index].values.first,
                  style: TextStyle(
                    fontSize: 20,
                      color: Theme.of(contx).primaryColorDark,
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

    );
  }

}
