import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tust/_bloc.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: BlocProvider(
              create: (BuildContext context) => CounterBloc(),
            child: CounterScreen()
          ),
        )
    );
  }
}

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body:  BlocBuilder<CounterBloc, int>(
            builder: (BuildContext context, int state){
              return Center(child:
              Text("Counter Value : $state",),
              );
            },
          ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
    FloatingActionButton(
        child: Text("+"),
    onPressed: (){
    _counterBloc.add(CounterEvents.increment);
    },
    ),

    FloatingActionButton(
    child: Text("-"),
    onPressed: (){
    _counterBloc.add(CounterEvents.decrement);
    },
    ),
    ],
    ),

    );

  }
}

