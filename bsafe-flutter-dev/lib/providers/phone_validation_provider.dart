import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bsafe/data/model/response/base/api_response.dart';
import 'package:flutter_bsafe/data/model/response/login_response.dart';
import 'package:flutter_bsafe/data/model/response/otp_response.dart';
import 'package:flutter_bsafe/utils/api.dart';
import 'package:flutter_bsafe/utils/shared_pref.dart';

import '../data/model/validation_item.dart';
import 'package:http/http.dart' as http;

class PhoneValidation with ChangeNotifier {

  ValidationItem _phoneNo = ValidationItem(null,null);
  ValidationItem _otp = ValidationItem(null,null);

  int _timer = 20;

  late ApiResponse loginRequest;
  bool _otpSent = false;
  bool _loginSuccess = false;

  //Getters
  ValidationItem get phoneNo => _phoneNo;
  ValidationItem get otp => _otp;
  bool get otpSent => _otpSent;
  bool get loginSuccess => _loginSuccess;
  int get timer => _timer;
  bool get isValidPhone {
    if (_phoneNo.value != null && _phoneNo.value!.length == 10){
      return true;
    } else {
      return false;
    }
  }

  bool get isValidOTP {
    if (_otp.value != null && _otp.value!.length == 4){
      return true;
    } else {
      return false;
    }
  }

  void resetTimer(){
    _timer = 19;
    notifyListeners();
  }

  //Setters
  void changePhoneNo(String value){
    if (value.length == 10){
      _phoneNo=ValidationItem(value,null);
    } else {
      _phoneNo=ValidationItem(null, "Please provide a valid phone number");
    }
    notifyListeners();
  }

  void setOTP(String value){
    if (value.length == 4){
      _otp=ValidationItem(value,null);
    } else {
      _otp=ValidationItem(null, "Please provide a valid OTP");
    }
    notifyListeners();
  }

  /*void submitData(){
    authProvider.login(_email, _password).then((status) async {
      if (status.isSuccess) {

        if (authProvider.isActiveRememberMe) {
          authProvider.saveUserNumberAndPassword(_email, _password);
        } else {
          authProvider.clearUserNumberAndPassword();
        }
        await Provider.of<WishListProvider>(context, listen: false).initWishList(context);
        Navigator.pushNamedAndRemoveUntil(context, Routes.getMainRoute(), (route) => false);
      }
    });
  }*/

  Future<void> submitData() async{
    bool network = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      network = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      network = true;
    }
    if (network == true) {
      await sendRequest(_phoneNo.value!).then((var response) {
        if(response != null){
          if (response.response.status == "success") {
            SharedPrefHelper.setString("t_token", response.response.tToken);
            _otpSent = true;
            Timer.periodic(const Duration(seconds: 1), (timer) {
              print(timer.tick);
              _timer--;
              if (_timer == 0) {
                print('Cancel timer');
                timer.cancel();
                resetTimer();
              }
              notifyListeners();
            });
            notifyListeners();
          }
        }
        
      });
    }
  }

  Future<void> submitOTP() async{
    bool network = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      network = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      network = true;
    }
    if (network == true) {
      await sendOTP(_otp.value!).then((var response) {
        if(response != null){
          if (response.response.status == "success") {
            SharedPrefHelper.setString("access_token", response.response.accessToken);
            SharedPrefHelper.setString("refresh_token", response.response.refreshToken);
            _loginSuccess = true;
          }
        }

      });
    }
    notifyListeners();
  }

  Future<dynamic> sendRequest(String phone) async {
    loginRequest = ApiResponse.loading('Login....');
    notifyListeners();

    String url = Api.baseUrl + Api.login;
    var uri = Uri.parse(url);

    try{
      final response = await http.post(uri,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"phone": "91"+_phoneNo.value!},
      ).timeout(Duration(seconds: 20));

      if (response.statusCode == 200) {
        print('**************' + response.statusCode.toString());

        return LoginResponse.fromJson(json.decode(response.body));
      } else {
        print('Error Code-----,' + response.statusCode.toString());
        print('reason-----,' + response.reasonPhrase!);
        notifyListeners();
      }
    }  on TimeoutException catch (_) {
      // A timeout occurred.
      notifyListeners();
    } on SocketException catch (_) {
      // Other exception
      notifyListeners();
    } on Exception catch (_) {
      notifyListeners();
    }
  }

  Future<dynamic> sendOTP(String otp) async {
    loginRequest = ApiResponse.loading('Login....');
    notifyListeners();

    String url = Api.baseUrl + Api.otpVerify;
    var uri = Uri.parse(url);

    try{
      final response = await http.post(uri,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
        "phone": "91"+_phoneNo.value!,
        "otp": otp,
        "t_token": SharedPrefHelper.getString("t_token")
        },
      ).timeout(Duration(seconds: 20));

      if (response.statusCode == 200) {
        print('**************' + response.statusCode.toString());

        return OTPResponse.fromJson(json.decode(response.body));
      } else {
        print('Error Code-----,' + response.statusCode.toString());
        print('reason-----,' + response.reasonPhrase!);
        notifyListeners();
      }
    }  on TimeoutException catch (_) {
      // A timeout occurred.
      notifyListeners();
    } on SocketException catch (_) {
      // Other exception
      notifyListeners();
    } on Exception catch (_) {
      notifyListeners();
    }
  }

}