import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import 'package:moderator_app/app/modules/report/list/bindings/list_binding.dart';
import 'package:moderator_app/app/modules/report/list/views/list_view.dart';
import 'package:moderator_app/app/modules/report/map/bindings/map_binding.dart';
import 'package:moderator_app/app/modules/report/map/views/map_view.dart';
import 'package:moderator_app/app/modules/assignment/list/bindings/list_binding.dart';
import 'package:moderator_app/app/modules/assignment/list/views/list_view.dart';
import 'package:moderator_app/app/modules/report/moderation_history/bindings/moderation_history_binding.dart';
import 'package:moderator_app/app/modules/report/moderation_history/views/moderation_history_view.dart';
import 'package:moderator_app/app/modules/report/detail/bindings/detail_binding.dart';
import 'package:moderator_app/app/modules/report/detail/views/detail_view.dart';
import 'package:moderator_app/app/modules/policies/bindings/policies_binding.dart';
import 'package:moderator_app/app/modules/policies/views/policies_view.dart';
import 'package:moderator_app/app/modules/about/bindings/about_binding.dart';
import 'package:moderator_app/app/modules/about/views/about_view.dart';
import 'package:moderator_app/app/modules/terms/bindings/terms_binding.dart';
import 'package:moderator_app/app/modules/terms/views/terms_view.dart';
import 'package:moderator_app/app/modules/login/bindings/login_binding.dart';
import 'package:moderator_app/app/modules/login/views/login_view.dart';
import 'package:moderator_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:moderator_app/app/modules/profile/views/profile_view.dart';
import 'package:moderator_app/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:moderator_app/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:moderator_app/app/modules/change_password/bindings/change_password_binding.dart';
import 'package:moderator_app/app/modules/change_password/views/change_password_view.dart';
import 'package:moderator_app/app/modules/write_comment/bindings/write_comment_binding.dart';
import 'package:moderator_app/app/modules/write_comment/views/write_comment_view.dart';
import 'package:moderator_app/app/modules/change_report_status/bindings/change_report_status_binding.dart';
import 'package:moderator_app/app/modules/change_report_status/views/change_report_status_view.dart';
import 'package:moderator_app/app/modules/assignment/create/bindings/assignment_create_binding.dart';
import 'package:moderator_app/app/modules/assignment/create/views/assignment_create_view.dart';
import 'package:moderator_app/app/modules/notification/preset/bindings/preset_binding.dart';
import 'package:moderator_app/app/modules/notification/preset/views/preset_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.routeSplash;

  static final routes = [
    GetPage(
      name: Routes.routeSplash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.routeHome,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.routeSettings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.routeReportList,
      page: () => const ReportListView(),
      binding: ReportListBinding(),
    ),
    GetPage(
      name: Routes.routeReportMap,
      page: () => const ReportMapView(),
      binding: ReportMapBinding(),
    ),
    GetPage(
      name: Routes.routeAssignmentList,
      page: () => const AssignmentListView(),
      binding: AssignmentListBinding(),
    ),
    GetPage(
      name: Routes.routeReportModerationHistory,
      page: () => const ReportModerationHistoryView(),
      binding: ReportModerationHistoryBinding(),
    ),
    GetPage(
      name: Routes.routeReportDetail,
      page: () => const ReportDetailView(),
      binding: ReportDetailBinding(),
    ),
    GetPage(
      name: Routes.routePolicies,
      page: () => const PoliciesView(),
      binding: PoliciesBinding(),
    ),
    GetPage(
      name: Routes.routeAbout,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: Routes.routeTerms,
      page: () => const TermsView(),
      binding: TermsBinding(),
    ),
    GetPage(
      name: Routes.routeLogin,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.routeProfile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.routeForgotPassword,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.routeProfile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.routeChangePassword,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.routeWriteComment,
      page: () => const WriteCommentView(),
      binding: WriteCommentBinding(),
    ),
    GetPage(
      name: Routes.routeChangeReportStatus,
      page: () => const ChangeReportStatusView(),
      binding: ChangeReportStatusBinding(),
    ),
    GetPage(
      name: Routes.routeAssignmentCreate,
      page: () => const AssignmentCreateView(),
      binding: AssignmentCreateBinding(),
    ),
    GetPage(
      name: Routes.routeNotificationPreset,
      page: () => const NotificationPresetView(),
      binding: NotificationPresetBinding(),
    ),
  ];
}
