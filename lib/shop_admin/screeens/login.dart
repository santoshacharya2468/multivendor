import 'package:checkshopsonline/shop_admin/bloc/auth_bloc.dart';
import 'package:checkshopsonline/shop_admin/models/user.dart';
import 'package:checkshopsonline/shop_admin/widgets/appbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../conf.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  bool isProcessing = false;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>AuthBloc(),
          child: Scaffold(
        appBar: buildAppBarAccount(context,login: true),
        body: Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(hintText: "Email"),
                                  maxLength: 250,
                                  validator: (email) {
                                    if (email.isEmpty) {
                                      return "Email is required";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "Password",
                                      border: UnderlineInputBorder()),
                                  maxLength: 14,
                                  validator: (password) {
                                    if (password.isEmpty) {
                                      return "Password is required";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Container(
                                      height: 45.0,
                                      child: Builder(
                                        builder: (context) {
                                          return RaisedButton(
                                            color: Theme.of(context).primaryColor,
                                            onPressed: isProcessing
                                                ? null
                                                : () async {
                                                    if (formKey.currentState
                                                        .validate()) {
                                                      setState(() {
                                                        isProcessing = true;
                                                      });
                                                      Dio dio = Dio(BaseOptions(
                                                          headers: {
                                                            "apikey": apiKey,
                                                          },
                                                          validateStatus:
                                                              (status) => true,
                                                          baseUrl: baseUrl));
                                                      //make http request to server
                                                      try {
                                                        var response = await dio
                                                            .post(
                                                                "account/login",
                                                                data: {
                                                              "email":
                                                                  emailController
                                                                      .text,
                                                              "password":
                                                                  passwordController
                                                                      .text
                                                            });
                                                        setState(() {
                                                          isProcessing = false;
                                                        });
                                                        if (response.statusCode ==
                                                            200) {
                                                          FlutterSecureStorage
                                                              storage =
                                                              FlutterSecureStorage();
                                                          var token = response
                                                              .data['token'];
                                                          var email =
                                                              emailController
                                                                  .text;
                                                          await storage.write(
                                                              key: "email",
                                                              value: email);
                                                          await storage.write(
                                                              key: "token",
                                                              value: token);
                                                          User user = new User();
                                                          user.email = email;
                                                          user.token = token;
                                                          BlocProvider.of<
                                                                      AuthBloc>(
                                                                  context)
                                                              .add(AuthLoginEvent(
                                                                  user: user));
                                                          Navigator.pop(context);
                                                        } else if (response
                                                                .statusCode ==
                                                            401) {
                                                          Scaffold.of(context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: Text(response
                                                                .data['message']),
                                                            backgroundColor:
                                                                Colors.red[400],
                                                          ));
                                                        } else {
                                                          Scaffold.of(context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: Text(
                                                                "Server Error"),
                                                            backgroundColor:
                                                                Colors.red[400],
                                                          ));
                                                        }
                                                      } catch (e) {
                                                        Scaffold.of(context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                              "Internet Error"),
                                                          backgroundColor:
                                                              Colors.red[400],
                                                        ));
                                                      }
                                                    } else {
                                                      //do nothing;
                                                    }
                                                  },
                                            child: Center(
                                                child: Text(
                                              "Login",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0),
                                            )),
                                          );
                                        },
                                      ))),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: <Widget>[
                                           GestureDetector(
                              onTap: () {},
                              child: Text("Forgot password?",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ))),
                                         ],
                                       ),
                                  SizedBox(height: 10.0,)
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                         
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "register");
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("New shop registration",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Theme.of(context).primaryColor,
                                       
                                        )),
                                        Container(
                                          height: 20.0,
                                          color: Theme.of(context).primaryColor,
                                          child: Text("Click Here",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0
                                          ),
                                          ),
                                        ),
                                  ],
                                ),
                              )),
                          SizedBox(height: 10.0),
                          
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
