import 'package:bloc/bloc.dart';
import 'package:karbonizma/common/data/model/privacy/privacy_model.dart';
import 'package:karbonizma/common/data/repository/privacy_repo/privacy_repository.dart';
import 'package:meta/meta.dart';

part 'privacy_event.dart';
part 'privacy_state.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacyState> {
  PrivacyBloc({required this.repository}) : super(PrivacyInitial()) {
    on<PrivacyInitialEvent>((event, emit) async {
      try {
        final privacyPolicy = await repository.getPrivacy();
        if (privacyPolicy.devName.isEmpty) {
          throw Exception('Privacy Policy was NULL!');
        }
        emit(PrivacyLoadingSuccesState(privacyPolicy: privacyPolicy));
      } catch (e) {
        print(e);
        emit(PrivacyErrorState());
      }
    });
  }

  final PrivacyRepository repository;
}
