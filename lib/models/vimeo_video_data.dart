// To parse this JSON data, do
//
//     final videoData = videoDataFromJson(jsonString);

import 'dart:convert';

class VideoData {
  String uri;
  String name;
  dynamic description;
  String type;
  String link;
  int duration;
  int width;
  dynamic language;
  int height;
  Embed embed;
  DateTime createdTime;
  DateTime modifiedTime;
  DateTime releaseTime;
  List<String> contentRating;
  dynamic license;
  Privacy privacy;
  Pictures pictures;
  List<dynamic> tags;
  Stats stats;
  List<dynamic> categories;
  VideoDataMetadata metadata;
  User user;
  ReviewPage reviewPage;
  dynamic parentFolder;
  DateTime lastUserActionEventDate;
  List<Download> files;
  List<Download> download;
  App app;
  String status;
  String resourceKey;
  Upload upload;
  Transcode transcode;

  VideoData({
    this.uri,
    this.name,
    this.description,
    this.type,
    this.link,
    this.duration,
    this.width,
    this.language,
    this.height,
    this.embed,
    this.createdTime,
    this.modifiedTime,
    this.releaseTime,
    this.contentRating,
    this.license,
    this.privacy,
    this.pictures,
    this.tags,
    this.stats,
    this.categories,
    this.metadata,
    this.user,
    this.reviewPage,
    this.parentFolder,
    this.lastUserActionEventDate,
    this.files,
    this.download,
    this.app,
    this.status,
    this.resourceKey,
    this.upload,
    this.transcode,
  });

  factory VideoData.fromRawJson(String str) =>
      VideoData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
        uri: json["uri"] == null ? null : json["uri"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"],
        type: json["type"] == null ? null : json["type"],
        link: json["link"] == null ? null : json["link"],
        duration: json["duration"] == null ? null : json["duration"],
        width: json["width"] == null ? null : json["width"],
        language: json["language"],
        height: json["height"] == null ? null : json["height"],
        embed: json["embed"] == null ? null : Embed.fromJson(json["embed"]),
        createdTime: json["created_time"] == null
            ? null
            : DateTime.parse(json["created_time"]),
        modifiedTime: json["modified_time"] == null
            ? null
            : DateTime.parse(json["modified_time"]),
        releaseTime: json["release_time"] == null
            ? null
            : DateTime.parse(json["release_time"]),
        contentRating: json["content_rating"] == null
            ? null
            : List<String>.from(json["content_rating"].map((x) => x)),
        license: json["license"],
        privacy:
            json["privacy"] == null ? null : Privacy.fromJson(json["privacy"]),
        pictures: json["pictures"] == null
            ? null
            : Pictures.fromJson(json["pictures"]),
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        categories: json["categories"] == null
            ? null
            : List<dynamic>.from(json["categories"].map((x) => x)),
        metadata: json["metadata"] == null
            ? null
            : VideoDataMetadata.fromJson(json["metadata"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        reviewPage: json["review_page"] == null
            ? null
            : ReviewPage.fromJson(json["review_page"]),
        parentFolder: json["parent_folder"],
        lastUserActionEventDate: json["last_user_action_event_date"] == null
            ? null
            : DateTime.parse(json["last_user_action_event_date"]),
        files: json["files"] == null
            ? null
            : List<Download>.from(
                json["files"].map((x) => Download.fromJson(x))),
        download: json["download"] == null
            ? null
            : List<Download>.from(
                json["download"].map((x) => Download.fromJson(x))),
        app: json["app"] == null ? null : App.fromJson(json["app"]),
        status: json["status"] == null ? null : json["status"],
        resourceKey: json["resource_key"] == null ? null : json["resource_key"],
        upload: json["upload"] == null ? null : Upload.fromJson(json["upload"]),
        transcode: json["transcode"] == null
            ? null
            : Transcode.fromJson(json["transcode"]),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri == null ? null : uri,
        "name": name == null ? null : name,
        "description": description,
        "type": type == null ? null : type,
        "link": link == null ? null : link,
        "duration": duration == null ? null : duration,
        "width": width == null ? null : width,
        "language": language,
        "height": height == null ? null : height,
        "embed": embed == null ? null : embed.toJson(),
        "created_time":
            createdTime == null ? null : createdTime.toIso8601String(),
        "modified_time":
            modifiedTime == null ? null : modifiedTime.toIso8601String(),
        "release_time":
            releaseTime == null ? null : releaseTime.toIso8601String(),
        "content_rating": contentRating == null
            ? null
            : List<dynamic>.from(contentRating.map((x) => x)),
        "license": license,
        "privacy": privacy == null ? null : privacy.toJson(),
        "pictures": pictures == null ? null : pictures.toJson(),
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        "stats": stats == null ? null : stats.toJson(),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x)),
        "metadata": metadata == null ? null : metadata.toJson(),
        "user": user == null ? null : user.toJson(),
        "review_page": reviewPage == null ? null : reviewPage.toJson(),
        "parent_folder": parentFolder,
        "last_user_action_event_date": lastUserActionEventDate == null
            ? null
            : lastUserActionEventDate.toIso8601String(),
        "files": files == null
            ? null
            : List<dynamic>.from(files.map((x) => x.toJson())),
        "download": download == null
            ? null
            : List<dynamic>.from(download.map((x) => x.toJson())),
        "app": app == null ? null : app.toJson(),
        "status": status == null ? null : status,
        "resource_key": resourceKey == null ? null : resourceKey,
        "upload": upload == null ? null : upload.toJson(),
        "transcode": transcode == null ? null : transcode.toJson(),
      };
}

class App {
  String name;
  String uri;

  App({
    this.name,
    this.uri,
  });

  factory App.fromRawJson(String str) => App.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory App.fromJson(Map<String, dynamic> json) => App(
        name: json["name"] == null ? null : json["name"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "uri": uri == null ? null : uri,
      };
}

class Download {
  String quality;
  Type type;
  int width;
  int height;
  DateTime expires;
  String link;
  DateTime createdTime;
  double fps;
  int size;
  String md5;

  Download({
    this.quality,
    this.type,
    this.width,
    this.height,
    this.expires,
    this.link,
    this.createdTime,
    this.fps,
    this.size,
    this.md5,
  });

  factory Download.fromRawJson(String str) =>
      Download.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Download.fromJson(Map<String, dynamic> json) => Download(
        quality: json["quality"] == null ? null : json["quality"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        expires:
            json["expires"] == null ? null : DateTime.parse(json["expires"]),
        link: json["link"] == null ? null : json["link"],
        createdTime: json["created_time"] == null
            ? null
            : DateTime.parse(json["created_time"]),
        fps: json["fps"] == null ? null : json["fps"].toDouble(),
        size: json["size"] == null ? null : json["size"],
        md5: json["md5"] == null ? null : json["md5"],
      );

  Map<String, dynamic> toJson() => {
        "quality": quality == null ? null : quality,
        "type": type == null ? null : typeValues.reverse[type],
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "expires": expires == null ? null : expires.toIso8601String(),
        "link": link == null ? null : link,
        "created_time":
            createdTime == null ? null : createdTime.toIso8601String(),
        "fps": fps == null ? null : fps,
        "size": size == null ? null : size,
        "md5": md5 == null ? null : md5,
      };
}

enum Type { SOURCE, VIDEO_MP4 }

final typeValues =
    EnumValues({"source": Type.SOURCE, "video/mp4": Type.VIDEO_MP4});

class Embed {
  Buttons buttons;
  Logos logos;
  Title title;
  bool playbar;
  bool volume;
  bool speed;
  String color;
  dynamic uri;
  dynamic html;
  Badges badges;

  Embed({
    this.buttons,
    this.logos,
    this.title,
    this.playbar,
    this.volume,
    this.speed,
    this.color,
    this.uri,
    this.html,
    this.badges,
  });

  factory Embed.fromRawJson(String str) => Embed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Embed.fromJson(Map<String, dynamic> json) => Embed(
        buttons:
            json["buttons"] == null ? null : Buttons.fromJson(json["buttons"]),
        logos: json["logos"] == null ? null : Logos.fromJson(json["logos"]),
        title: json["title"] == null ? null : Title.fromJson(json["title"]),
        playbar: json["playbar"] == null ? null : json["playbar"],
        volume: json["volume"] == null ? null : json["volume"],
        speed: json["speed"] == null ? null : json["speed"],
        color: json["color"] == null ? null : json["color"],
        uri: json["uri"],
        html: json["html"],
        badges: json["badges"] == null ? null : Badges.fromJson(json["badges"]),
      );

  Map<String, dynamic> toJson() => {
        "buttons": buttons == null ? null : buttons.toJson(),
        "logos": logos == null ? null : logos.toJson(),
        "title": title == null ? null : title.toJson(),
        "playbar": playbar == null ? null : playbar,
        "volume": volume == null ? null : volume,
        "speed": speed == null ? null : speed,
        "color": color == null ? null : color,
        "uri": uri,
        "html": html,
        "badges": badges == null ? null : badges.toJson(),
      };
}

class Badges {
  bool hdr;
  Live live;
  StaffPick staffPick;
  bool vod;
  bool weekendChallenge;

  Badges({
    this.hdr,
    this.live,
    this.staffPick,
    this.vod,
    this.weekendChallenge,
  });

  factory Badges.fromRawJson(String str) => Badges.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Badges.fromJson(Map<String, dynamic> json) => Badges(
        hdr: json["hdr"] == null ? null : json["hdr"],
        live: json["live"] == null ? null : Live.fromJson(json["live"]),
        staffPick: json["staff_pick"] == null
            ? null
            : StaffPick.fromJson(json["staff_pick"]),
        vod: json["vod"] == null ? null : json["vod"],
        weekendChallenge: json["weekend_challenge"] == null
            ? null
            : json["weekend_challenge"],
      );

  Map<String, dynamic> toJson() => {
        "hdr": hdr == null ? null : hdr,
        "live": live == null ? null : live.toJson(),
        "staff_pick": staffPick == null ? null : staffPick.toJson(),
        "vod": vod == null ? null : vod,
        "weekend_challenge": weekendChallenge == null ? null : weekendChallenge,
      };
}

class Live {
  bool streaming;
  bool archived;

  Live({
    this.streaming,
    this.archived,
  });

  factory Live.fromRawJson(String str) => Live.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Live.fromJson(Map<String, dynamic> json) => Live(
        streaming: json["streaming"] == null ? null : json["streaming"],
        archived: json["archived"] == null ? null : json["archived"],
      );

  Map<String, dynamic> toJson() => {
        "streaming": streaming == null ? null : streaming,
        "archived": archived == null ? null : archived,
      };
}

class StaffPick {
  bool normal;
  bool bestOfTheMonth;
  bool bestOfTheYear;
  bool premiere;

  StaffPick({
    this.normal,
    this.bestOfTheMonth,
    this.bestOfTheYear,
    this.premiere,
  });

  factory StaffPick.fromRawJson(String str) =>
      StaffPick.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StaffPick.fromJson(Map<String, dynamic> json) => StaffPick(
        normal: json["normal"] == null ? null : json["normal"],
        bestOfTheMonth: json["best_of_the_month"] == null
            ? null
            : json["best_of_the_month"],
        bestOfTheYear:
            json["best_of_the_year"] == null ? null : json["best_of_the_year"],
        premiere: json["premiere"] == null ? null : json["premiere"],
      );

  Map<String, dynamic> toJson() => {
        "normal": normal == null ? null : normal,
        "best_of_the_month": bestOfTheMonth == null ? null : bestOfTheMonth,
        "best_of_the_year": bestOfTheYear == null ? null : bestOfTheYear,
        "premiere": premiere == null ? null : premiere,
      };
}

class Buttons {
  bool like;
  bool watchlater;
  bool share;
  bool embed;
  bool hd;
  bool fullscreen;
  bool scaling;

  Buttons({
    this.like,
    this.watchlater,
    this.share,
    this.embed,
    this.hd,
    this.fullscreen,
    this.scaling,
  });

  factory Buttons.fromRawJson(String str) => Buttons.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Buttons.fromJson(Map<String, dynamic> json) => Buttons(
        like: json["like"] == null ? null : json["like"],
        watchlater: json["watchlater"] == null ? null : json["watchlater"],
        share: json["share"] == null ? null : json["share"],
        embed: json["embed"] == null ? null : json["embed"],
        hd: json["hd"] == null ? null : json["hd"],
        fullscreen: json["fullscreen"] == null ? null : json["fullscreen"],
        scaling: json["scaling"] == null ? null : json["scaling"],
      );

  Map<String, dynamic> toJson() => {
        "like": like == null ? null : like,
        "watchlater": watchlater == null ? null : watchlater,
        "share": share == null ? null : share,
        "embed": embed == null ? null : embed,
        "hd": hd == null ? null : hd,
        "fullscreen": fullscreen == null ? null : fullscreen,
        "scaling": scaling == null ? null : scaling,
      };
}

class Logos {
  bool vimeo;
  Custom custom;

  Logos({
    this.vimeo,
    this.custom,
  });

  factory Logos.fromRawJson(String str) => Logos.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Logos.fromJson(Map<String, dynamic> json) => Logos(
        vimeo: json["vimeo"] == null ? null : json["vimeo"],
        custom: json["custom"] == null ? null : Custom.fromJson(json["custom"]),
      );

  Map<String, dynamic> toJson() => {
        "vimeo": vimeo == null ? null : vimeo,
        "custom": custom == null ? null : custom.toJson(),
      };
}

class Custom {
  bool active;
  dynamic link;
  bool sticky;

  Custom({
    this.active,
    this.link,
    this.sticky,
  });

  factory Custom.fromRawJson(String str) => Custom.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Custom.fromJson(Map<String, dynamic> json) => Custom(
        active: json["active"] == null ? null : json["active"],
        link: json["link"],
        sticky: json["sticky"] == null ? null : json["sticky"],
      );

  Map<String, dynamic> toJson() => {
        "active": active == null ? null : active,
        "link": link,
        "sticky": sticky == null ? null : sticky,
      };
}

class Title {
  String name;
  String owner;
  String portrait;

  Title({
    this.name,
    this.owner,
    this.portrait,
  });

  factory Title.fromRawJson(String str) => Title.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        name: json["name"] == null ? null : json["name"],
        owner: json["owner"] == null ? null : json["owner"],
        portrait: json["portrait"] == null ? null : json["portrait"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "owner": owner == null ? null : owner,
        "portrait": portrait == null ? null : portrait,
      };
}

class VideoDataMetadata {
  PurpleConnections connections;
  Interactions interactions;

  VideoDataMetadata({
    this.connections,
    this.interactions,
  });

  factory VideoDataMetadata.fromRawJson(String str) =>
      VideoDataMetadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoDataMetadata.fromJson(Map<String, dynamic> json) =>
      VideoDataMetadata(
        connections: json["connections"] == null
            ? null
            : PurpleConnections.fromJson(json["connections"]),
        interactions: json["interactions"] == null
            ? null
            : Interactions.fromJson(json["interactions"]),
      );

  Map<String, dynamic> toJson() => {
        "connections": connections == null ? null : connections.toJson(),
        "interactions": interactions == null ? null : interactions.toJson(),
      };
}

class PurpleConnections {
  Albums comments;
  Albums credits;
  Albums likes;
  Albums pictures;
  Albums texttracks;
  dynamic related;
  Recommendations recommendations;
  Albums albums;
  Albums availableAlbums;
  Versions versions;

  PurpleConnections({
    this.comments,
    this.credits,
    this.likes,
    this.pictures,
    this.texttracks,
    this.related,
    this.recommendations,
    this.albums,
    this.availableAlbums,
    this.versions,
  });

  factory PurpleConnections.fromRawJson(String str) =>
      PurpleConnections.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleConnections.fromJson(Map<String, dynamic> json) =>
      PurpleConnections(
        comments:
            json["comments"] == null ? null : Albums.fromJson(json["comments"]),
        credits:
            json["credits"] == null ? null : Albums.fromJson(json["credits"]),
        likes: json["likes"] == null ? null : Albums.fromJson(json["likes"]),
        pictures:
            json["pictures"] == null ? null : Albums.fromJson(json["pictures"]),
        texttracks: json["texttracks"] == null
            ? null
            : Albums.fromJson(json["texttracks"]),
        related: json["related"],
        recommendations: json["recommendations"] == null
            ? null
            : Recommendations.fromJson(json["recommendations"]),
        albums: json["albums"] == null ? null : Albums.fromJson(json["albums"]),
        availableAlbums: json["available_albums"] == null
            ? null
            : Albums.fromJson(json["available_albums"]),
        versions: json["versions"] == null
            ? null
            : Versions.fromJson(json["versions"]),
      );

  Map<String, dynamic> toJson() => {
        "comments": comments == null ? null : comments.toJson(),
        "credits": credits == null ? null : credits.toJson(),
        "likes": likes == null ? null : likes.toJson(),
        "pictures": pictures == null ? null : pictures.toJson(),
        "texttracks": texttracks == null ? null : texttracks.toJson(),
        "related": related,
        "recommendations":
            recommendations == null ? null : recommendations.toJson(),
        "albums": albums == null ? null : albums.toJson(),
        "available_albums":
            availableAlbums == null ? null : availableAlbums.toJson(),
        "versions": versions == null ? null : versions.toJson(),
      };
}

class Albums {
  String uri;
  List<Option> options;
  int total;

  Albums({
    this.uri,
    this.options,
    this.total,
  });

  factory Albums.fromRawJson(String str) => Albums.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        uri: json["uri"] == null ? null : json["uri"],
        options: json["options"] == null
            ? null
            : List<Option>.from(
                json["options"].map((x) => optionValues.map[x])),
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri == null ? null : uri,
        "options": options == null
            ? null
            : List<dynamic>.from(options.map((x) => optionValues.reverse[x])),
        "total": total == null ? null : total,
      };
}

enum Option { GET, PATCH, POST }

final optionValues =
    EnumValues({"GET": Option.GET, "PATCH": Option.PATCH, "POST": Option.POST});

class Recommendations {
  String uri;
  List<Option> options;

  Recommendations({
    this.uri,
    this.options,
  });

  factory Recommendations.fromRawJson(String str) =>
      Recommendations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      Recommendations(
        uri: json["uri"] == null ? null : json["uri"],
        options: json["options"] == null
            ? null
            : List<Option>.from(
                json["options"].map((x) => optionValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri == null ? null : uri,
        "options": options == null
            ? null
            : List<dynamic>.from(options.map((x) => optionValues.reverse[x])),
      };
}

class Versions {
  String uri;
  List<Option> options;
  int total;
  String currentUri;
  String resourceKey;

  Versions({
    this.uri,
    this.options,
    this.total,
    this.currentUri,
    this.resourceKey,
  });

  factory Versions.fromRawJson(String str) =>
      Versions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        uri: json["uri"] == null ? null : json["uri"],
        options: json["options"] == null
            ? null
            : List<Option>.from(
                json["options"].map((x) => optionValues.map[x])),
        total: json["total"] == null ? null : json["total"],
        currentUri: json["current_uri"] == null ? null : json["current_uri"],
        resourceKey: json["resource_key"] == null ? null : json["resource_key"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri == null ? null : uri,
        "options": options == null
            ? null
            : List<dynamic>.from(options.map((x) => optionValues.reverse[x])),
        "total": total == null ? null : total,
        "current_uri": currentUri == null ? null : currentUri,
        "resource_key": resourceKey == null ? null : resourceKey,
      };
}

class Interactions {
  Watchlater watchlater;
  Report report;

  Interactions({
    this.watchlater,
    this.report,
  });

  factory Interactions.fromRawJson(String str) =>
      Interactions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Interactions.fromJson(Map<String, dynamic> json) => Interactions(
        watchlater: json["watchlater"] == null
            ? null
            : Watchlater.fromJson(json["watchlater"]),
        report: json["report"] == null ? null : Report.fromJson(json["report"]),
      );

  Map<String, dynamic> toJson() => {
        "watchlater": watchlater == null ? null : watchlater.toJson(),
        "report": report == null ? null : report.toJson(),
      };
}

class Report {
  String uri;
  List<Option> options;
  List<String> reason;

  Report({
    this.uri,
    this.options,
    this.reason,
  });

  factory Report.fromRawJson(String str) => Report.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        uri: json["uri"] == null ? null : json["uri"],
        options: json["options"] == null
            ? null
            : List<Option>.from(
                json["options"].map((x) => optionValues.map[x])),
        reason: json["reason"] == null
            ? null
            : List<String>.from(json["reason"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri == null ? null : uri,
        "options": options == null
            ? null
            : List<dynamic>.from(options.map((x) => optionValues.reverse[x])),
        "reason":
            reason == null ? null : List<dynamic>.from(reason.map((x) => x)),
      };
}

class Watchlater {
  String uri;
  List<String> options;
  bool added;
  dynamic addedTime;

  Watchlater({
    this.uri,
    this.options,
    this.added,
    this.addedTime,
  });

  factory Watchlater.fromRawJson(String str) =>
      Watchlater.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Watchlater.fromJson(Map<String, dynamic> json) => Watchlater(
        uri: json["uri"] == null ? null : json["uri"],
        options: json["options"] == null
            ? null
            : List<String>.from(json["options"].map((x) => x)),
        added: json["added"] == null ? null : json["added"],
        addedTime: json["added_time"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri == null ? null : uri,
        "options":
            options == null ? null : List<dynamic>.from(options.map((x) => x)),
        "added": added == null ? null : added,
        "added_time": addedTime,
      };
}

class Pictures {
  String uri;
  bool active;
  String type;
  List<Size> sizes;
  String resourceKey;

  Pictures({
    this.uri,
    this.active,
    this.type,
    this.sizes,
    this.resourceKey,
  });

  factory Pictures.fromRawJson(String str) =>
      Pictures.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pictures.fromJson(Map<String, dynamic> json) => Pictures(
        uri: json["uri"] == null ? null : json["uri"],
        active: json["active"] == null ? null : json["active"],
        type: json["type"] == null ? null : json["type"],
        sizes: json["sizes"] == null
            ? null
            : List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
        resourceKey: json["resource_key"] == null ? null : json["resource_key"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri == null ? null : uri,
        "active": active == null ? null : active,
        "type": type == null ? null : type,
        "sizes": sizes == null
            ? null
            : List<dynamic>.from(sizes.map((x) => x.toJson())),
        "resource_key": resourceKey == null ? null : resourceKey,
      };
}

class Size {
  int width;
  int height;
  String link;
  String linkWithPlayButton;

  Size({
    this.width,
    this.height,
    this.link,
    this.linkWithPlayButton,
  });

  factory Size.fromRawJson(String str) => Size.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        link: json["link"] == null ? null : json["link"],
        linkWithPlayButton: json["link_with_play_button"] == null
            ? null
            : json["link_with_play_button"],
      );

  Map<String, dynamic> toJson() => {
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "link": link == null ? null : link,
        "link_with_play_button":
            linkWithPlayButton == null ? null : linkWithPlayButton,
      };
}

class Privacy {
  String view;
  String embed;
  bool download;
  bool add;
  String comments;

  Privacy({
    this.view,
    this.embed,
    this.download,
    this.add,
    this.comments,
  });

  factory Privacy.fromRawJson(String str) => Privacy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Privacy.fromJson(Map<String, dynamic> json) => Privacy(
        view: json["view"] == null ? null : json["view"],
        embed: json["embed"] == null ? null : json["embed"],
        download: json["download"] == null ? null : json["download"],
        add: json["add"] == null ? null : json["add"],
        comments: json["comments"] == null ? null : json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "view": view == null ? null : view,
        "embed": embed == null ? null : embed,
        "download": download == null ? null : download,
        "add": add == null ? null : add,
        "comments": comments == null ? null : comments,
      };
}

class ReviewPage {
  bool active;
  String link;

  ReviewPage({
    this.active,
    this.link,
  });

  factory ReviewPage.fromRawJson(String str) =>
      ReviewPage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewPage.fromJson(Map<String, dynamic> json) => ReviewPage(
        active: json["active"] == null ? null : json["active"],
        link: json["link"] == null ? null : json["link"],
      );

  Map<String, dynamic> toJson() => {
        "active": active == null ? null : active,
        "link": link == null ? null : link,
      };
}

class Stats {
  int plays;

  Stats({
    this.plays,
  });

  factory Stats.fromRawJson(String str) => Stats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        plays: json["plays"] == null ? null : json["plays"],
      );

  Map<String, dynamic> toJson() => {
        "plays": plays == null ? null : plays,
      };
}

class Transcode {
  String status;

  Transcode({
    this.status,
  });

  factory Transcode.fromRawJson(String str) =>
      Transcode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Transcode.fromJson(Map<String, dynamic> json) => Transcode(
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
      };
}

class Upload {
  String status;
  dynamic link;
  dynamic uploadLink;
  dynamic completeUri;
  dynamic form;
  dynamic approach;
  dynamic size;
  dynamic redirectUrl;

  Upload({
    this.status,
    this.link,
    this.uploadLink,
    this.completeUri,
    this.form,
    this.approach,
    this.size,
    this.redirectUrl,
  });

  factory Upload.fromRawJson(String str) => Upload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Upload.fromJson(Map<String, dynamic> json) => Upload(
        status: json["status"] == null ? null : json["status"],
        link: json["link"],
        uploadLink: json["upload_link"],
        completeUri: json["complete_uri"],
        form: json["form"],
        approach: json["approach"],
        size: json["size"],
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "link": link,
        "upload_link": uploadLink,
        "complete_uri": completeUri,
        "form": form,
        "approach": approach,
        "size": size,
        "redirect_url": redirectUrl,
      };
}

class User {
  String uri;
  String name;
  String link;
  String location;
  String gender;
  dynamic bio;
  dynamic shortBio;
  DateTime createdTime;
  Pictures pictures;
  List<dynamic> websites;
  UserMetadata metadata;
  LocationDetails locationDetails;
  List<dynamic> skills;
  bool availableForHire;
  Preferences preferences;
  List<String> contentFilter;
  String resourceKey;
  String account;

  User({
    this.uri,
    this.name,
    this.link,
    this.location,
    this.gender,
    this.bio,
    this.shortBio,
    this.createdTime,
    this.pictures,
    this.websites,
    this.metadata,
    this.locationDetails,
    this.skills,
    this.availableForHire,
    this.preferences,
    this.contentFilter,
    this.resourceKey,
    this.account,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        uri: json["uri"] == null ? null : json["uri"],
        name: json["name"] == null ? null : json["name"],
        link: json["link"] == null ? null : json["link"],
        location: json["location"] == null ? null : json["location"],
        gender: json["gender"] == null ? null : json["gender"],
        bio: json["bio"],
        shortBio: json["short_bio"],
        createdTime: json["created_time"] == null
            ? null
            : DateTime.parse(json["created_time"]),
        pictures: json["pictures"] == null
            ? null
            : Pictures.fromJson(json["pictures"]),
        websites: json["websites"] == null
            ? null
            : List<dynamic>.from(json["websites"].map((x) => x)),
        metadata: json["metadata"] == null
            ? null
            : UserMetadata.fromJson(json["metadata"]),
        locationDetails: json["location_details"] == null
            ? null
            : LocationDetails.fromJson(json["location_details"]),
        skills: json["skills"] == null
            ? null
            : List<dynamic>.from(json["skills"].map((x) => x)),
        availableForHire: json["available_for_hire"] == null
            ? null
            : json["available_for_hire"],
        preferences: json["preferences"] == null
            ? null
            : Preferences.fromJson(json["preferences"]),
        contentFilter: json["content_filter"] == null
            ? null
            : List<String>.from(json["content_filter"].map((x) => x)),
        resourceKey: json["resource_key"] == null ? null : json["resource_key"],
        account: json["account"] == null ? null : json["account"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri == null ? null : uri,
        "name": name == null ? null : name,
        "link": link == null ? null : link,
        "location": location == null ? null : location,
        "gender": gender == null ? null : gender,
        "bio": bio,
        "short_bio": shortBio,
        "created_time":
            createdTime == null ? null : createdTime.toIso8601String(),
        "pictures": pictures == null ? null : pictures.toJson(),
        "websites": websites == null
            ? null
            : List<dynamic>.from(websites.map((x) => x)),
        "metadata": metadata == null ? null : metadata.toJson(),
        "location_details":
            locationDetails == null ? null : locationDetails.toJson(),
        "skills":
            skills == null ? null : List<dynamic>.from(skills.map((x) => x)),
        "available_for_hire":
            availableForHire == null ? null : availableForHire,
        "preferences": preferences == null ? null : preferences.toJson(),
        "content_filter": contentFilter == null
            ? null
            : List<dynamic>.from(contentFilter.map((x) => x)),
        "resource_key": resourceKey == null ? null : resourceKey,
        "account": account == null ? null : account,
      };
}

class LocationDetails {
  String formattedAddress;
  dynamic latitude;
  dynamic longitude;
  dynamic city;
  dynamic state;
  dynamic neighborhood;
  dynamic subLocality;
  dynamic stateIsoCode;
  dynamic country;
  dynamic countryIsoCode;

  LocationDetails({
    this.formattedAddress,
    this.latitude,
    this.longitude,
    this.city,
    this.state,
    this.neighborhood,
    this.subLocality,
    this.stateIsoCode,
    this.country,
    this.countryIsoCode,
  });

  factory LocationDetails.fromRawJson(String str) =>
      LocationDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationDetails.fromJson(Map<String, dynamic> json) =>
      LocationDetails(
        formattedAddress: json["formatted_address"] == null
            ? null
            : json["formatted_address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        city: json["city"],
        state: json["state"],
        neighborhood: json["neighborhood"],
        subLocality: json["sub_locality"],
        stateIsoCode: json["state_iso_code"],
        country: json["country"],
        countryIsoCode: json["country_iso_code"],
      );

  Map<String, dynamic> toJson() => {
        "formatted_address": formattedAddress == null ? null : formattedAddress,
        "latitude": latitude,
        "longitude": longitude,
        "city": city,
        "state": state,
        "neighborhood": neighborhood,
        "sub_locality": subLocality,
        "state_iso_code": stateIsoCode,
        "country": country,
        "country_iso_code": countryIsoCode,
      };
}

class UserMetadata {
  FluffyConnections connections;

  UserMetadata({
    this.connections,
  });

  factory UserMetadata.fromRawJson(String str) =>
      UserMetadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserMetadata.fromJson(Map<String, dynamic> json) => UserMetadata(
        connections: json["connections"] == null
            ? null
            : FluffyConnections.fromJson(json["connections"]),
      );

  Map<String, dynamic> toJson() => {
        "connections": connections == null ? null : connections.toJson(),
      };
}

class FluffyConnections {
  Albums albums;
  Albums appearances;
  Albums categories;
  Albums channels;
  Recommendations feed;
  Albums followers;
  Albums following;
  Albums groups;
  Albums likes;
  Recommendations membership;
  Albums moderatedChannels;
  Albums portfolios;
  Albums videos;
  Albums watchlater;
  Albums shared;
  Albums pictures;
  Albums watchedVideos;
  Albums folders;
  Albums block;

  FluffyConnections({
    this.albums,
    this.appearances,
    this.categories,
    this.channels,
    this.feed,
    this.followers,
    this.following,
    this.groups,
    this.likes,
    this.membership,
    this.moderatedChannels,
    this.portfolios,
    this.videos,
    this.watchlater,
    this.shared,
    this.pictures,
    this.watchedVideos,
    this.folders,
    this.block,
  });

  factory FluffyConnections.fromRawJson(String str) =>
      FluffyConnections.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyConnections.fromJson(Map<String, dynamic> json) =>
      FluffyConnections(
        albums: json["albums"] == null ? null : Albums.fromJson(json["albums"]),
        appearances: json["appearances"] == null
            ? null
            : Albums.fromJson(json["appearances"]),
        categories: json["categories"] == null
            ? null
            : Albums.fromJson(json["categories"]),
        channels:
            json["channels"] == null ? null : Albums.fromJson(json["channels"]),
        feed: json["feed"] == null
            ? null
            : Recommendations.fromJson(json["feed"]),
        followers: json["followers"] == null
            ? null
            : Albums.fromJson(json["followers"]),
        following: json["following"] == null
            ? null
            : Albums.fromJson(json["following"]),
        groups: json["groups"] == null ? null : Albums.fromJson(json["groups"]),
        likes: json["likes"] == null ? null : Albums.fromJson(json["likes"]),
        membership: json["membership"] == null
            ? null
            : Recommendations.fromJson(json["membership"]),
        moderatedChannels: json["moderated_channels"] == null
            ? null
            : Albums.fromJson(json["moderated_channels"]),
        portfolios: json["portfolios"] == null
            ? null
            : Albums.fromJson(json["portfolios"]),
        videos: json["videos"] == null ? null : Albums.fromJson(json["videos"]),
        watchlater: json["watchlater"] == null
            ? null
            : Albums.fromJson(json["watchlater"]),
        shared: json["shared"] == null ? null : Albums.fromJson(json["shared"]),
        pictures:
            json["pictures"] == null ? null : Albums.fromJson(json["pictures"]),
        watchedVideos: json["watched_videos"] == null
            ? null
            : Albums.fromJson(json["watched_videos"]),
        folders:
            json["folders"] == null ? null : Albums.fromJson(json["folders"]),
        block: json["block"] == null ? null : Albums.fromJson(json["block"]),
      );

  Map<String, dynamic> toJson() => {
        "albums": albums == null ? null : albums.toJson(),
        "appearances": appearances == null ? null : appearances.toJson(),
        "categories": categories == null ? null : categories.toJson(),
        "channels": channels == null ? null : channels.toJson(),
        "feed": feed == null ? null : feed.toJson(),
        "followers": followers == null ? null : followers.toJson(),
        "following": following == null ? null : following.toJson(),
        "groups": groups == null ? null : groups.toJson(),
        "likes": likes == null ? null : likes.toJson(),
        "membership": membership == null ? null : membership.toJson(),
        "moderated_channels":
            moderatedChannels == null ? null : moderatedChannels.toJson(),
        "portfolios": portfolios == null ? null : portfolios.toJson(),
        "videos": videos == null ? null : videos.toJson(),
        "watchlater": watchlater == null ? null : watchlater.toJson(),
        "shared": shared == null ? null : shared.toJson(),
        "pictures": pictures == null ? null : pictures.toJson(),
        "watched_videos": watchedVideos == null ? null : watchedVideos.toJson(),
        "folders": folders == null ? null : folders.toJson(),
        "block": block == null ? null : block.toJson(),
      };
}

class Preferences {
  Videos videos;

  Preferences({
    this.videos,
  });

  factory Preferences.fromRawJson(String str) =>
      Preferences.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
      );

  Map<String, dynamic> toJson() => {
        "videos": videos == null ? null : videos.toJson(),
      };
}

class Videos {
  Privacy privacy;

  Videos({
    this.privacy,
  });

  factory Videos.fromRawJson(String str) => Videos.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        privacy:
            json["privacy"] == null ? null : Privacy.fromJson(json["privacy"]),
      );

  Map<String, dynamic> toJson() => {
        "privacy": privacy == null ? null : privacy.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
