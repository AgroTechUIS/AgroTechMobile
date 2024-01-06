import 'package:agrotech/common_utilities/models/list_response_model.dart';
import 'package:agrotech/common_utilities/models/response_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/data/bills_data_source.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/bill_model.dart';

abstract class BillsUseCase {
  Future<ResponseModel<List<BillModel>>> loadBillsByCrop({required String idCultivo, required bool isOnline});
  Future<ResponseModel<List<BillModel>>> loadBillsByFactory({required String idEmpresa, required bool isOnline});
}

class BillsUseCaseImpl extends BillsUseCase {
  final BillsDataSource billsDataSource;

  BillsUseCaseImpl(
    this.billsDataSource,
  );

  @override
  Future<ResponseModel<List<BillModel>>> loadBillsByFactory({required String idEmpresa, required bool isOnline}) async {
    var response = await billsDataSource.loadBillsByFactory(idEmpresa: idEmpresa, isOnline: isOnline);
    if (response.success) {
      var respon = ListResponseModel.fromJson(
        response.body ?? {},
        (json) => BillModel.fromJson(json),
        'facturas',
      );
      return ResponseModel(response: respon.list);
    } else {
      return ResponseModel(error: 'loadBillsActivities:success:false');
    }
  }

  @override
  Future<ResponseModel<List<BillModel>>> loadBillsByCrop({required String idCultivo, required bool isOnline}) async {
    var response = await billsDataSource.loadBillsByCrop(idCultivo: idCultivo, isOnline: isOnline);
    if (response.success) {
      var respon = ListResponseModel.fromJson(
        response.body ?? {},
        (json) => BillModel.fromJson(json),
        'facturas',
      );
      return ResponseModel(response: respon.list);
    } else {
      return ResponseModel(error: 'loadBillsActivities:success:false');
    }
  }
}
