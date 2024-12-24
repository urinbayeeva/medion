part of 'profile_bloc.dart';


@immutable
@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();

  const factory ProfileState(
      {
  
      @Default(null) String? pickedImagePath,
  })  = _ProfileState;
     
}

