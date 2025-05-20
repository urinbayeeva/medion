import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/search/search_model.dart';

import 'package:medion/infrastructure/repository/search_repo.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/infrastructure/services/log_service.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _repository;

  SearchBloc(this._repository) : super(const SearchState()) {
    on<_SearchData>(_searchData);
  }

  FutureOr<void> _searchData(
    _SearchData event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));
    // EasyLoading.show();

    final res = await _repository.searchData(event.request);
    res.fold(
      (error) {
        LogService.e("Error in search: $error");
        // EasyLoading.showError(error.message);
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        // EasyLoading.dismiss();f
        emit(state.copyWith(
          loading: false,
          success: true,
          results: data,
        ));
      },
    );
  }
}
