import 'dart:io';

import 'package:checkshopsonline/shop_admin/bloc/auth_bloc.dart';
import 'package:checkshopsonline/shop_admin/widgets/appbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../conf.dart';

class RegisterPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final businessNameController = new TextEditingController();
  final websiteController = new TextEditingController();
  final passwordController = new TextEditingController();
  final facebookController = new TextEditingController();
  final addressController = new TextEditingController();
  final businessEmailController = new TextEditingController();
  final telephoneController = new TextEditingController();
  final mobileController = new TextEditingController();
  final dayController = new TextEditingController();
  final monthController = new TextEditingController();
  final yearController = new TextEditingController();
  String packaDuration = packageDuration[0];
  String selectedDistrict = districts[0];
  String seletectedCategory = departments[0]['name'];
  List<String> mobiles = [];
  List<String> telephones = [];
  List<String> addresses = [];
  File pickedImage;
  static final String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final RegExp regExp = new RegExp(pattern);
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
                              GestureDetector(
                                onTap: () async {
                                  try {
                                    var image = await ImagePicker()
                                        .getImage(source: ImageSource.gallery);
                                    if (image != null) {
                                      setState(() {
                                        pickedImage = File(image.path);
                                      });
                                    }
                                  } catch (e) {}
                                },
                                child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    margin: const EdgeInsets.only(left: 2),
                                    padding: EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: <Widget>[
                                        pickedImage == null
                                            ? Image.asset(
                                                "assets/images/add.png",
                                                height: 100.0,
                                                width: 100.0,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.file(
                                                pickedImage,
                                                height: 100.0,
                                                width: 100.0,
                                                fit: BoxFit.cover,
                                              ),
                                        Text(
                                          "Add logo",
                                          style: TextStyle(fontSize: 20.0),
                                        )
                                      ],
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 2.0),
                                  child: TextFormField(
                                    controller: businessNameController,
                                    decoration: InputDecoration.collapsed(
                                        hintText: "Business Name",
                                        border: UnderlineInputBorder()),
                                    maxLength: 100,
                                    validator: (name) {
                                      if (name.isEmpty) {
                                        return "Business name is required";
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
                            controller: websiteController,
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
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: <Widget>[
                              TextFormField(
                                controller: mobileController,
                                decoration: InputDecoration(hintText: "mobile"),
                                validator: validateMobile,
                              ),
                              IconButton(
                                icon: Icon(Icons.add,
                                    color: Theme.of(context).primaryColor),
                                onPressed: () async {
                                  var extra = await getExtraField(
                                      context: context,
                                      hint: "mobile",
                                      title: "Add another mobile",
                                      validator: validateMobile);
                                  if (extra != null) {
                                    setState(() {
                                      mobiles.add(extra);
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        mobiles.length > 0
                            ? Container(
                                height: 100.0,
                                child: ListView(
                                  children: mobiles
                                      .map((e) => ListTile(
                                            title: Text(e),
                                            trailing: IconButton(
                                                icon: Icon(Icons.cancel),
                                                onPressed: () {
                                                  setState(() {
                                                    mobiles.remove(e);
                                                  });
                                                }),
                                          ))
                                      .toList(),
                                ),
                              )
                            : Container(height: 0, width: 0.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: <Widget>[
                              TextFormField(
                                controller: telephoneController,
                                decoration:
                                    InputDecoration(hintText: "telephone"),
                                validator: (telephone) {
                                  if (telephone.isEmpty) {
                                    return "priamry telephone number is required";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.add,
                                    color: Theme.of(context).primaryColor),
                                onPressed: () async {
                                  var extra = await getExtraField(
                                      context: context,
                                      hint: "telephone",
                                      title: "Add another telephone number",
                                      validator: validateMobile);
                                  if (extra != null) {
                                    setState(() {
                                      telephones.add(extra);
                                    });
                                  }
                                  // telephones.add(extra);
                                },
                              ),
                            ],
                          ),
                        ),
                        telephones.length > 0
                            ? Container(
                                height: 100.0,
                                child: ListView(
                                  children: telephones
                                      .map((e) => ListTile(
                                            title: Text(e),
                                            trailing: IconButton(
                                                icon: Icon(Icons.cancel),
                                                onPressed: () {
                                                  setState(() {
                                                    telephones.remove(e);
                                                  });
                                                }),
                                          ))
                                      .toList(),
                                ),
                              )
                            : Container(height: 0, width: 0.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: <Widget>[
                              TextFormField(
                                controller: addressController,
                                decoration:
                                    InputDecoration(hintText: "address"),
                                validator: validateAddress,
                              ),
                              IconButton(
                                icon: Icon(Icons.add,
                                    color: Theme.of(context).primaryColor),
                                onPressed: () async {
                                  var extra = await getExtraField(
                                      context: context,
                                      hint: "address",
                                      title: "Add another adddress",
                                      validator: validateAddress);
                                  if (extra != null) {
                                    setState(() {
                                      addresses.add(extra);
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        addresses.length > 0
                            ? Container(
                                height: 100.0,
                                child: ListView(
                                  children: addresses
                                      .map((e) => ListTile(
                                            title: Text(e),
                                            trailing: IconButton(
                                                icon: Icon(Icons.cancel),
                                                onPressed: () {
                                                  setState(() {
                                                    addresses.remove(e);
                                                  });
                                                }),
                                          ))
                                      .toList(),
                                ),
                              )
                            : Container(height: 0, width: 0.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: facebookController,
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
                            controller: businessEmailController,
                            decoration:
                                InputDecoration(hintText: "Business Email"),
                            validator: (bemail) {
                              if (bemail.isEmpty) {
                                return "Business email is required";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Container(
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              Text("Choose Catgory"),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: new DropdownButton<String>(
                                  value: seletectedCategory,
                                  iconSize: 30.0,
                                  items: departments.map((value) {
                                    return new DropdownMenuItem<String>(
                                      value: value['name'],
                                      child: new Text(value['name']),
                                    );
                                  }).toList(),
                                  onChanged: (cat) {
                                    setState(() {
                                      seletectedCategory = cat;
                                    });
                                  },
                                ),
                              ),
                              // Text(seletectedCategory==null?"take one":seletectedCategory),
                            ],
                          ),
                        ),
                        Container(
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              Text("Choose District"),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: new DropdownButton<String>(
                                  value: selectedDistrict,
                                  iconSize: 30.0,
                                  items: districts.map((value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (dis) {
                                    setState(() {
                                      selectedDistrict = dis;
                                    });
                                  },
                                ),
                              ),
                              // Text(seletectedCategory==null?"take one":seletectedCategory),
                            ],
                          ),
                        ),
                        Container(
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              Text("Choose Package Duration"),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: new DropdownButton<String>(
                                  value: '$packaDuration',
                                  iconSize: 30.0,
                                  items: packageDuration.map((value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text("$value month"),
                                    );
                                  }).toList(),
                                  onChanged: (duration) {
                                    setState(() {
                                      packaDuration = duration;
                                    });
                                  },
                                ),
                              ),
                              // Text(seletectedCategory==null?"take one":seletectedCategory),
                            ],
                          ),
                        ),
                        Container(
                          height: 50.0,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                    controller: dayController,
                                    validator: (v) {
                                      if (int.parse(v) > 32) {
                                        return 'invalid day';
                                      } else if (int.parse(v) < 1) {
                                        return 'invalid day';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        InputDecoration(hintText: "Day")),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                    controller: monthController,
                                    validator: (v) {
                                      if (int.parse(v) > 12) {
                                        return 'invalid month';
                                      } else if (int.parse(v) < 1) {
                                        return 'invalid month';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        InputDecoration(hintText: "Month")),
                              ),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                    controller: yearController,
                                    validator: (v) {
                                      if (int.parse(v) < 2020) {
                                        return 'invalid year';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        InputDecoration(hintText: "Year")),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 40.0,
                            child: BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) {
                                if(state is AuthRegisterCompletedState){
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Success"),
                                    backgroundColor: Colors.greenAccent,
                                  ));
                                }
                                else if(state is AuthFailedState){
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(state.message),
                                    backgroundColor: Colors.redAccent,
                                  ));
                                }
                              },
                              builder: (context, state) => RaisedButton(
                                child: Center(
                                    child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                )),
                                onPressed: () async {
                                  if (formKey.currentState.validate()) {
                                    if (pickedImage == null) {
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text("Choose logo"),
                                              backgroundColor:
                                                  Colors.redAccent));
                                    } else {
                                      addresses.add(addressController.text);
                                      mobiles.add(mobileController.text);
                                      telephones.add(telephoneController.text);
                                      var data = {
                                        "email": emailController.text,
                                        "password": passwordController.text,
                                        "businessName":
                                            businessNameController.text,
                                        "website": websiteController.text,
                                        "facebook": facebookController.text,
                                        "businessEmail":
                                            businessEmailController.text,
                                        "address": addresses,
                                        "district": selectedDistrict,
                                        "telephones": telephones,
                                        "mobiles": mobiles,
                                        "duration": int.parse(packaDuration),
                                        "day": int.parse(dayController.text),
                                        "month":
                                            int.parse(monthController.text),
                                        "year": int.parse(yearController.text),
                                        "logo": await MultipartFile.fromFile(
                                            pickedImage.path)
                                      };
                                      var formData = FormData.fromMap(data);
                                      BlocProvider.of<AuthBloc>(context).add(AuthRegisterEvent(formData));
                                    }
                                  }
                                },
                              ),
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  String validateMobile(mobile) {
    if (mobile.isEmpty) {
      return "mobile number  is required";
    }
    //mobile.contains(Pattern.)
    else if (!regExp.hasMatch(mobile)) {
      return 'Please enter valid mobile number';
    } else {
      return null;
    }
  }

  String validateAddress(address) {
    if (address.isEmpty) {
      return "address  is required";
    } else {
      return null;
    }
  }

  Future<String> getExtraField(
      {@required BuildContext context,
      @required String hint,
      @required String title,
      @required Function validator}) async {
    TextEditingController extraController = TextEditingController();
    var key = GlobalKey<FormState>();
    var result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Form(
              key: key,
              child: TextFormField(
                controller: extraController,
                validator: validator,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  if (key.currentState.validate()) {
                    Navigator.pop(context, extraController.text);
                  }
                },
              ),
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context, null);
                },
              ),
            ],
          );
        });
    return result;
  }
}
