import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saccos/utils/dataConfig.dart';
// import 'package:saccos_android/utils/dataConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../utils/validator.dart';



class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginpageState();


}

class _LoginpageState extends State<LoginPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  static final Future<SharedPreferences> prf = SharedPreferences.getInstance();
  bool isLogin = false;

  @override
  void initState(){
    isLogin = false;
    super.initState();
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
        home:Sizer(
        builder: (context, orientation, deviceType){
            return Scaffold(
                resizeToAvoidBottomInset: true,
                body:  SingleChildScrollView(
                  child: SizedBox(
                    width:screenWidth ,
                    height:screenHeight ,
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                   padding: const EdgeInsets.fromLTRB(20,100, 20,20),
                    child:  Image.asset('assets/logos/saccosapp.png',),
                ),
                Form(
                    key: _formKey,
                    child:
                    Expanded(
                      flex: 1,
                      child:Column(
                        children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: TextFormField(
                               controller: _username,
                               validator: (value) =>
                                   Validator.validateName(
                                       name: _username.text.trim()),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Username',
                                ),
                              ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: TextFormField(
                               controller: _pass,
                               validator: (value) =>
                                   Validator.validatePassword(
                                       password: _pass.text.trim()),
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Password',
                                ),
                              ),
                           ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50),
                                  ),
                                  child: isLogin ? const CircularProgressIndicator(
                                    strokeWidth: 3,
                                    backgroundColor: Colors.white,
                                  ) : const Text('Log In'),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isLogin = true;
                                      });
                                      Authentication.authenticateUser(
                                          context: context,
                                          username: _username.text,
                                          password: _pass.text
                                      );
                                      SharedPreferences pref = await prf;
                                      String message = pref.getString("success_response").toString();
                                      print(message);
                                      if(message == "user-loggedin" && message.isNotEmpty){
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("User Logged Successfuly")));
                                        Future.delayed(const Duration(seconds: 5), () {
                                          Navigator.pop(context);
                                        }).then((value) => {
                                          Navigator.of(context, rootNavigator: true).pushNamed(
                                              '/home')
                                        });
                                      }else{
                                        String message = pref.getString("error").toString();
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message)));
                                      }
                                    }
                                  },
                              ),
                            ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pushNamed("/fpass");
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pushNamed("/register");
                            },
                            child: Text(
                              'Register an Account',
                              style: TextStyle(color: Colors.grey[600]),
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                )
              )
            );
          }
        )
    );

  }
}