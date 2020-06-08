import 'package:checkshopsonline/shop_admin/bloc/auth_bloc.dart';
import 'package:checkshopsonline/shop_admin/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  bool isProcessing = false;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        appBar: buildAppBarAccount(context, login: false),
        body: Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Form(
                    key: formKey,
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
                        Container(
                          height: 100.0,
                          width: deviceSize.width,
                          child: Row(
                            children: <Widget>[
                              Container(
                                  height: 100.0,
                                  width: 100.0,
                                  margin: const EdgeInsets.only(left: 2),
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/add.png",
                                        height: 80.0,
                                        width: 80.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        "Add logo",
                                        style: TextStyle(fontSize: 20.0),
                                      )
                                    ],
                                  )),
                              Expanded(
                                child: Container(
                                  margin:const EdgeInsets.only(left:2.0),
                                  child: TextFormField(
                                    decoration: InputDecoration.collapsed(
                                        hintText: "Business Name",
                                        border: UnderlineInputBorder()),
                                    maxLength: 100,
                                    validator: (name) {
                                      if (name.isEmpty) {
                                        return "Password is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                      
                            ],
                          ),
                          
                        ),
                                     Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                       
                            decoration: InputDecoration(hintText: "Website"),
                         
                            validator: (website) {
                              if (website.isEmpty) {
                                return "website url  is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                                     Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                       
                            decoration: InputDecoration(hintText: "mobile"),
                         
                            validator: (website) {
                              if (website.isEmpty) {
                                return "website url  is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                                     Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                       
                            decoration: InputDecoration(hintText: "telephone"),
                         
                            validator: (website) {
                              if (website.isEmpty) {
                                return "website url  is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                                     Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                       
                            decoration: InputDecoration(hintText: "facebook"),
                         
                            validator: (website) {
                              if (website.isEmpty) {
                                return "website url  is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                                     Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                       
                            decoration: InputDecoration(hintText: "Business Email"),
                         
                            validator: (website) {
                              if (website.isEmpty) {
                                return "website url  is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
