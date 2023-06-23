class ApiResponse<T> {
  late Status status;
  late String message;
  late T data;

  ApiResponse.loading(this.message) : status = Status.loading;
  ApiResponse.success(this.data) : status = Status.success;
  ApiResponse.error(this.message) : status = Status.error;
  ApiResponse.idle() : status = Status.idle;

  @override
  String toString() {
    return "Status : $status \n message: $message \n Data: $data";
  }
}

enum Status { loading, success, error, idle }
