import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/models/search/search_model.dart';
import 'package:medion/infrastructure/repository/search_repo.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/pages/home/search/search_page.dart';

part 'search_bloc.freezed.dart';

part 'search_event.dart';

part 'search_state.dart';

enum SearchTypeEnum {
  all(title: "all"),
  services(title: "services"),
  directions(title: "directions"),
  news(title: "news"),
  doctors(title: "doctors"),
  articles(title: "articles"),
  discounts(title: "discounts"),
  branches(title: "branches");

  final String title;

  const SearchTypeEnum({required this.title});

  bool get isService => this == SearchTypeEnum.services;

  bool get isDirections => this == SearchTypeEnum.directions;

  bool get isNews => this == SearchTypeEnum.news;

  bool get isDoctors => this == SearchTypeEnum.doctors;

  bool get isArticles => this == SearchTypeEnum.articles;

  bool get isDiscounts => this == SearchTypeEnum.discounts;

  bool get isBranches => this == SearchTypeEnum.branches;
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _repository;

  SearchBloc(this._repository) : super(const SearchState()) {
    on<_SearchData>(_searchData);
  }

  FutureOr<void> _searchData(_SearchData event, Emitter<SearchState> emit) async {
    emit(state.copyWith(loading: true, error: false, success: false));
    // EasyLoading.show();

    final res = await _repository.searchData(event.request);
    res.fold(
      (error) {
        LogService.e("Error in search: $error");
        emit(state.copyWith(loading: false, error: true));
      },
      (data) {
        final buttons = <SearchButtonFields>[
          SearchButtonFields(
            type: SearchTypeEnum.all,
            itemKey: GlobalKey(),
            title: "all",
            count: -1,
            canShow: true,
          ),
          SearchButtonFields(
            type: SearchTypeEnum.services,
            itemKey: GlobalKey(),
            title: "services",
            count: data.first.services.length,
            canShow: data.isNotEmpty && data.first.services.isNotEmpty,
          ),
          SearchButtonFields(
            type: SearchTypeEnum.directions,
            itemKey: GlobalKey(),
            title: "directions",
            count: data.first.categories.length,
            canShow: data.isNotEmpty && data.first.categories.isNotEmpty,
          ),
          SearchButtonFields(
            type: SearchTypeEnum.news,
            itemKey: GlobalKey(),
            title: "news",
            count: data.first.news.length,
            canShow: data.isNotEmpty && data.first.news.isNotEmpty,
          ),
          SearchButtonFields(
            type: SearchTypeEnum.doctors,
            itemKey: GlobalKey(),
            title: "doctors",
            count: data.first.doctors.length,
            canShow: data.isNotEmpty && data.first.doctors.isNotEmpty,
          ),
          SearchButtonFields(
            type: SearchTypeEnum.articles,
            itemKey: GlobalKey(),
            title: "articles",
            count: data.first.articles.length,
            canShow: data.isNotEmpty && data.first.articles.isNotEmpty,
          ),
          SearchButtonFields(
            type: SearchTypeEnum.branches,
            itemKey: GlobalKey(),
            title: "branches",
            count: data.first.branches.length,
            canShow: data.isNotEmpty && data.first.branches.isNotEmpty && false,
          ),
          SearchButtonFields(
            type: SearchTypeEnum.branches,
            itemKey: GlobalKey(),
            title: "discounts",
            count: data.first.branches.length,
            canShow: data.isNotEmpty && data.first.discounts.isNotEmpty,
          ),
        ];

        emit(state.copyWith(
          loading: false,
          success: true,
          buttons: buttons,
          results: data,
        ));
      },
    );
  }
}
