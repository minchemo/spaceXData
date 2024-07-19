import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:spacexdata/models/launch.dart';
import 'package:spacexdata/providers/launch_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchDetailScreen extends ConsumerWidget {
  final int launchIndex;

  const LaunchDetailScreen({super.key, required this.launchIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final launchesAsyncValue = ref.watch(launchesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: launchesAsyncValue.when(
          data: (launches) {
            final launch = launches[launchIndex];
            return Text(
              '${launch.missionName!} / Launch Details',
              style: GoogleFonts.spaceMono(fontSize: 14, fontWeight: FontWeight.bold),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            return Center(child: Text('Error: $err'));
          },
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: launchesAsyncValue.when(
        data: (launches) {
          final launch = launches[launchIndex];
          return Stack(
            children: [
              Positioned(
                  bottom: 10,
                  right: 20,
                  child: Text(
                    launch.flightNumber.toString(),
                    style: GoogleFonts.bungee(fontSize: 72, height: 0, color: Colors.black.withOpacity(.1)),
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    missionPatch(context, launch),
                    const SizedBox(height: 40),
                    missionName(launch),
                    const SizedBox(height: 8),
                    RocketInfo(launch),
                    missionLinks(launch),
                    const SizedBox(height: 40),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/SpaceX_logo_black.svg/1280px-SpaceX_logo_black.svg.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) {
          return Center(child: Text('Error: $err'));
        },
      ),
    );
  }

  Row missionLinks(Launch launch) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              launchURL(urlString: launch.links.videoLink!);
            },
            icon: const Icon(Icons.smart_display_rounded)),
        IconButton(
            onPressed: () {
              launchURL(urlString: launch.links.articleLink!);
            },
            icon: const Icon(Icons.language_rounded)),
        IconButton(
            onPressed: () {
              launchURL(urlString: launch.links.wikipedia!);
            },
            icon: const Icon(Icons.library_books_rounded)),
      ],
    );
  }

  Widget RocketInfo(Launch launch) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('''
Rocket: ${launch.rocket.rocketName!}
Rocket Type: ${launch.rocket.rocketType!}
Launch Date: ${DateFormat('yyyy-MM-dd hh:mm').format(launch.launchDateUtc.toLocal())}
Launch Site: ${launch.launchSite.siteName!}
            ''',  style: GoogleFonts.spaceMono(fontSize: 10, height: 1.5)),
        SizedBox(
          child: Text(
            '${launch.details}',
            textAlign: TextAlign.justify,
            style: GoogleFonts.openSans(fontSize: 10, height: 1.5, color: Colors.black.withOpacity(.5)),
          ),
        )
      ],
    );
  }

  Container missionName(Launch launch) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(launch.missionName!, style: GoogleFonts.spaceMono(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)));
  }

  Center missionPatch(BuildContext context, Launch launch) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.3,
        child: Image.network(
          launch.links.missionPatchSmall ?? '',
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return const Center(
              child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> launchURL({required String urlString}) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
