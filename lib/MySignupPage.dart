import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MySignupPage extends StatefulWidget {
  const MySignupPage({Key? key}) : super(key: key);
  // final url;
  // final title;

  @override
  State<MySignupPage> createState() => _MySignupPageState();
}

class _MySignupPageState extends State<MySignupPage> {
  // final _text = TextEditingController();
  // bool _validate = false;
  bool isChecked = false;
  // bool errorMessage = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> saveUserData(String email, String password, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  void onSigninPressed() {
    // if (_formKey.currentState!.validate()) {
    //   print("validated");
    // } else {
    //   print("Not Validated");
    // }
  }
  String? _validatePasswordMatch(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void printMesaage() {
    print('user accepted the agreement');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        // width: 500,
        // color: Color.fromARGB(255, 7, 5, 119),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              const Text(
                'Create an account',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 24.0),
              Container(
                alignment: Alignment.center,
                width: 345,
                height: 63,
                // color: Colors.white,
                child: TextFormField(
                  controller: _nameController,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 235, 226, 229)),
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    // errorText: _validate ? 'can not be empty' : null,
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Can not be empty';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 17.0),
              Container(
                alignment: Alignment.center,
                width: 345,
                height: 63,
                // color: Colors.white,
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 235, 226, 229)),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    // errorText: _validate ? 'can not be empty' : null,
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Can not be empty';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 17.0),
              Container(
                alignment: Alignment.center,
                width: 345,
                height: 63,
                child: TextFormField(
                  controller: _passwordController,
                  style:
                      const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Can not be empty';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 17.0),
              Container(
                alignment: Alignment.center,
                width: 345,
                height: 63,
                child: TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  validator: _validatePasswordMatch,
                  style:
                      const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    // errorText: _validate ? 'can not be empty' : null,
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  // validator: (String? value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Can not be empty';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              const SizedBox(height: 27.0),
              const Text(
                'Terms & conditions',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        focusColor: Colors.lightBlue,
                        activeColor: Colors.orange,
                        value: isChecked,
                        onChanged: (newValue) {
                          setState(() => isChecked = newValue!);
                        }),
                    // Expanded(
                    //   child: WebView(
                    //     key: _webkey,
                    //     javascriptMode: JavascriptMode.unrestricted,
                    //     initialUrl: _url,
                    //   ),
                    // ),
                    const Text(
                      'I have read the agreement and i accept it',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      selectionColor: Colors.white,
                    )
                  ],
                ),
                //     errorMessage ?
                //     Container(
                //   decoration: BoxDecoration(
                //     color: Colors.red,
                //     borderRadius: BorderRadius.circular(80.0)
                //   ),
                //   child: Padding(
                //     padding: EdgeInsets.all(10.0),
                //     child: Text('Please accept the terms and conditions to proceed...')
                //   )
                // )
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    if (isChecked != true) {
                      setState(() => true);
                    } else {
                      setState(() {
                        print("accepted");
                      });
                    }
                    // await saveUserData(email, password, name);
                    // if (_acceptTerms == true) {
                    Navigator.pushReplacementNamed(context, '/login');
                    // } else {}
                    // Then navigate to the login screen
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(345, 63),
                    backgroundColor: Color.fromARGB(255, 96, 236, 101),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    "Already have an account",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// class Checkbox extends StatefulWidget {
//   const Checkbox(
//       {super.key,
//       required Null Function(bool? value) onChanged,
//       required Color checkColor,
//       required bool value,
//       required MaterialStateProperty<Color> fillColor,
//       required MaterialColor activeColor});

//   @override
//   State<Checkbox> createState() => _CheckboxState();
// }

// class _CheckboxState extends State<Checkbox> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     Color getColor(Set<MaterialState> states) {
//       const Set<MaterialState> interactiveStates = <MaterialState>{
//         MaterialState.pressed,
//         MaterialState.hovered,
//         MaterialState.focused,
//       };
//       if (states.any(interactiveStates.contains)) {
//         return Colors.blue;
//       }
//       return Colors.red;
//     }

//     return Checkbox(
//       checkColor: Colors.white,
//       fillColor: MaterialStateProperty.resolveWith(getColor),
//       value: isChecked,
//       onChanged: (bool? value) {
//         setState(() {
//           isChecked = value!;
//         });
//       },
//     );
//   }
// }
