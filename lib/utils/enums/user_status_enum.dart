enum UserStatus {
  authed,
  unknown,
  unAuthed;

  bool get isAuthed => this == UserStatus.authed;

  bool get isUnAuthed => this == UserStatus.unAuthed;

  bool get isUnknown => this == UserStatus.unknown;
}
