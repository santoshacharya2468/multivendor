import 'package:checkshopsonline/shop_admin/bloc/auth_bloc.dart';
import 'package:checkshopsonline/shop_admin/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        appBar: buildAppBarAccount(context, login: true),
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
                                  decoration:
                                      InputDecoration(hintText: "Email"),
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
                                  child: Builder(
                                    builder: (context) {
                                      return Container(
                                          height: 40.0,
                                          child: BlocConsumer<AuthBloc, AuthState>(
                                            listener: (context,state){
                                              if(state is AuthFailedState){
                                                Scaffold.of(context).showSnackBar(
                                                
                                                  SnackBar(content: Text(state.message),backgroundColor: Colors.redAccent,)
                                                );
                                              }
                                              else if(state is AuthLoggedInState){
                                                Navigator.pushReplacementNamed(context, "dashboard");
                                              }
                                            },
                                            builder: (context, state) {
                                              if (state is AuthTryingState) {
                                                return RaisedButton(
                                                    onPressed: null,
                                                    child: Center(
                                                      child:
                                                          Text("Processing.."),
                                                    ));
                                              } else {
                                                return RaisedButton(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  child: Center(
                                                      child: Text(
                                                    "Login",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20.0),
                                                  )),
                                                  onPressed: (){
                                                    BlocProvider.of<AuthBloc>(context).add(AuthLoginEvent(
                                                      email: emailController.text,
                                                      password: passwordController.text,
                                                    ));
                                                  },
                                                );
                                              }
                                            },
                                          ));
                                    }
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                      onTap: () {},
                                      child: Text("Forgot password?",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                          ))),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              )
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("New shop registration",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Theme.of(context).primaryColor,
                                        )),
                                    Container(
                                      height: 20.0,
                                      color: Theme.of(context).primaryColor,
                                      child: Text(
                                        "Click Here",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0),
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
