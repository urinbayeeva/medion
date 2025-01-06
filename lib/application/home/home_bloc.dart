import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/news_model/news_model.dart';
import 'package:medion/infrastructure/repository/home_repo.dart';

import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/infrastructure/services/log_service.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super( HomeState()) {
    on<_FetchNew>(_fetchNews);
  }

  FutureOr<void> _fetchNews(
    _FetchNew event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));

    EasyLoading.show();

    final res = await _repository.getNews();

    res.fold(
      (error) {
        LogService.e("Error in fetching booking types: $error");
        EasyLoading.showError(error.message); // Show error message
        emit(state.copyWith(loading: false, error: true)); // Update state
      },
      (data) {
        EasyLoading.dismiss();
        emit(state.copyWith(
          loading: false,
          success: true,
          news: data,
        ));
      },
    );
  }
}
