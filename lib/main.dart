
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Лабораторная работа №3",
      home: Scaffold(
        
        appBar: AppBar(
          title: Text('Егоров Евгений Александрович - Вариант №9'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}


final GlobalKey formKey = GlobalKey();

class MyHomePage extends StatelessWidget {
  
  MyHomePage({super.key});
  final formKey = GlobalKey<FormState>();
  final field1 = TextEditingController();
  final field2 = TextEditingController();
  final field3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const Text(
                  
                  "Начальная скорость:",
                  style: TextStyle(fontSize: 16.0),

                ),
                
                TextFormField(
                  controller: field1,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Введите значение.";
                  }
                  return null;
                }),
                SizedBox(height: 40.0),
//---------------------------------------------------------------
                const Text(
                  "Конечная скорость:",
                  style: TextStyle(fontSize: 16.0),
                ),
                TextFormField(
                  controller: field2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Введите значение.";
                  }
                  return null;
                }),
                SizedBox(height: 40.0),
//------------------------------------------------------------------
                const Text(
                  "Время",
                  style: TextStyle(fontSize: 16.0),
                ),
                TextFormField(
                  controller: field3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Введите значение.";
                  }
                 return null;
                }),

//------------------------------------------------------------------
                const SizedBox(height: 10.0,),
                ElevatedButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) => SecondScreen(field1: field1.text, field2: field2.text, field3: field3.text)));
                    }
                  },
                child: const Text('Отправить')
                ),
              ],
            ),
          ),
      );
  }
}

class SecondScreen extends StatelessWidget{
  final String field1;
   final String field2;
    final String field3;
    
  SecondScreen({required this.field1, required this.field2, required this.field3, super.key});
  @override
  Widget build(BuildContext context) {
    var f1 = int.parse(field1);
    var f2 = int.parse(field2);
    var f3 = int.parse(field3);
    var a = (f2 - f1) / f3;
    return Scaffold(
      appBar: AppBar(title: Text('Егоров Евгений Александрович - Вариант №9'),
      ),
      body: Center(
        
        child: Column(
          children: [
            
            Text("Начальная скорость: "+field1),
            Text("Конечная скорость: "+field2),
            Text("Время: "+field3),
            Text("Ускорение: "+a.toString()),
          ],
        ),    
      ),
    );
  }
}