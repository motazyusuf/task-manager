import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository = AuthRepository();

  AuthBloc() : super(AuthInitial()) {
    Future<void> onAuth(event, emit) async {
      final result = await authRepository.signInWithGoogle();
      result.fold((left) {
        emit(SignInFail(left.errorMessage));
      }, (right) {
        if (right != null) {
          emit(SignInSuccess(right));
        } else {
          emit(UserCancelled());
        }
      });
    }

    on<AuthEvent>(onAuth);
  }
}
