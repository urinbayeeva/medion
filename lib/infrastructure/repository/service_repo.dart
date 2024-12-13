// import 'package:dartz/dartz.dart';
// import 'package:medion/domain/common/failure.dart';
// import 'package:medion/domain/models/service_model/service_model.dart';
// import 'package:medion/infrastructure/apis/apis.dart';
// import 'package:medion/infrastructure/services/log_service.dart';
// import 'dart:developer';

// import 'package:dartz/dartz.dart';

// class ServiceRepository implements ICarFacade {
//   final MedService _service;


//   ServiceRepository(
//     this._service,

//   );

//   @override
//   Future<Either<ResponseFailure, ServiceResResult>> getServiceTypes(
//       {int? id, String? name, String? icon}) async {
//     try {
//       final res = await _service.getServiceTypes(
//         id: id, name: name, icon: icon
//         );
//       if (res.isSuccessful) {
//         return right(res.body!);
//       } else {
//         return left(InvalidCredentials(message: 'invalid_credential'));
//       }
//     } catch (e) {
//       LogService.e(" ----> error on repo  : ${e.toString()}");
//       return left(handleError(e));
//     }
//   }
// }
