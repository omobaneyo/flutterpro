import 'package:flutter/material.dart';
import 'package:new_flutter_project_seun/constant/colors.dart';
import 'package:new_flutter_project_seun/widgets/text_form_field.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: MyColor.orange,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: formkey,
                  child: Column(children: [
                    Textform(
                      textlabel: "fullname",
                      iconPrefix: Icon(Icons.person),
                      changelabel: Text("Fullname"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Textform(
                      textlabel: "email",
                      iconPrefix: Icon(Icons.email),
                      changelabel: Text("Email"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Textform(
                      textlabel: "password",
                      iconPrefix: Icon(Icons.lock),
                      changelabel: Text("Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Textform(
                      textlabel: "Confirm Password",
                      iconPrefix: Icon(Icons.lock),
                      changelabel: Text("password"),
                    ),
                  ])),
              ElevatedButton(onPressed: login, child: Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
  login() {
    if (formkey.currentState!.validate()) {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text("hurray"),
          content: Row(
            children: [
              Text("Logged in succesful"),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'))
            ],
          ),
        ),
      );
    }
    return null;
  }
}
