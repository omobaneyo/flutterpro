
import 'package:flutter/material.dart';
import 'package:new_flutter_project_seun/constant/colors.dart';
import 'package:new_flutter_project_seun/constant/image.dart';
import 'package:new_flutter_project_seun/constant/values.dart';
import 'package:new_flutter_project_seun/string_data.dart';
class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List data = [
    {"title": StringData.pageOneTitles, "subtitle": StringData.pageOneSubTitles, "image": Images.one},
    {"title": StringData.pageTwoTitles, "subtitle": StringData.pageTwoSubTitles, "image": Images.two},
    {"title": StringData.pageThreeTitles, "subtitle": StringData.pageThreeSubTitles, "image": Images.three},
  ];
  double currentPage = 0;
  void changePage(index){
    setState(() {
      currentPage =index.toDouble();
    });
  }


  @override
  Widget build(BuildContext context) {
    Values.screenHeight=MediaQuery.of(context).size.height;
    Values.screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              onPageChanged: (index) => changePage(index),
              children: List.generate(data.length, (index) => pages(
              title: data[index]["title"],
            subtitle: data[index]["subtitle"],
              image: data[index]["image"],
    ))),
          Positioned(
            bottom: Values.screenHeight*.15,
            left: Values.screenWidth*.45,
            child: currentPage==data.length-1? button(): Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(data.length, (index) => dot(index)),
            ),
          )
        ],
      ));
  }
 Column pages ( {String? title,String? subtitle,String? image}) {
    return Column(
      children: [
        SizedBox(height: Values.screenHeight*.2,
        ),
        Center(
          child: CircleAvatar(
              backgroundColor: MyColor.white,
              radius: Values.screenWidth*.37,
              backgroundImage: AssetImage(image!)
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: Values.screenHeight*.1, bottom: 7),
          child: Text(title!, style:  TextStyle(
            fontSize: 30,
            color: MyColor.deepblue,
            fontWeight: FontWeight.bold,
          ),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
          child: Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                color: MyColor.black,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        // SizedBox(
        //   height: Values.screenHeight*.06,
        // ),

      ],
    );
  }
  Padding dot(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: CircleAvatar(
        backgroundColor: index == currentPage? MyColor.blue: MyColor.grey,
        radius: index == currentPage? 5:3,
      ),
    );
  }
  Widget button (){
    return ElevatedButton(onPressed: (){
    }, child: Text("Proceed"));
  }
}
