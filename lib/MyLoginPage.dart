import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);
  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<bool> logInApi(String paramEmail, String paramPassword) async {
    final prefs = await SharedPreferences.getInstance();
    var email = await prefs.getString('email');
    var password = await prefs.getString('password');

    return paramEmail == email && paramPassword == password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 27),
                const Text(
                  "Please Log into your existing account",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                const SizedBox(height: 24),
                Container(
                  alignment: Alignment.center,
                  width: 335,
                  height: 58,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Your email',
                      hintStyle: TextStyle(color: Colors.white),
                      // fontSize: 16,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  alignment: Alignment.center,
                  width: 335,
                  height: 58,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Your Password',
                      hintStyle: TextStyle(color: Colors.white),
                      // fontSize: 16,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: 335,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // final email = await _getEmail();
                        // final password = await _getPassword();

                        String? email = _emailController.text;
                        String? password = _passwordController.text;
                        print(email);
                        print(password);
                        logInApi(email, password)
                            .then((value) => {
                                  print("hello success"),
                                  if (value)
                                    {Navigator.pushNamed(context, '/dash')}
                                  else
                                    {
                                      Fluttertoast.showToast(
                                          msg: "In correct credentials",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0)
                                    }
                                })
                            .catchError((error) => {print(error)});
                      }
                    },
                    child: Text('Login'),
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 20)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 106, 214, 110)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                  ),
                ),
                const SizedBox(height: 5),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      "create an account",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
