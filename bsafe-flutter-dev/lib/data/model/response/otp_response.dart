class OTPResponse {
  OTPResponseData? response;

  OTPResponse({this.response});

  OTPResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new OTPResponseData.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class OTPResponseData {
  String? status;
  String? accessToken;
  String? refreshToken;

  OTPResponseData({this.status, this.accessToken, this.refreshToken});

  OTPResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
