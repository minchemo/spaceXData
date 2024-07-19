import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacexdata/models/launch.dart';
import 'package:spacexdata/services/api_services.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final launchesProvider = FutureProvider<List<Launch>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.fetchLaunches();
});
