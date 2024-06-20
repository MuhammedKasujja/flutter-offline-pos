import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_tabs_state.dart';

class ToggleTabsCubit extends Cubit<ToggleTabsState> {
  ToggleTabsCubit() : super(const ToggleTabsSelected(0));

  void changeTab(int selectedTab) => emit(ToggleTabsSelected(selectedTab));
}
