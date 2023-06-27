import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/blocs/internet_bloc/internet_bloc.dart';
import 'package:login/blocs/internet_bloc/internet_event.dart';
import 'package:login/blocs/internet_bloc/internet_state.dart';

class BlacArchitecture extends StatefulWidget {
  const BlacArchitecture({Key? key}) : super(key: key);
  @override
  State<BlacArchitecture> createState() => _BlacArchitecture();
}

class _BlacArchitecture extends State<BlacArchitecture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Internet connected!"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet not connected!"),
              ));
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return Text("Connected");
            } else if (state is InternetLostState) {
              return Text("Not connected");
            } else {
              return Text("Loading...");
            }
          },
        ),
      )),
    );
  }
}
