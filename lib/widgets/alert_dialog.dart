
import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/core/infra.dart';
import 'package:offline_kalteck_pos/widgets/extensions/extensions.dart';
import 'custom_button.dart';

class AppAlertDialog extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? body;
  final Function? onAction;
  final String btnText;
  final bool isNotification;
  const AppAlertDialog({
    super.key,
    required this.icon,
    required this.title,
    this.body,
     this.onAction,
    required this.btnText,
    this.isNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(20.r),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min, // prevent Column to expand full height
        children: [
          SizedBox(
            width: 63.w,
            height: 65.h,
            child: icon,
          ),
          const SizedBox().medium(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isNotification ? 16.sp : 20.sp,
              height: 1.15,
              color: AppColors.text1,
              fontWeight: isNotification ? FontWeight.w600 : FontWeight.w700,
              letterSpacing: -0.2.sp,
            ),
          ),
          ..._buildBody(),
          const SizedBox().medium(),
          CustomButton(
            onPressed: () {
              Navigator.pop(context);
              if (onAction != null) onAction!();
            },
            label: btnText,
          )
        ],
      ),
    );
  }

  List<Widget> _buildBody() {
    return body != null
        ? <Widget>[
            const SizedBox().scaleHeight(12),
            Text(body!).label(textAlign: TextAlign.center),
          ]
        : [
            const SizedBox.shrink(),
          ];
  }
}

class SmartDialog extends StatelessWidget {
  const SmartDialog({
    Key? key,
    required this.title,
    this.titlePadding,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.actions = const [],
  }) : super(key: key);

  final Widget title;
  final EdgeInsetsGeometry? titlePadding;
  final Widget? content;
  final EdgeInsetsGeometry contentPadding;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];

    children.add(Padding(
      padding: titlePadding ??
          EdgeInsets.fromLTRB(24.0, 24.0, 24.0, content == null ? 20.0 : 0.0),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.titleMedium!,
        child: Semantics(namesRoute: true, child: title),
      ),
    ));

    if (content != null) {
      children.add(Flexible(
        child: Padding(
          padding: contentPadding,
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodySmall!,
            child: content ?? const SizedBox.shrink(),
          ),
        ),
      ));
    }

    children.add(
      ButtonTheme(
        child: ButtonBar(
          children: actions,
        ),
      ),
    );

    Widget dialogChild = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );

    dialogChild = Semantics(namesRoute: true, child: dialogChild);

    return Dialog(child: dialogChild);
  }
}
