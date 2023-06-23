import 'package:flutter/material.dart';
import 'package:flutter_bsafe/utils/color_util.dart';
import 'package:flutter_bsafe/utils/dimensions.dart';
import 'package:flutter_bsafe/utils/images.dart';
import 'package:flutter_bsafe/utils/routes.dart';
import 'package:flutter_bsafe/utils/strings.dart';
import 'package:flutter_bsafe/views/screens/home/widgets/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ImeiScreen extends StatefulWidget {
  const ImeiScreen({Key? key}) : super(key: key);

  @override
  _ImeiScreenState createState() => _ImeiScreenState();
}

class _ImeiScreenState extends State<ImeiScreen> {
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
                          decoration: InputDecoration(border: InputBorder.none,labelText: "Enter IMEI Number"),
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
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(Images.no_results),
                            Text("No Results!",style: TextStyle(
                                color: ColorsUtil.home_text_brown,
                                fontWeight: FontWeight.w900,
                                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE19)),
                            Expanded(
                              child: Text("This search result doesn't mean or confirm that the device is genuine/not-stolen.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                  color: ColorsUtil.home_text_brown,
                                  fontStyle: FontStyle.italic,
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                ))
          ],
        ),
      ),//custom
    );
  }
}
