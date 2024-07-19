import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:spacexdata/providers/launch_provider.dart';

class LaunchListScreen extends ConsumerWidget {
  const LaunchListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final launchesAsyncValue = ref.watch(launchesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          'SpaceX Launches'.toUpperCase(),
          style: GoogleFonts.spaceMono(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: launchesAsyncValue.when(
        data: (launches) => ListView.builder(
          itemCount: launches.length,
          itemBuilder: (context, index) {
            final launch = launches[index];
            return ListTile(
              leading: SizedBox(
                width: 32,
                child: Image.network(
                  launch.links.missionPatchSmall ?? '',
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return const Center(
                      child: SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
              trailing: Text(launch.flightNumber.toString(), style: GoogleFonts.bungee(fontSize: 12, height: 0, color: Colors.black.withOpacity(.1))),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(launch.missionName!, style: GoogleFonts.spaceMono(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)))
                ],
              ),
              subtitle: Text('${launch.rocket.rocketName!} / Launch: ${DateFormat('yyyy-MM-dd hh:mm').format(launch.launchDateUtc.toLocal())}',
                  style: GoogleFonts.spaceMono(fontSize: 10)),
              onTap: () {
                context.push('/launches/$index');
              },
            );
          },
        ),
        loading: () => const Center(
            child: CircularProgressIndicator(
          strokeWidth: 1,
          color: Colors.black,
        )),
        error: (err, stack) {
          return Center(child: Text('Error: $err'));
        },
      ),
    );
  }
}
