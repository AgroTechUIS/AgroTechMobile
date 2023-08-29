import 'package:agrotech/features/3.opciones_supervisor/data/bills_data_source.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/bills_response%20model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/company_model.dart';

abstract class BillsUseCase {
  Future<BillsResponseModel> loadBillsClient({required CompanyModel companyModel});
  Future<BillsResponseModel> loadBillsSupplier({required CompanyModel companyModel});
  Future<BillsResponseModel> loadBillsActivities({required CompanyModel companyModel});
}

class BillsUseCaseImpl extends BillsUseCase {
  final BillsDataSource billsDataSource;

  BillsUseCaseImpl(
    this.billsDataSource,
  );

  @override
  Future<BillsResponseModel> loadBillsClient({required CompanyModel companyModel}) async {
    var response = await billsDataSource.loadBillsClient(companyModel: companyModel);
    if (response.success) {
      return BillsResponseModel.fromJson(response.body ?? {});
    } else {
      return BillsResponseModel(error: 'loadBillsClient:success:false');
    }
  }

  @override
  Future<BillsResponseModel> loadBillsSupplier({required CompanyModel companyModel}) async {
    var response = await billsDataSource.loadBillsSupplier(companyModel: companyModel);
    if (response.success) {
      return BillsResponseModel.fromJson(response.body ?? {});
    } else {
      return BillsResponseModel(error: 'loadBillsSupplier:success:false');
    }
  }

  @override
  Future<BillsResponseModel> loadBillsActivities({required CompanyModel companyModel}) async {
    var response = await billsDataSource.loadBillsActivities(companyModel: companyModel);
    if (response.success) {
      return BillsResponseModel.fromJson(response.body ?? {});
    } else {
      return BillsResponseModel(error: 'loadBillsActivities:success:false');
    }
  }
}
