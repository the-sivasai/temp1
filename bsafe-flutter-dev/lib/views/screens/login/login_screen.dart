import 'package:flutter/material.dart';
import 'package:flutter_bsafe/providers/phone_validation_provider.dart';
import 'package:flutter_bsafe/utils/color_util.dart';
import 'package:flutter_bsafe/utils/dimensions.dart';
import 'package:flutter_bsafe/utils/images.dart';
import 'package:flutter_bsafe/utils/routes.dart';
import 'package:flutter_bsafe/utils/strings.dart';
import 'package:flutter_bsafe/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool login = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    final validationService = Provider.of<PhoneValidation>(context);
    return Scaffold(
      backgroundColor: ColorsUtil.primary_color,
      body: Center(
        child: Container(
          height: 50.h,
          child: Padding(
            padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL,left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
            child: !login? LoginCard(validationService):OTPCard(validationService),
          ),
        ),
      ),
    );
  }

  Widget LoginCard(PhoneValidation validationService){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 15.0,
      child: Padding(
        padding: EdgeInsets.only(left:Dimensions.PADDING_SIZE_EXTRA_LARGE, right: Dimensions.PADDING_SIZE_EXTRA_LARGE, top: Dimensions.PADDING_SIZE_LARGE, bottom: Dimensions.PADDING_SIZE_LARGE),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(Images.icon_login_avatar_1),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.LOGIN_WELCOME, style: segoeBold),
                      Text(Strings.LOGIN_SIGN_IN)
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_LARGE),
              child: Text(Strings.LOGIN_PHONE_NO, style: segoeBold17),
            ),
            Padding(
              padding: EdgeInsets.only(left:Dimensions.PADDING_SIZE_EXTRA_LARGE, right: Dimensions.PADDING_SIZE_EXTRA_LARGE, bottom: Dimensions.PADDING_SIZE_EXTRA_LARGE),
              child: TextField(
                decoration: InputDecoration(
                  errorText: validationService.phoneNo.error,
                ),
                onChanged: (String value) {
                  validationService.changePhoneNo(value);
                },
                textAlign: TextAlign.center,
                style: segoeBold17,
              ),
            ),
            !isLoading ? TextButton(
                onPressed: () async{

                  if (validationService.isValidPhone) {
                    setState(() {
                      isLoading = true;
                    });
                    await validationService.submitData();
                    if(validationService.otpSent){
                      setState(() {
                        isLoading = false;
                        login = !login;
                      });
                    }
                  } else{
                    null;
                  }
            },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorsUtil.primary_color),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.0),
                        )
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.only(left:Dimensions.PADDING_SIZE_EXTRA_LARGE, right: Dimensions.PADDING_SIZE_EXTRA_LARGE, bottom: Dimensions.PADDING_SIZE_SMALL, top: Dimensions.PADDING_SIZE_SMALL),
                  child: Text(Strings.LOGIN_SEND_OTP, style: TextStyle(
                      color: ColorsUtil.primary_color_white,
                      fontWeight: FontWeight.w900,
                      fontSize: Dimensions.FONT_SIZE_DEFAULT)
                  ),
                )) : CircularProgressIndicator(color: ColorsUtil.primary_color)
          ],
        ),
      ),
    );
  }

  Widget OTPCard(PhoneValidation validationService){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 15.0,
      child: Padding(
        padding: EdgeInsets.only(left:Dimensions.PADDING_SIZE_EXTRA_LARGE, right: Dimensions.PADDING_SIZE_EXTRA_LARGE, top: Dimensions.PADDING_SIZE_LARGE, bottom: Dimensions.PADDING_SIZE_LARGE),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(Images.icon_login_avatar_2),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.LOGIN_ONE_STEP, style: segoeBold),
                      Text(Strings.LOGIN_SENT_YOU)
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_LARGE),
              child: Text(Strings.LOGIN_ENTER_OTP, style: segoeBold17),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_EXTRA_LARGE),
              child: OTPTextField(
                length: 4,
                width: 80.w,
                fieldWidth: 15.w,
                style: segoeBold17,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                otpFieldStyle: OtpFieldStyle(
                  //disabledBorderColor: ColorsUtil.primary_color_black,
                  //enabledBorderColor: ColorsUtil.primary_color_brown,
                ),
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  validationService.setOTP(pin);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30.0.w,
                  child: Consumer<PhoneValidation>(
                    builder: (context, value, child){
                      return TextButton(
                          onPressed: ()async{
                            if(validationService.timer == 20){
                              await validationService.submitData();
                            } else{
                              null;
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorsUtil.primary_color),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.0),
                                  )
                              )
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL, top: Dimensions.PADDING_SIZE_SMALL),
                            child: Text(value.timer == 20 ? Strings.LOGIN_RESEND : Strings.LOGIN_RESEND+" (" +value.timer.toString() +"s)", style: TextStyle(
                                color: ColorsUtil.primary_color_white,
                                fontWeight: FontWeight.w900,
                                fontSize: Dimensions.FONT_SIZE_DEFAULT),
                            ),
                          ));
                    },
                  ),
                ),
                Container(width: 5.0.w,),
                Container(
                  width: 30.0.w,
                  child: TextButton(
                      onPressed: (){
                        if(validationService.isValidOTP){
                          validationService.submitOTP();
                          if(validationService.loginSuccess){
                            Navigator.of(context).pushReplacementNamed(Routes.ROUTE_HOME);
                          } else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Invalid OTP"),
                            ));
                          }
                        } else{
                          null;
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorsUtil.primary_color),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0),
                              )
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL, top: Dimensions.PADDING_SIZE_SMALL),
                        child: Text(Strings.LOGIN_PROCEED, style: TextStyle(
                            color: ColorsUtil.primary_color_white,
                            fontWeight: FontWeight.w900,
                            fontSize: Dimensions.FONT_SIZE_DEFAULT),
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
