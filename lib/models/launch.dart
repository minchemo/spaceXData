class Launch {
  int? flightNumber;
  String? missionName;
  List<dynamic> missionId;
  bool? upcoming;
  String? launchYear;
  int? launchDateUnix;
  DateTime launchDateUtc;
  DateTime launchDateLocal;
  bool? isTentative;
  String? tentativeMaxPrecision;
  bool? tbd;
  int? launchWindow;
  Rocket rocket;
  List<dynamic> ships;
  Telemetry telemetry;
  LaunchSite launchSite;
  bool? launchSuccess;
  LaunchFailureDetails? launchFailureDetails;
  Links links;
  String? details;
  String? staticFireDateUtc;
  int? staticFireDateUnix;
  Timeline? timeline;
  dynamic crew;

  Launch({
    required this.flightNumber,
    required this.missionName,
    required this.missionId,
    required this.upcoming,
    required this.launchYear,
    required this.launchDateUnix,
    required this.launchDateUtc,
    required this.launchDateLocal,
    required this.isTentative,
    required this.tentativeMaxPrecision,
    required this.tbd,
    required this.launchWindow,
    required this.rocket,
    required this.ships,
    required this.telemetry,
    required this.launchSite,
    required this.launchSuccess,
    required this.launchFailureDetails,
    required this.links,
    required this.details,
    required this.staticFireDateUtc,
    required this.staticFireDateUnix,
    required this.timeline,
    required this.crew,
  });

  factory Launch.fromJson(Map<String, dynamic> json) => Launch(
        flightNumber: json['flight_number'],
        missionName: json['mission_name'],
        missionId: List<dynamic>.from(json['mission_id']),
        upcoming: json['upcoming'],
        launchYear: json['launch_year'],
        launchDateUnix: json['launch_date_unix'],
        launchDateUtc: DateTime.parse(json['launch_date_utc']),
        launchDateLocal: DateTime.parse(json['launch_date_local']),
        isTentative: json['is_tentative'],
        tentativeMaxPrecision: json['tentative_max_precision'],
        tbd: json['tbd'],
        launchWindow: json['launch_window'],
        rocket: Rocket.fromJson(json['rocket']),
        ships: List<dynamic>.from(json['ships']),
        telemetry: Telemetry.fromJson(json['telemetry']),
        launchSite: LaunchSite.fromJson(json['launch_site']),
        launchSuccess: json['launch_success'],
        launchFailureDetails: json['launch_failure_details'] != null ? LaunchFailureDetails.fromJson(json['launch_failure_details']) : null,
        links: Links.fromJson(json['links']),
        details: json['details'] ?? '',
        staticFireDateUtc: json['static_fire_date_utc'],
        staticFireDateUnix: json['static_fire_date_unix'],
        timeline: json['timeline'] != null ? Timeline.fromJson(json['timeline']) : null,
        crew: json['crew'],
      );

  Map<String, dynamic> toJson() => {
        'flight_number': flightNumber,
        'mission_name': missionName,
        'mission_id': List<dynamic>.from(missionId),
        'upcoming': upcoming,
        'launch_year': launchYear,
        'launch_date_unix': launchDateUnix,
        'launch_date_utc': launchDateUtc.toIso8601String(),
        'launch_date_local': launchDateLocal.toIso8601String(),
        'is_tentative': isTentative,
        'tentative_max_precision': tentativeMaxPrecision,
        'tbd': tbd,
        'launch_window': launchWindow,
        'rocket': rocket.toJson(),
        'ships': List<dynamic>.from(ships),
        'telemetry': telemetry.toJson(),
        'launch_site': launchSite.toJson(),
        'launch_success': launchSuccess,
        'launch_failure_details': launchFailureDetails?.toJson(),
        'links': links.toJson(),
        'details': details,
        'static_fire_date_utc': staticFireDateUtc,
        'static_fire_date_unix': staticFireDateUnix,
        'timeline': timeline?.toJson(),
        'crew': crew,
      };
}

class LaunchFailureDetails {
  int? time;
  dynamic altitude;
  String? reason;

  LaunchFailureDetails({
    required this.time,
    required this.altitude,
    required this.reason,
  });

  factory LaunchFailureDetails.fromJson(Map<String, dynamic> json) => LaunchFailureDetails(
        time: json['time'],
        altitude: json['altitude'],
        reason: json['reason'],
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'altitude': altitude,
        'reason': reason,
      };
}

class LaunchSite {
  String? siteId;
  String? siteName;
  String? siteNameLong;

  LaunchSite({
    required this.siteId,
    required this.siteName,
    required this.siteNameLong,
  });

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteId: json['site_id'],
        siteName: json['site_name'],
        siteNameLong: json['site_name_long'],
      );

  Map<String, dynamic> toJson() => {
        'site_id': siteId,
        'site_name': siteName,
        'site_name_long': siteNameLong,
      };
}

class Links {
  String? missionPatch;
  String? missionPatchSmall;
  dynamic redditCampaign;
  dynamic redditLaunch;
  dynamic redditRecovery;
  dynamic redditMedia;
  dynamic presskit;
  String? articleLink;
  String? wikipedia;
  String? videoLink;
  String? youtubeId;
  List<dynamic> flickrImages;

  Links({
    required this.missionPatch,
    required this.missionPatchSmall,
    required this.redditCampaign,
    required this.redditLaunch,
    required this.redditRecovery,
    required this.redditMedia,
    required this.presskit,
    required this.articleLink,
    required this.wikipedia,
    required this.videoLink,
    required this.youtubeId,
    required this.flickrImages,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        missionPatch: json['mission_patch'],
        missionPatchSmall: json['mission_patch_small'],
        redditCampaign: json['reddit_campaign'],
        redditLaunch: json['reddit_launch'],
        redditRecovery: json['reddit_recovery'],
        redditMedia: json['reddit_media'],
        presskit: json['presskit'],
        articleLink: json['article_link'],
        wikipedia: json['wikipedia'],
        videoLink: json['video_link'],
        youtubeId: json['youtube_id'],
        flickrImages: List<dynamic>.from(json['flickr_images']),
      );

  Map<String, dynamic> toJson() => {
        'mission_patch': missionPatch,
        'mission_patch_small': missionPatchSmall,
        'reddit_campaign': redditCampaign,
        'reddit_launch': redditLaunch,
        'reddit_recovery': redditRecovery,
        'reddit_media': redditMedia,
        'presskit': presskit,
        'article_link': articleLink,
        'wikipedia': wikipedia,
        'video_link': videoLink,
        'youtube_id': youtubeId,
        'flickr_images': List<dynamic>.from(flickrImages),
      };
}

class Rocket {
  String? rocketId;
  String? rocketName;
  String? rocketType;
  FirstStage firstStage;
  SecondStage secondStage;
  Fairings? fairings;

  Rocket({
    required this.rocketId,
    required this.rocketName,
    required this.rocketType,
    required this.firstStage,
    required this.secondStage,
    required this.fairings,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
        rocketId: json['rocket_id'],
        rocketName: json['rocket_name'],
        rocketType: json['rocket_type'],
        firstStage: FirstStage.fromJson(json['first_stage']),
        secondStage: SecondStage.fromJson(json['second_stage']),
        fairings: json['fairings'] != null ? Fairings.fromJson(json['fairings']) : null,
      );

  Map<String, dynamic> toJson() => {
        'rocket_id': rocketId,
        'rocket_name': rocketName,
        'rocket_type': rocketType,
        'first_stage': firstStage.toJson(),
        'second_stage': secondStage.toJson(),
        'fairings': fairings?.toJson(),
      };
}

class Fairings {
  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  dynamic ship;

  Fairings({
    required this.reused,
    required this.recoveryAttempt,
    required this.recovered,
    required this.ship,
  });

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json['reused'],
        recoveryAttempt: json['recovery_attempt'],
        recovered: json['recovered'],
        ship: json['ship'],
      );

  Map<String, dynamic> toJson() => {
        'reused': reused,
        'recovery_attempt': recoveryAttempt,
        'recovered': recovered,
        'ship': ship,
      };
}

class FirstStage {
  List<Core> cores;

  FirstStage({
    required this.cores,
  });

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        cores: List<Core>.from(json['cores'].map((core) => Core.fromJson(core))),
      );

  Map<String, dynamic> toJson() => {
        'cores': List<dynamic>.from(cores.map((core) => core.toJson())),
      };
}

class Core {
  String? coreSerial;
  int? flight;
  dynamic block;
  bool? gridfins;
  bool? legs;
  bool? reused;
  dynamic landSuccess;
  bool? landingIntent;
  dynamic landingType;
  dynamic landingVehicle;

  Core({
    required this.coreSerial,
    required this.flight,
    required this.block,
    required this.gridfins,
    required this.legs,
    required this.reused,
    required this.landSuccess,
    required this.landingIntent,
    required this.landingType,
    required this.landingVehicle,
  });

  factory Core.fromJson(Map<String, dynamic> json) => Core(
        coreSerial: json['core_serial'],
        flight: json['flight'],
        block: json['block'],
        gridfins: json['gridfins'],
        legs: json['legs'],
        reused: json['reused'],
        landSuccess: json['land_success'],
        landingIntent: json['landing_intent'],
        landingType: json['landing_type'],
        landingVehicle: json['landing_vehicle'],
      );

  Map<String, dynamic> toJson() => {
        'core_serial': coreSerial,
        'flight': flight,
        'block': block,
        'gridfins': gridfins,
        'legs': legs,
        'reused': reused,
        'land_success': landSuccess,
        'landing_intent': landingIntent,
        'landing_type': landingType,
        'landing_vehicle': landingVehicle,
      };
}

class SecondStage {
  int? block;
  List<Payload> payloads;

  SecondStage({
    required this.block,
    required this.payloads,
  });

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        block: json['block'],
        payloads: List<Payload>.from(json['payloads'].map((payload) => Payload.fromJson(payload))),
      );

  Map<String, dynamic> toJson() => {
        'block': block,
        'payloads': List<dynamic>.from(payloads.map((payload) => payload.toJson())),
      };
}

class Payload {
  String? payloadId;
  List<dynamic>? noradId;
  bool? reused;
  List<String>? customers;
  String? nationality;
  String? manufacturer;
  String? payloadType;
  String? payloadMassKg;
  String? payloadMassLbs;
  String? orbit;

  Payload({
    required this.payloadId,
    required this.noradId,
    required this.reused,
    required this.customers,
    required this.nationality,
    required this.manufacturer,
    required this.payloadType,
    required this.payloadMassKg,
    required this.payloadMassLbs,
    required this.orbit,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        payloadId: json['payload_id'],
        noradId: List<dynamic>.from(json['norad_id']),
        reused: json['reused'],
        customers: List<String>.from(json['customers']),
        nationality: json['nationality'],
        manufacturer: json['manufacturer'],
        payloadType: json['payload_type'],
        payloadMassKg: json['payload_mass_kg'].toString(),
        payloadMassLbs: json['payload_mass_lbs'].toString(),
        orbit: json['orbit'],
      );

  Map<String, dynamic> toJson() => {
        'payload_id': payloadId,
        'norad_id': List<dynamic>.from(noradId!),
        'reused': reused,
        'customers': List<dynamic>.from(customers!),
        'nationality': nationality,
        'manufacturer': manufacturer,
        'payload_type': payloadType,
        'payload_mass_kg': payloadMassKg,
        'payload_mass_lbs': payloadMassLbs,
        'orbit': orbit,
      };
}

class OrbitParams {
  String? referenceSystem;
  String? regime;
  dynamic longitude;
  dynamic semiMajorAxisKm;
  dynamic eccentricity;
  int? periapsisKm;
  int? apoapsisKm;
  int? inclinationDeg;
  dynamic periodMin;
  dynamic lifespanYears;
  dynamic epoch;
  dynamic meanMotion;
  dynamic raan;
  dynamic argOfPericenter;
  dynamic meanAnomaly;

  OrbitParams({
    required this.referenceSystem,
    required this.regime,
    required this.longitude,
    required this.semiMajorAxisKm,
    required this.eccentricity,
    required this.periapsisKm,
    required this.apoapsisKm,
    required this.inclinationDeg,
    required this.periodMin,
    required this.lifespanYears,
    required this.epoch,
    required this.meanMotion,
    required this.raan,
    required this.argOfPericenter,
    required this.meanAnomaly,
  });

  factory OrbitParams.fromJson(Map<String, dynamic> json) => OrbitParams(
        referenceSystem: json['reference_system'],
        regime: json['regime'],
        longitude: json['longitude'],
        semiMajorAxisKm: json['semi_major_axis_km'],
        eccentricity: json['eccentricity'],
        periapsisKm: json['periapsis_km'] ?? 0,
        apoapsisKm: json['apoapsis_km'] ?? 0,
        inclinationDeg: json['inclination_deg'] ?? 0,
        periodMin: json['period_min'],
        lifespanYears: json['lifespan_years'],
        epoch: json['epoch'],
        meanMotion: json['mean_motion'],
        raan: json['raan'],
        argOfPericenter: json['arg_of_pericenter'],
        meanAnomaly: json['mean_anomaly'],
      );

  Map<String, dynamic> toJson() => {
        'reference_system': referenceSystem,
        'regime': regime,
        'longitude': longitude,
        'semi_major_axis_km': semiMajorAxisKm,
        'eccentricity': eccentricity,
        'periapsis_km': periapsisKm,
        'apoapsis_km': apoapsisKm,
        'inclination_deg': inclinationDeg,
        'period_min': periodMin,
        'lifespan_years': lifespanYears,
        'epoch': epoch,
        'mean_motion': meanMotion,
        'raan': raan,
        'arg_of_pericenter': argOfPericenter,
        'mean_anomaly': meanAnomaly,
      };
}

class Telemetry {
  dynamic flightClub;

  Telemetry({
    required this.flightClub,
  });

  factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
        flightClub: json['flight_club'],
      );

  Map<String, dynamic> toJson() => {
        'flight_club': flightClub,
      };
}

class Timeline {
  int? webcastLiftoff;

  Timeline({
    required this.webcastLiftoff,
  });

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        webcastLiftoff: json['webcast_liftoff'],
      );

  Map<String, dynamic> toJson() => {
        'webcast_liftoff': webcastLiftoff,
      };
}
