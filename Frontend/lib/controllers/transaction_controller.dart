import 'package:frontend/data/api/api_handlers/api_handler.dart';
import 'package:frontend/data/data.dart';
import 'package:frontend/data/models/unbroadcasted_transactions.dart';
import 'package:frontend/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionController extends GetxController {
  final CoSignApi _coSignApi = CoSignApi(baseUrl);

  CreateTransaction? createTransaction;
  BroadcastTransaction? broadcastTransaction;
  GetAllTransactions? getAllTransactions;
  UnbroadcastedTransactions? unbroadcastedTransactions;
  TransactionDetails? transactionDetails;

  bool isLoading = false;

  String? userToken;

  getCurrentToken() async {
    final SharedPreferences localStorage =
        await SharedPreferences.getInstance();
    userToken = localStorage.getString(tokenResponse);
    print(userToken);
  }

  Future<String> createTransactionQuery(
      Map<String, dynamic> createTransactionDetails) async {
    await getCurrentToken();
    const endPoint = '$baseUrl/transactions/';
    final response = await _coSignApi.post(endPoint,
        body: createTransactionDetails, token: userToken);
    print(response?.statusCode);
    if (response?.statusCode == 200) {
      final createTransaction = CreateTransaction.fromJson(response!.data);
      final transactionId = createTransaction.transactionId;
      showToastAnyWhere('Sent Succefully');
      update();
      return Future.value(transactionId);
    }

    return Future.value('');
  }

  broadcastTransactionQuery(
      int? id, Map<String, dynamic> broadcastTransactionDetails) async {
    getCurrentToken();
    isLoading = true;
    update();
    final endPoint = '$baseUrl/transactions/$id/broadcast/';
    final response = await _coSignApi.post(endPoint,
        body: broadcastTransactionDetails, token: userToken);
    if (response?.statusCode == 200) {
      isLoading = false;
      update();
      return Future.value(false);
    }
    isLoading = true;
    return Future.value(false);
  }

  unbroadcastedTransactionsQuery() async {
    await getCurrentToken();
    isLoading = true;
    update();
    const endPoint = '$baseUrl/transactions/unbroadcast/';
    final response = await _coSignApi.get(endPoint, token: userToken);
    print(response);
    if (response?.statusCode == 200) {
      isLoading = false;
      update();
      unbroadcastedTransactions =
          UnbroadcastedTransactions.fromJson(response.data);
    }
    return unbroadcastedTransactions;
  }

  getAllTransactionsQuery() async {
    await getCurrentToken();
    isLoading = true;
    update();
    const endPoint = '$baseUrl/transactions/all/';
    final response = await _coSignApi.get(endPoint, token: userToken);
    print(response);
    if (response?.statusCode == 200) {
      isLoading = false;
      update();
      getAllTransactions = GetAllTransactions.fromJson(response.data);
    }
    return getAllTransactions;
  }

  transactionDetailsQuery(int? id) async {
    getCurrentToken();
    isLoading = true;
    update();
    final endPoint = '$baseUrl/transactions/$id/';
    final response = await _coSignApi.get(endPoint, token: userToken);
    if (response?.statusCode == 200) {
      isLoading = false;
      update();
      transactionDetails = TransactionDetails.fromJson(response.data);
    }
    return transactionDetails;
  }
}
