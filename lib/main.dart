import 'package:flutter/material.dart';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream_Lipiya',
      theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      home: const StreamHomePage(),
    );
  }
}
       
class StreamHomePage extends StatefulWidget{
  const StreamHomePage({super.key});
  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
  
}

class _StreamHomePageState extends State<StreamHomePage> {
    Color bgColor = Colors.blueGrey;
    late ColorStream colorStream;

  void changeColor() async {
   // await for (var eventColor in colorStream.getColors()) {
//setState(() {
    //      bgColor = eventColor;
      //  });
  //   }
  colorStream.getColors().listen((eventColor){
  setState (() {
    bgColor = eventColor;
  });
   });

    @override
    void initState(){
      super.initState();
      colorStream = ColorStream();
      changeColor();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text('Stream'),
  ),
  body: Container (decoration: BoxDecoration(color: bgColor),
  ));
  

  }
  }