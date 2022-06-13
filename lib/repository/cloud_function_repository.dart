import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctionRepository {
  FirebaseFunctions functions = FirebaseFunctions.instance;

  //Checks if email already exists
  Future<bool> doesEmailAlreadyExist(String email) async {
    final callable = functions.httpsCallable('doesEmailAlreadyExist');
    final response = await callable.call(<String, dynamic>{'email': email});
    print(response);
    print(response.data);
    return (response.data as bool);
  }

  ///Checks if Alg address already exists
  Future<bool> doesAddressAlreadyExist(String address) async {
    final callable = functions.httpsCallable('doesAddressAlreadyExist');
    final response =
        await callable.call(<String, dynamic>{'algoWalletAddress': address});
    return (response.data as bool);
  }
}
