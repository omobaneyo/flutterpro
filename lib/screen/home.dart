import 'package:flutter/material.dart';
import 'package:new_flutter_project_seun/constant/colors.dart';
import 'package:new_flutter_project_seun/screen/resgistration_page.dart';
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
      body: SingleChildScrollView(child:SafeArea(
        child:

        Column(
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
                      changelabel: Text("Email"),
                      iconPrefix: Icon(Icons.email),


                    ),
                    Textform(
                      textlabel: "Password",
                      iconPrefix: Icon(Icons.lock),
                      changelabel: Text("Password"),
                    ),

                    ElevatedButton(onPressed: () => login(), child: Text("Login")),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.2
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: MyColor.orange,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
      )
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