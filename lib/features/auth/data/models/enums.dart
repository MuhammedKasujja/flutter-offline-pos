enum AuthenticationStatus { unknown, authenticated, guest }


extension AuthenticationStatusX on AuthenticationStatus{

  bool get isUnknown => this == AuthenticationStatus.unknown;

  bool get isAuthenticated => this == AuthenticationStatus.authenticated;

  bool get isGuest => this == AuthenticationStatus.guest;
}