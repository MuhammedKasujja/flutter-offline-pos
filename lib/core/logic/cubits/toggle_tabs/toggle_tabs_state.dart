part of 'toggle_tabs_cubit.dart';

abstract class ToggleTabsState extends Equatable {
  const ToggleTabsState(this.selectedTab);
  final int selectedTab;

  @override
  List<Object> get props => [selectedTab];
}

class ToggleTabsSelected extends ToggleTabsState {
  const ToggleTabsSelected(super.selectedTab);
}
