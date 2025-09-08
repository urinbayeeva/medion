import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/repository/doctor_repository.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/utils/enums/doctor_info_enum.dart';

part 'doctors_bloc.freezed.dart';

part 'doctors_event.dart';

part 'doctors_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository _repository;

  DoctorBloc(this._repository) : super(const DoctorState()) {
    on<_FetchDoctors>(_fetchDoctors);
    on<_FetchDoctorDetails>(_fetchDoctorDetails);
    on<_FetchDoctorsJob>(_fetchDoctorsJob);
  }

  FutureOr<void> _fetchDoctors(_FetchDoctors event, Emitter<DoctorState> emit) async {
    emit(state.copyWith(fetchDoctors: FormzSubmissionStatus.initial));

    final res = await _repository.fetchDoctors();
    res.fold(
      (error) {
        LogService.e("Error in fetching doctors: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(fetchDoctors: FormzSubmissionStatus.failure));
      },
      (data) {
        final filterList = <String>{};
        final doctorList = <DoctorData>[...?data.doctorData];
        for (var o in doctorList) {
          filterList.add(o.specialty.toString());
        }

        EasyLoading.dismiss();
        emit(state.copyWith(
          doctorsFilterList: filterList.toList(),
          fetchDoctors: FormzSubmissionStatus.success,
          doctors: data,
        ));
      },
    );
  }

  FutureOr<void> _fetchDoctorDetails(_FetchDoctorDetails event, Emitter<DoctorState> emit) async {
    emit(state.copyWith(
      doctorInfoItems: [],
      doctorDetails: null,
      doctorSingleStatus: FormzSubmissionStatus.inProgress,
    ));

    final res = await _repository.getDoctorDetailInfo(event.doctorId);

    res.fold(
      (error) {
        emit(state.copyWith(
          doctorSingleStatus: FormzSubmissionStatus.failure,
        ));
      },
      (doctor) {
        final doctorInfo = [
          DoctorsInfo(
            canSee: doctor.decodedDescription.isNotEmpty,
            title: "about_the_doctor",
            itemKey: GlobalKey(),
            checker: DoctorInfoEnum.about,
          ),
          DoctorsInfo(
            canSee: doctor.workSchedule.friday.isNotEmpty ||
                doctor.workSchedule.monday.isNotEmpty ||
                doctor.workSchedule.tuesday.isNotEmpty ||
                doctor.workSchedule.wednesday.isNotEmpty ||
                doctor.workSchedule.saturday.isNotEmpty ||
                doctor.workSchedule.thursday.isNotEmpty,
            title: "working_hours",
            itemKey: GlobalKey(),
            checker: DoctorInfoEnum.workTime,
          ),
          DoctorsInfo(
            canSee: doctor.experience.isNotEmpty,
            title: "working_experience",
            itemKey: GlobalKey(),
            checker: DoctorInfoEnum.experience,
          ),
          DoctorsInfo(
            canSee: doctor.discount.isNotEmpty,
            title: "discounts",
            itemKey: GlobalKey(),
            checker: DoctorInfoEnum.discount,
          ),
          DoctorsInfo(
            canSee: doctor.education.isNotEmpty,
            title: "education",
            itemKey: GlobalKey(),
            checker: DoctorInfoEnum.education,
          ),
          DoctorsInfo(
            canSee: doctor.award.isNotEmpty,
            title: "achievments",
            itemKey: GlobalKey(),
            checker: DoctorInfoEnum.achievements,
          ),
          DoctorsInfo(
            canSee: doctor.galleryItems.isNotEmpty,
            title: "gallery",
            itemKey: GlobalKey(),
            checker: DoctorInfoEnum.gallery,
          ),
          DoctorsInfo(
            canSee: doctor.reviews.isNotEmpty,
            title: "reviews",
            itemKey: GlobalKey(),
            checker: DoctorInfoEnum.reviews,
          ),
          DoctorsInfo(
            canSee: doctor.articles.isNotEmpty,
            title: "articles",
            itemKey: GlobalKey(),
            checker: DoctorInfoEnum.articles,
          ),
        ];
        emit(state.copyWith(
          doctorSingleStatus: FormzSubmissionStatus.success,
          doctorInfoItems: doctorInfo,
          doctorDetails: doctor,
        ));
      },
    );
  }

  FutureOr<void> _fetchDoctorsJob(_FetchDoctorsJob event, Emitter<DoctorState> emit) async {
    emit(state.copyWith(fetchDoctorsJobs: FormzSubmissionStatus.initial));
    // EasyLoading.show();

    final res = await _repository.getDoctorsJob();
    res.fold(
      (error) {
        LogService.e("Error in fetching doctors: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(fetchDoctorsJobs: FormzSubmissionStatus.failure));
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          fetchDoctorsJobs: FormzSubmissionStatus.success,
          doctorsJob: data.toList(),
        ));
      },
    );
  }
}
