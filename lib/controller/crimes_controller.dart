import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:pocket_law/model/Crimes.dart';

import '../constants.dart';


class CrimesController extends GetxController {
  // Initialize Dio (or inject it via the constructor if needed)

  final Rxn<Crimes> crimesData = Rxn<Crimes>();
  final RxString searchQuery = RxString('');
  final TextEditingController searchController = TextEditingController();
  final RxBool isLoading = false.obs;

  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseURL,
  ));

  List<Data> get filteredCrimes {
    final allCrimes = crimesData.value?.data ?? [];
    if (searchQuery.isEmpty) return allCrimes;

    return allCrimes.where((crime) {
      final name = crime.name?.toLowerCase() ?? '';
      final description = crime.description?.toLowerCase() ?? '';
      return name.contains(searchQuery.value.toLowerCase()) ||
          description.contains(searchQuery.value.toLowerCase());
    }).toList();
  }

  void searchCrimes(String query) {
    searchQuery.value = query;
  }
  /// Fetches crimes from the API.
  Future<Crimes?> getCrimes() async {


    try {
      isLoading(true);
      final response = await _dio.request(
        '/crimes',
        options: Options(method: 'GET'),
      );

      // If the request is successful (HTTP 200).
      if (response.statusCode == 200) {

        // Parse the response data using your model.
        final Crimes fetchedCrimes = Crimes.fromJson(response.data);

        // Update the observable.
        crimesData.value = fetchedCrimes;
        return fetchedCrimes;
      }
      // Check for token expiration or other error indicators.
      else if (response.data['error'] == "Token Expired") {
        Get.offNamed('/login'); // Update with your login route name.
        Get.snackbar('Error', 'Token Expired');
        return null;
      } else {
        Get.snackbar('Error', 'An unexpected error occurred');
        return null;
      }
    } catch (e) {

      print('Exception: $e');
      Get.snackbar('Exception', e.toString());
      return null;
    }finally{
      isLoading(false);
    }

  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
