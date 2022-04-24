import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import './actions/types.dart';

class AppState {
  final bool authType;
  String errMsg;

  AppState({
    required this.authType,
    required this.errMsg,
  });

  AppState copyWith({authType, errMsg}) {
    return AppState(
        authType: authType ?? this.authType, errMsg: errMsg ?? this.errMsg);
  }
}

AppState authReducers(AppState state, dynamic action) {
  if (action is UpdateErrorAction) {
    return state.copyWith(errMsg: action.error);
  }

  switch (action) {
    case Types.switchauthtype:
      return state.copyWith(authType: !state.authType);
  }
  return state;
}

final reducers = combineReducers<AppState>([authReducers]);
