import 'package:dio/dio.dart';
import 'package:employee_app/core/api.dart';
import 'package:employee_app/features/home/data/model/employee_model.dart';

class HomeRepostiory {
  final _api = Api();

  Future<List<EmployeeModel>> getHomeData() async {
    try {
      Response response = await _api.sendRequest.get('/v1/employees');

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (apiResponse.status!="success") {
        throw apiResponse.message.toString();
      }

      List<dynamic> data = apiResponse.data as List<dynamic>;
      return data.map((e) => EmployeeModel.fromJson(e)).toList();
    } on DioException catch (ex) {
      if (ex.response != null) {
        ApiResponse apiResponse = ApiResponse.fromResponse(ex.response!);
        throw apiResponse.message.toString();
      } else {
        throw "An error occurred while processing the request.";
      }
    } catch (ex) {
      rethrow;
    }
  }
}
