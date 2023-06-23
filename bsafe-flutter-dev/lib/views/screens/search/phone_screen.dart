import 'package:flutter/material.dart';
import 'package:flutter_bsafe/utils/color_util.dart';
import 'package:flutter_bsafe/utils/dimensions.dart';
import 'package:flutter_bsafe/utils/images.dart';
import 'package:flutter_bsafe/utils/routes.dart';
import 'package:flutter_bsafe/utils/strings.dart';
import 'package:flutter_bsafe/views/screens/home/widgets/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.primary_color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        /*leading: IconButton(
          //icon: SvgPicture.asset(Images.navDrawer1, color: Colors.white), // set your color here
          icon: Icon(Icons.menu, color: Colors.white,), // set your color here
          onPressed: () => drawer.openDrawer()
        ),*/
        leading: SizedBox(height: Dimensions.PADDING_SIZE_SMALL,
            child: SvgPicture.asset(Images.menu_nav, color: Colors.white,height: Dimensions.PADDING_SIZE_EXTRA_LARGE,)),
        actions: [
          Ink(
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
              ),
              child: SvgPicture.asset(Images.user,height: Dimensions.PADDING_SIZE_EXTRA_LARGE,)
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              //width: 90.w,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.PADDING_SIZE_DEFAULT,
                      left: Dimensions.PADDING_SIZE_LARGE,
                      right: Dimensions.PADDING_SIZE_LARGE,
                      bottom: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      elevation: 5.0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.PADDING_SIZE_DEFAULT,
                            right: Dimensions.PADDING_SIZE_DEFAULT,
                            top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                            bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        child: TextFormField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ))),
            ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorsUtil.home_brown,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.PADDING_SIZE_LARGE,
                        right: Dimensions.PADDING_SIZE_LARGE),
                    child: Padding(
                      padding: EdgeInsets.only(top:Dimensions.PADDING_SIZE_DEFAULT),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.warning_amber_rounded, color: ColorsUtil.phone_green,),
                              Text('SBI Credit Card Customer Care',style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorsUtil.phone_green,fontWeight: FontWeight.bold),),
                              Text('+919999999999',style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorsUtil.phone_green),),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_LARGE),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorsUtil.primary_color_white),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Icon(Icons.warning_amber_rounded),
                                          Text("Call",
                                              style: TextStyle(
                                                  color: ColorsUtil.primary_color_black,
                                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                                  fontWeight: FontWeight.bold)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Icon(Icons.warning_amber_rounded),
                                          Text("SMS",
                                              style: TextStyle(
                                                  color: ColorsUtil.primary_color_black,
                                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                                  fontWeight: FontWeight.bold)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Icon(Icons.warning_amber_rounded),
                                          Text("Block",
                                              style: TextStyle(
                                                  color: ColorsUtil.primary_color_black,
                                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                                  fontWeight: FontWeight.bold)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Icon(Icons.warning_amber_rounded),
                                          Text("Report",
                                              style: TextStyle(
                                                  color: ColorsUtil.primary_color_black,
                                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                                  fontWeight: FontWeight.bold)
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_LARGE),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorsUtil.primary_color_white),
                              child: Padding(
                                padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left:Dimensions.PADDING_SIZE_DEFAULT),
                                      child: Row(
                                        children: [
                                          Text("In Your Contacts",
                                              style: TextStyle(
                                                  color: ColorsUtil.primary_color_black,
                                                  fontSize: Dimensions.FONT_SIZE_DEFAULT)
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left:Dimensions.PADDING_SIZE_DEFAULT, right:Dimensions.PADDING_SIZE_DEFAULT),
                                      child: Divider(height: 20,),
                                    ),
                                    Text("Some Name",
                                        style: TextStyle(
                                            color: ColorsUtil.primary_color_black,
                                            fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE19)
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_LARGE),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorsUtil.primary_color_white),
                              child: Padding(
                                padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left:Dimensions.PADDING_SIZE_DEFAULT),
                                      child: Row(
                                        children: [
                                          Text("Email",
                                              style: TextStyle(
                                                  color: ColorsUtil.primary_color_black,
                                                  fontSize: Dimensions.FONT_SIZE_DEFAULT)
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left:Dimensions.PADDING_SIZE_DEFAULT, right:Dimensions.PADDING_SIZE_DEFAULT),
                                      child: Divider(height: 20,),
                                    ),
                                    Text("demo@mail.com",
                                        style: TextStyle(
                                            color: ColorsUtil.primary_color_black,
                                            fontSize: Dimensions.FONT_SIZE_DEFAULT)
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),//custom
    );
  }
}
