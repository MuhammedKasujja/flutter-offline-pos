import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_kalteck_pos/core/infra.dart';

import '../core/logic/cubits/cubits.dart';

class AppTabs extends StatelessWidget {
  final Function(int selectedIndex) onTabSelectd;
  final List<String> tabs;
  const AppTabs({super.key, required this.onTabSelectd, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 38.h,
        padding: EdgeInsets.all(2.r),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: BlocProvider(
          create: (context) => ToggleTabsCubit(),
          child: BlocConsumer<ToggleTabsCubit, ToggleTabsState>(
            listener: (context, state) {
              onTabSelectd(state.selectedTab);
            },
            buildWhen: (previous, current) =>
                previous.selectedTab != current.selectedTab,
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: tabs
                    .asMap()
                    .entries
                    .map(
                      (t) => Expanded(
                        child: _TabItem(
                          label: t.value,
                          index: t.key,
                          selectedIndex: state.selectedTab,
                          onToggle: (index) =>
                              context.read<ToggleTabsCubit>().changeTab(index),
                        ),
                      ),
                    )
                    .toList(growable: false),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final Function(int selectedIndex) onToggle;
  final int index;
  final int selectedIndex;
  final String label;
  const _TabItem({
    required this.index,
    required this.onToggle,
    required this.selectedIndex,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 160,
      height: 38.h,
      onPressed: () => onToggle(index),
      color: selectedIndex == index ? Colors.white : null,
      textColor: selectedIndex == index ? Colors.black : AppColors.textHint,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
