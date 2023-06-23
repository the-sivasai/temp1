class LoginResponse {
  Response? response;

  LoginResponse({this.response});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
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

class Response {
  String? status;
  String? tToken;

  Response({this.status, this.tToken});

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    tToken = json['t_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['t_token'] = this.tToken;
    return data;
  }
}