import 'package:flutter/foundation.dart';
import 'package:moderator_app/app/utils/helpers.dart';

class AppStrings {
  static get apiUrl {
    if (devMode) {
      // if (kDebugMode) {
      //   return "http://192.168.0.4:8000";
      // }
      return devUrl;
    } else {
      return "https://service.waste-tracker.com";
    }
  }

  static const devUrl = "https://dev-1.waste-tracker.com";
  static const appName = 'Service Tracker';
  static const logo = 'assets/images/logo_color.png';
  static const googleApiKey = 'AIzaSyApyUGfwBuXA3aUocbrKVx8nMC11MWSLbI';
  static const logoWhite = "assets/images/logo.png";
  static const khmerImage = "assets/images/khmer.png";
  static const englishImage = "assets/images/english.png";
  static const grainyBackgroundImage = "assets/images/bg.jpeg";
  static const horizontalLogoImage = "assets/images/splash_foreground.png";
  static const addressImage = "assets/images/address.png";
  static const appGraphicImage = "assets/images/graphic.png";
  static const errorImage = "assets/images/error.png";
  static const forgotPasswordImage = "assets/images/forgot-password.png";

  static const clusterMarkerDefault = "assets/images/cluster_marker_blue.png";
  static const clusterMarkerPrefix = "assets/images/cluster_marker_";
  static const mapMarkerDefault = "assets/images/map_marker_moderation.png";
  static const mapMarkerPrefix = "assets/images/map_marker_";

  static const avatarPlaceholder = "assets/images/avatar-placeholder.png";
  static const reportImagePlaceholder = "assets/images/image_placeholder.png";
  static const sectorPlaceholder = "assets/images/image_placeholder.png";
  static const serviceProviderPlaceholder = "assets/images/municipality_placeholder.jpg";
  static const municipalityPlaceholder = "assets/images/municipality_placeholder.jpg";
  static const mapPlaceholder = "assets/images/map_placeholder.png";

  static const settingBox = "SETTINGS_BOX";
  static const authBox = "AUTH_BOX";
  static const version = "1.0.0";
}
