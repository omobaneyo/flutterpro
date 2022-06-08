import 'package:flutter/material.dart';
class Textform extends StatefulWidget {
  String? textlabel;
  Icon? iconPrefix;
  Text? changelabel;
  TextEditingController? controller;
   Textform({Key? key, this.iconPrefix, this.textlabel, this.controller}) : super(key: key);

  @override
  State<Textform> createState() => _TextformState();
}

class _TextformState extends State<Textform> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        validator: (text){
        if(text!.isEmpty)  {
          return"please enter a value here";
        }
        return null;
      },
        controller: widget.controller,
        enableIMEPersonalizedLearning: true,
        enabled: true,
        decoration: InputDecoration(
          label: widget.changelabel,
            hintText: widget.textlabel,
            prefixIcon: widget.iconPrefix,
          border: OutlineInputBorder(),
            floatingLabelBehavior: FloatingLabelBehavior.always,
        ),

      ),
    );
  }
}
