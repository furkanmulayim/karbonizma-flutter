part of 'privacy_bloc.dart';

@immutable
abstract class PrivacyState {}

class PrivacyInitial extends PrivacyState {}

class PrivacyLoadingSuccesState extends PrivacyState {
  final PrivacyModel privacyPolicy;

  PrivacyLoadingSuccesState({required this.privacyPolicy});
}

class PrivacyLoadingState extends PrivacyState {}

class PrivacyErrorState extends PrivacyState {}
