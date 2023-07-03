import 'dart:convert';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saccos/utils/dataConfig.dart';
// import 'package:saccos_android/utils/dataConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../utils/validator.dart';
import '../userData.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<RegisterPage> {
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmpass = TextEditingController();
  final _rformKey = GlobalKey<FormState>();
  bool isRegister = false;

  @override
  void initState() {
    isRegister = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailAddress.dispose();
    _username.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _pass.dispose();
    _confirmpass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Sizer(builder: (context, orientation, deviceType) {
          return Scaffold(
            body: SingleChildScrollView(
                child: SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Image.asset("assets/images/saccoss.webp",),
                  ),
                  Form(
                      key: _rformKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _emailAddress,
                              validator: (value) => Validator.validateEmail(
                                  email: _emailAddress.text.trim()),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _username,
                              validator: (value) => Validator.validateName(
                                  name: _username.text.trim()),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Username',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _firstName,
                              validator: (value) => Validator.validateName(
                                  name: _firstName.text.trim()),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'First Name',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _lastName,
                              validator: (value) => Validator.validateName(
                                  name: _firstName.text.trim()),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Last Name',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _pass,
                              validator: (value) => Validator.validatePassword(
                                  password: _pass.text.trim()),
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _confirmpass,
                              validator: (value) =>
                                  Validator.validateConfirmPassword(
                                      cpassword: _confirmpass.text.trim(),
                                      fpassword: _pass.text.toString()),
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Confirm Password',
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                child: isRegister
                                    ? const CircularProgressIndicator(
                                        strokeWidth: 3,
                                        backgroundColor: Colors.white,
                                      )
                                    : const Text('Register'),
                                onPressed: () async {
                                  if (_rformKey.currentState!.validate()) {
                                    setState(() {
                                      isRegister = true;
                                    });
                                    Authentication.registerNewUser(
                                      context: context,
                                      username: _username.text,
                                      password: _pass.text,
                                      password2: _confirmpass.text,
                                      email: _emailAddress.text,
                                      first_name: _firstName.text,
                                      last_name: _lastName.text,
                                    );
                                    Future.delayed(const Duration(seconds: 5), () {
                                      setState(() {});
                                    }).then((value) => {
                                      Navigator.of(context,rootNavigator: true).pushNamed('/')
                                    });
                                  }
                                },
                              )),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed("/");
                            },
                            child: Text(
                              'Back to Login Page',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            )),
          );
        }));
  }
}
