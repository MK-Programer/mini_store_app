import '../resources/string_manager.dart';

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int FORBIDDEN = 403; // failure, API rejected request
  static const int UNAUTHORIZED = 401; // failure, user is not authorized
  static const int NOT_FOUND = 404; // failure, not found
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int DEFAULT = -1;
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.success; // success with no data (no content)
  static const String BAD_REQUEST =
      AppStrings.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      AppStrings.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppStrings.notFoundError; // failure, crash in server side
  static const String DEFAULT = AppStrings.defaultError;
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  DEFAULT_ERROR,
}

class Failure {
  int code;
  String message;

  Failure(this.code, this.message);
}

Failure handleError(int statusCode) {
  switch (statusCode) {
    case ResponseCode.SUCCESS:
      return DataSource.SUCCESS.getFailure();
    case ResponseCode.NO_CONTENT:
      return DataSource.NOT_FOUND.getFailure();
    case ResponseCode.BAD_REQUEST:
      return DataSource.BAD_REQUEST.getFailure();
    case ResponseCode.FORBIDDEN:
      return DataSource.FORBIDDEN.getFailure();
    case ResponseCode.UNAUTHORIZED:
      return DataSource.UNAUTHORIZED.getFailure();
    case ResponseCode.NOT_FOUND:
      return DataSource.NOT_FOUND.getFailure();
    case ResponseCode.INTERNAL_SERVER_ERROR:
      return DataSource.INTERNAL_SERVER_ERROR.getFailure();
    default:
      return DataSource.DEFAULT_ERROR.getFailure();
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORIZED:
        return Failure(ResponseCode.UNAUTHORIZED, ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.DEFAULT_ERROR:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}
