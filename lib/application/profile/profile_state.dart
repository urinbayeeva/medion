part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();

  const factory ProfileState({
    BuildContext? context,
    String? pickedImagePath,
  }) = _ProfileState;
}
