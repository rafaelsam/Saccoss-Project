import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/validator.dart';



class ForgotPasswordPage extends StatefulWidget{
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _LoginpageState();


}

class _LoginpageState extends State<ForgotPasswordPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  bool isForgotPassword = false;

  @override
  void initState(){
    isForgotPassword = false;
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
                              child:  Image.asset("assets/images/saccoss.webp",),
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
                                          controller: _email,
                                          validator: (value) =>
                                              Validator.validateEmail(
                                                  email: _email.text.trim()),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            labelText: 'Email',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: const Size.fromHeight(50),
                                          ),
                                          child: isForgotPassword ? const CircularProgressIndicator(
                                            strokeWidth: 3,
                                            backgroundColor: Colors.white,
                                          ) : const Text('Send Password Request'),
                                          onPressed: () async {
                                            if (_formKey.currentState!.validate()) {

                                              setState(() {
                                                isForgotPassword = true;
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context, rootNavigator: true).pushNamed("/");
                                        },
                                        child: Text(
                                          'Back to Login Page',
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