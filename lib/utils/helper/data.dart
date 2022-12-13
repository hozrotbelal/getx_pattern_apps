import 'package:ezcartapp/data/remote/model/local_areas/local_areas.dart';
import 'package:ezcartapp/data/remote/model/sub_districts/sub_districts.dart';
import 'package:flutter/cupertino.dart';
import 'package:ezcartapp/constants.dart';

class DataUtil {
  static bool shouldShowReviewerCount(int? reviewerCount) {
    return reviewerCount != null && reviewerCount > 0;
  }

  static Color getStatusColor(String status) {
    Color statusColor = colorLightGray2;

    switch (status.trim()) {
      case pending:
        statusColor = colorLightOrange1;
        break;

      case confirmed:
        statusColor = colorStepComplete;
        break;

      case delivered:
        statusColor = colorLightGreen1;
        break;

      case processing:
        statusColor = colorPurple;
        break;

      case hold:
        statusColor = colorItemActiveBackground;
        break;

      case returned:
        statusColor = colorLightGray3;
        break;
      case canceled:
        statusColor = colorLightGray2;
        break;
      default:
        break;
    }

    return statusColor;
  }

  static bool validateEmail(String value) {
    String? pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  static SubDistricts? getSubDistrictsByById(List<SubDistricts> subDistrictsList, String id) {
    SubDistricts? subDistricts;
    if (subDistrictsList.isNotEmpty) {
      for (var subDistrict in subDistrictsList) {
        if (subDistrict.id.toString() == id) {
          subDistricts = subDistrict;
        }
      }
      return subDistricts;
    }
    return subDistricts;
  }

  static SubDistricts? getSubDistrictsByPartialName(List<SubDistricts> subDistrictsList, String partialName) {
    SubDistricts? subDistrict;
    if (subDistrictsList.isNotEmpty) {
      for (var localAreas in subDistrictsList) {
        if (localAreas.name!.trim() == partialName) {
          subDistrict = localAreas;
        }
      }
      return subDistrict!;
    }
    return null;
  }

  static LocalAreas? getLocalAreasById(List<LocalAreas> localAreasList, String id) {
    LocalAreas? localArea;
    if (localAreasList.isNotEmpty) {
      for (var localAreas in localAreasList) {
        if (localAreas.id.toString() == id) {
          localArea = localAreas;
        }
      }
      return localArea;
    }
    return localArea;
  }

  static LocalAreas? getLocalAreasByPartialName(List<LocalAreas> localAreasList, String partialName) {
    LocalAreas? localArea;
    if (localAreasList.isNotEmpty) {
      for (var localAreas in localAreasList) {
        if (localAreas.name!.trim() == partialName) {
          localArea = localAreas;
        }
      }
      return localArea;
    }
    return localArea;
  }
}
