import 'package:flutter/material.dart';
import 'package:flutter_bsafe/utils/color_util.dart';
import 'package:flutter_bsafe/utils/dimensions.dart';
import 'package:flutter_bsafe/utils/images.dart';
import 'package:flutter_bsafe/utils/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          //_createHeader(),
          Divider(),
          _createDrawerItem(icon: Images.navDrawer1, text: 'Edit Profile',
          onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.ROUTE_LOGIN),
          ),
          Divider(),
          _createDrawerItem(icon: Images.navDrawer2, text: 'Settings',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.ROUTE_LOGIN),
          ),
          Divider(),
          _createDrawerItem(icon: Images.navDrawer3, text: 'Share BSafe',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.ROUTE_LOGIN),
          ),
          Divider(),
          _createDrawerItem(icon: Images.navDrawer4, text: 'Privacy',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.ROUTE_LOGIN),
          ),
          Divider(),
          _createDrawerItem(icon: Images.navDrawer5, text: 'Blocked List',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.ROUTE_LOGIN),
          ),
          Divider(),
          _createDrawerItem(icon: Images.navDrawer6, text: 'Logout',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.ROUTE_LOGIN),
          ),
          //Divider(),
          /*ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),*/
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('path/to/header_background.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Flutter Step-by-Step",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {required String icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Container(
            width: Dimensions.PADDING_SIZE_EXTRA_LARGE,
              child: SvgPicture.asset(icon)
          ),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE),
            child: Text(text,
              style: TextStyle(
                color: ColorsUtil.primary_color_black,
                fontWeight: FontWeight.w900,
                fontSize: Dimensions.FONT_SIZE_LARGE2),),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}