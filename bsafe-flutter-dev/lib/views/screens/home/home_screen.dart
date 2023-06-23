import 'package:flutter/material.dart';
import 'package:flutter_bsafe/utils/color_util.dart';
import 'package:flutter_bsafe/utils/dimensions.dart';
import 'package:flutter_bsafe/utils/images.dart';
import 'package:flutter_bsafe/utils/routes.dart';
import 'package:flutter_bsafe/utils/strings.dart';
import 'package:flutter_bsafe/views/screens/home/widgets/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.primary_color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: Padding(padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
              child: SvgPicture.asset(Images.menu_nav, color: Colors.white)),
        ),

        /*leading: Padding(padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
            child: SvgPicture.asset(Images.menu_nav, color: Colors.white)),*/
        actions: [
          Ink(
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                child: SvgPicture.asset(Images.user),
              )
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
                            onTap: ()=> Navigator.of(context).pushNamed(Routes.ROUTE_SEARCH),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_LARGE),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorsUtil.primary_color_white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right:Dimensions.PADDING_SIZE_DEFAULT),
                              child: SvgPicture.asset('assets/svgs/podcast_icon.svg',height: Dimensions.PADDING_SIZE_EXTRA_LARGE3),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Strings.LISTEN_TO,
                                    style: TextStyle(
                                    color: ColorsUtil.home_text_brown,
                                    fontWeight: FontWeight.w900,
                                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE1)
                                ),
                                Text(Strings.BSAFE_CAST,
                                    style: TextStyle(
                                        color: ColorsUtil.home_text_red,
                                        fontWeight: FontWeight.w900,
                                        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE1)
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_LARGE),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(Routes.ROUTE_APPS),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ColorsUtil.primary_color_white,
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: Padding(
                          padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right:Dimensions.PADDING_SIZE_DEFAULT),
                                child: SvgPicture.asset('assets/svgs/bscan.svg',height: Dimensions.PADDING_SIZE_EXTRA_LARGE3),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Strings.BSCAN,
                                      style: TextStyle(
                                          color: ColorsUtil.primary_color,
                                          fontWeight: FontWeight.w900,
                                          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE19)
                                  ),
                                  Text(Strings.CHECK_SECURITY,
                                      style: TextStyle(
                                          color: ColorsUtil.primary_color,
                                          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE19)
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_LARGE),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(Routes.ROUTE_PHONE),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ColorsUtil.primary_color_white,
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: Padding(
                          padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right:Dimensions.PADDING_SIZE_DEFAULT),
                                child: SvgPicture.asset('assets/svgs/contacts_icon.svg',height: Dimensions.PADDING_SIZE_EXTRA_LARGE3),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Strings.CONTACT_SCAN,
                                      style: TextStyle(
                                          color: ColorsUtil.primary_color,
                                          fontWeight: FontWeight.w900,
                                          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE19)
                                  ),
                                  Text(Strings.CHECK_SCAM,
                                      style: TextStyle(
                                          color: ColorsUtil.primary_color,
                                          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE19)
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ))
          ],
        ),
      ),
      drawer: AppDrawer(), //custom
    );
  }
}
