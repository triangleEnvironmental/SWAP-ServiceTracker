import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/locales/index.dart';

class HomeLayout extends StatefulWidget {
  final Widget child;
  final String routeName;

  const HomeLayout({
    Key? key,
    required this.child,
    required this.routeName,
  }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late AuthService authService;

  int getActiveIndex(Map<String, NavigationDestination> destinationMaps) {
    if (destinationMaps.containsKey(widget.routeName)) {
      return destinationMaps.keys.toList().indexOf(widget.routeName);
    }
    return 0;
  }

  @override
  void initState() {
    authService = Get.find<AuthService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService.listenable,
      builder: (context, _, __) {
        final destinationMaps = <String, NavigationDestination>{
          Routes.routeHome: NavigationDestination(
            icon: const Icon(
              AppIcons.home,
            ),
            label: LocaleKeys.label_home,
            tooltip: LocaleKeys.label_home,
          ),
          Routes.routeReportList: NavigationDestination(
            icon: const Icon(
              AppIcons.report,
            ),
            label: LocaleKeys.label_reports,
            tooltip: LocaleKeys.label_reports,
          ),
          Routes.routeReportMap: NavigationDestination(
            icon: const Icon(
              AppIcons.map,
            ),
            label: LocaleKeys.label_map,
            tooltip: LocaleKeys.label_map,
          ),
          Routes.routeAssignmentList: NavigationDestination(
            icon: const Icon(
              AppIcons.assignment,
            ),
            label: LocaleKeys.label_assign_to_me,
            tooltip: LocaleKeys.label_assign_to_me,
          ),
          Routes.routeReportModerationHistory: NavigationDestination(
            icon: const Icon(
              AppIcons.history,
            ),
            label: LocaleKeys.label_history,
            tooltip: LocaleKeys.label_history,
          ),
        };

        return Scaffold(
          body: widget.child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: 0,
            onDestinationSelected: (index) {
              if (index > 0) {
                Get.toNamed(
                  destinationMaps.keys.toList()[index],
                );
              }
            },
            destinations: destinationMaps.values.toList(),
          ),
        );
      },
    );
  }
}
