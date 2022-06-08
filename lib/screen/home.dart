import 'package:flutter/material.dart';
import 'package:new_flutter_project_seun/constant/colors.dart';
import 'package:new_flutter_project_seun/widgets/text_form_field.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState>formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",
              style: TextStyle(
                color: MyColor.orange, fontSize: 24,
              ),),
            Form(
                key: formkey,
                child: Column(
                  children: [
                    Textform(
                      textlabel: "Email",
                      iconPrefix: Icon(Icons.email),


                    ),
                    Textform(
                      textlabel: "Password",
                      iconPrefix: Icon(Icons.lock),
                    ),
                    ElevatedButton(onPressed: () => login(), child: Text("Login"))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  login() {
    if (formkey.currentState!.validate()) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          // false = user must tap button, true = tap outside dialog
          builder: (context) =>
               AlertDialog(
                title: Text('Hurray'),
                content: Row(
                  children: [
                     Text('logged in sucessfully'),
                    TextButton(onPressed: ()=>Navigator.pop(context),
                    child:  Text("OK"))
                  ],
                ),


              )

      );
    }
  }

}