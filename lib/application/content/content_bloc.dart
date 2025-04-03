import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/infrastructure/repository/content_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/infrastructure/services/log_service.dart';

part 'content_bloc.freezed.dart';
part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentServiceRepo _repository;

  ContentBloc(this._repository) : super(const ContentState()) {
    on<_FetchContent>(_fetchContent);
  }

  FutureOr<void> _fetchContent(
    _FetchContent event,
    Emitter<ContentState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: false, success: false));
    // EasyLoading.show();

    final res = await _repository.fetchContents(type: event.type);
    res.fold(
      (error) {
        LogService.e("Error in fetching content: $error");
        EasyLoading.showError(error.message);
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        EasyLoading.dismiss();
        // Create a new map with the existing content
        final updatedContent =
            Map<String, List<ContentModel>>.from(state.contentByType);
        updatedContent[event.type] = data;
        emit(state.copyWith(
          loading: false,
          success: true,
          contentByType: updatedContent,
        ));
      },
    );
  }
}
