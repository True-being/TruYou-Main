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

  ///Add users to each others confirmed matches
  Future<void> confirmedMatch(String? userUID, String? swipedUserUID) async {
    final callable = functions.httpsCallable('confirmedMatch');
    await callable.call(
        <String, dynamic>{'userUID': userUID, 'swipedUserUID': swipedUserUID});
    return;
  }

  ///Add users to each other confirmed misses
  Future<void> confirmedMiss(String? userUID, String? swipedUserUID) async {
    final callable = functions.httpsCallable('confirmedMiss');
    await callable.call(
        <String, dynamic>{'userUID': userUID, 'swipedUserUID': swipedUserUID});
    return;
  }

  ///Unmatches users from one another
  Future<void> unmatch(String? userUID, String? matchedUserUID) async {
    final callable = functions.httpsCallable('unmatch');
    await callable.call(<String, dynamic>{
      'userUID': userUID,
      'matchedUserUID': matchedUserUID
    });
    return;
  }
}
