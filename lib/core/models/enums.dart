enum AppState {
  init,
  loading,
  success,
  failure,
}

extension AppStateX on AppState{
  bool get isInitial  => this == AppState.init;

  bool get isLoading  => this == AppState.loading;

  bool get isSuccess  => this == AppState.success;

  bool get isFailure  => this == AppState.failure;
}