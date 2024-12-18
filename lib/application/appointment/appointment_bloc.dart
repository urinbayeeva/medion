// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:medion/infrastructure/services/log_service.dart';
// import 'package:medion/presentation/pages/appointment/appointment_page.dart';

// part 'appointment_event.dart';
// part 'appointment_state.dart';

// class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {

//   AppointmentBloc() : super(const AppointmentState()) {
//     on<_SetCreateReqValue>(_setCreateReqValue);
//   }

//   Future<void> _setCreateReqValue(
//       _SetCreateReqValue event, Emitter<AppointmentState> emit) async {
//     switch (event.type) {
//       case AddAppointmentScreenType.allServices:
       
//         emit(state.copyWith(screenType: AddAppointmentScreenType.allServices));
//         break;

//       case AddAppointmentScreenType.secondService:
      
//         emit(state.copyWith(screenType: AddAppointmentScreenType.secondService));
//         break;

//       case AddAppointmentScreenType.doctorsTime:
  
//         emit(state.copyWith(screenType: AddAppointmentScreenType.doctorsTime));
//         break;

//       case AddAppointmentScreenType.fourthService:
   
//         emit(state.copyWith(screenType: AddAppointmentScreenType.fourthService));
//         break;

//       case AddAppointmentScreenType.payment:
   
//         emit(state.copyWith(screenType: AddAppointmentScreenType.payment));
//         break;

//       default:
   
//         break;
//     }
//   }
// }