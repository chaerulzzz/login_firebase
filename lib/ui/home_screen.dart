import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/authentication/authentication.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String _setLocale() {
  initializeDateFormatting("in_ID");
  return DateFormat("EEEE d MMMM yyyy", "in_ID").format(DateTime.now());
}

class HomeScreen extends StatelessWidget {  
  final String name;
  final String formattedDate = _setLocale();
  HomeScreen({Key key, @required this.name}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () { 
            BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedOut()); 
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: Text('Selamat Datang $name !\n $formattedDate', textAlign: TextAlign.center, ),)
        ],
      ),
    );
  }
}