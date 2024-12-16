// To parse this JSON data, do
//
//     final configuration = configurationFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

Configuration configurationFromJson(String str) => Configuration.fromJson(json.decode(str));

String configurationToJson(Configuration data) => json.encode(data.toJson());

class Configuration {
  Data data;
  List<Promotion> promotions;

  Configuration({
    required this.data,
    required this.promotions,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
    data: Data.fromJson(json["data"]),
    promotions: List<Promotion>.from(json["promotions"].map((x) => Promotion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "promotions": List<dynamic>.from(promotions.map((x) => x.toJson())),
  };
}

class Data {
  String webviewUrlOdds;
  String webviewUrlArticles;
  String includeUrlOdds;
  String includeUrlArticles;
  String faq;
  String support;
  String about;
  String termConditions;
  String privacyPolicy;
  Style style;
  String guest_user;
  Info info;
  List<String> elements;
  List<String> injectJsOnStart;
  List<String> injectJsOnProgress;
  List<String> injectJsOnLoad;
  List<String> injectJs;
  List<String> injectJsOnEnd;
  List<String> injectJsOnNavigationStateChange;
  List<String> injectJsOnStartOdds;
  List<String> injectJsOnProgressOdds;
  List<String> injectJsOnLoadOdds;
  List<String> injectJsOdds;
  List<String> injectJsOnEndOdds;
  List<String> injectJsOnNavigationStateChangeOdds;
  List<String> games;

  Data({
    required this.webviewUrlOdds,
    required this.webviewUrlArticles,
    required this.includeUrlOdds,
    required this.includeUrlArticles,
    required this.faq,
    required this.support,
    required this.about,
    required this.termConditions,
    required this.privacyPolicy,
    required this.style,
    required this.guest_user,
    required this.info,
    required this.elements,
    required this.injectJsOnStart,
    required this.injectJsOnProgress,
    required this.injectJsOnLoad,
    required this.injectJs,
    required this.injectJsOnEnd,
    required this.injectJsOnNavigationStateChange,
    required this.injectJsOnStartOdds,
    required this.injectJsOnProgressOdds,
    required this.injectJsOnLoadOdds,
    required this.injectJsOdds,
    required this.injectJsOnEndOdds,
    required this.injectJsOnNavigationStateChangeOdds,
   required this.games,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    webviewUrlOdds: json["WEBVIEW_URL_ODDS"],
    webviewUrlArticles: json["WEBVIEW_URL_ARTICLES"],
    includeUrlOdds: json["INCLUDE_URL_ODDS"],
    includeUrlArticles: json["INCLUDE_URL_ARTICLES"],
    faq: json["FAQ"],
    support: json["SUPPORT"],
    about: json["ABOUT"],
    termConditions: json["TERM_CONDITIONS"],
    privacyPolicy: json["PRIVACY_POLICY"],
    style: Style.fromJson(json["STYLE"]),
    guest_user: json["guest_user"],
    info: Info.fromJson(json["info"]),
    elements: List<String>.from(json["ELEMENTS"].map((x) => x)),
    injectJsOnStart: List<String>.from(json["INJECT_JS_ON_START"].map((x) => x)),
    injectJsOnProgress: List<String>.from(json["INJECT_JS_ON_PROGRESS"].map((x) => x)),
    injectJsOnLoad: List<String>.from(json["INJECT_JS_ON_LOAD"].map((x) => x)),
    injectJs: List<String>.from(json["INJECT_JS"].map((x) => x)),
    injectJsOnEnd: List<String>.from(json["INJECT_JS_ON_END"].map((x) => x)),
    injectJsOnNavigationStateChange: List<String>.from(json["INJECT_JS_ON_NAVIGATION_STATE_CHANGE"].map((x) => x)),
    injectJsOnStartOdds: List<String>.from(json["INJECT_JS_ON_START_ODDS"].map((x) => x)),
    injectJsOnProgressOdds: List<String>.from(json["INJECT_JS_ON_PROGRESS_ODDS"].map((x) => x)),
    injectJsOnLoadOdds: List<String>.from(json["INJECT_JS_ON_LOAD_ODDS"].map((x) => x)),
    injectJsOdds: List<String>.from(json["INJECT_JS_ODDS"].map((x) => x)),
    injectJsOnEndOdds: List<String>.from(json["INJECT_JS_ON_END_ODDS"].map((x) => x)),
    injectJsOnNavigationStateChangeOdds: List<String>.from(json["INJECT_JS_ON_NAVIGATION_STATE_CHANGE_ODDS"].map((x) => x)),
    games: List<String>.from(json["games"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "WEBVIEW_URL_ODDS": webviewUrlOdds,
    "WEBVIEW_URL_ARTICLES": webviewUrlArticles,
    "INCLUDE_URL_ODDS": includeUrlOdds,
    "INCLUDE_URL_ARTICLES": includeUrlArticles,
    "FAQ": faq,
    "SUPPORT": support,
    "ABOUT": about,
    "TERM_CONDITIONS": termConditions,
    "PRIVACY_POLICY": privacyPolicy,
    "STYLE": style.toJson(),
    "guest_user": guest_user,
    "info": info.toJson(),
    "ELEMENTS": List<dynamic>.from(elements.map((x) => x)),
    "INJECT_JS_ON_START": List<dynamic>.from(injectJsOnStart.map((x) => x)),
    "INJECT_JS_ON_PROGRESS": List<dynamic>.from(injectJsOnProgress.map((x) => x)),
    "INJECT_JS_ON_LOAD": List<dynamic>.from(injectJsOnLoad.map((x) => x)),
    "INJECT_JS": List<dynamic>.from(injectJs.map((x) => x)),
    "INJECT_JS_ON_END": List<dynamic>.from(injectJsOnEnd.map((x) => x)),
    "INJECT_JS_ON_NAVIGATION_STATE_CHANGE": List<dynamic>.from(injectJsOnNavigationStateChange.map((x) => x)),
    "INJECT_JS_ON_START_ODDS": List<dynamic>.from(injectJsOnStartOdds.map((x) => x)),
    "INJECT_JS_ON_PROGRESS_ODDS": List<dynamic>.from(injectJsOnProgressOdds.map((x) => x)),
    "INJECT_JS_ON_LOAD_ODDS": List<dynamic>.from(injectJsOnLoadOdds.map((x) => x)),
    "INJECT_JS_ODDS": List<dynamic>.from(injectJsOdds.map((x) => x)),
    "INJECT_JS_ON_END_ODDS": List<dynamic>.from(injectJsOnEndOdds.map((x) => x)),
    "INJECT_JS_ON_NAVIGATION_STATE_CHANGE_ODDS": List<dynamic>.from(injectJsOnNavigationStateChangeOdds.map((x) => x)),
    "games": List<dynamic>.from(games.map((x) => x)),
  };
}

class publicConfiguration {
  Data data;

  publicConfiguration({
    required this.data,
  });

  factory publicConfiguration.fromJson(Map<String, dynamic> json) => publicConfiguration(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Info {
  Moneyline moneyline;
  Moneyline spread;
  Moneyline total;
  Moneyline straight;
  Moneyline parlay;

  Moneyline transition;

  Info({
    required this.moneyline,
    required this.spread,
    required this.total,
    required this.straight,
    required this.parlay,
    required this.transition
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    moneyline: Moneyline.fromJson(json["moneyline"]),
    spread: Moneyline.fromJson(json["spread"]),
    total: Moneyline.fromJson(json["total"]),
    straight: Moneyline.fromJson(json["straight"]),
    parlay: Moneyline.fromJson(json["parlay"]),
    transition: Moneyline.fromJson(json["transition"]),
  );

  Map<String, dynamic> toJson() => {
    "moneyline": moneyline.toJson(),
    "spread": spread.toJson(),
    "total": total.toJson(),
    "straight": straight.toJson(),
    "parlay": parlay.toJson(),
    "transition": transition.toJson()
  };
}

class Moneyline {
  String header;
  String text;

  Moneyline({
    required this.header,
    required this.text,
  });

  factory Moneyline.fromJson(Map<String, dynamic> json) => Moneyline(
    header: json["header"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "header": header,
    "text": text,
  };
}

class Style {
  String mainColor;
  String buttonColor;
  String transitionTimer;
  String buttonTextColor;

  Style({
    required this.mainColor,
    required this.buttonColor,
    required this.transitionTimer,
    required this.buttonTextColor,
  });

  factory Style.fromJson(Map<String, dynamic> json) => Style(
    mainColor: json["MAIN_COLOR"],
    buttonColor: json["BUTTON_COLOR"],
    transitionTimer: json["TRANSITION_TIMER"],
    buttonTextColor: json["BUTTON_TEXT_COLOR"],
  );

  Map<String, dynamic> toJson() => {
    "MAIN_COLOR": mainColor,
    "BUTTON_COLOR": buttonColor,
    "TRANSITION_TIMER": transitionTimer,
    "BUTTON_TEXT_COLOR": buttonTextColor,
  };
}

class Promotion {
  int id;
  String key;
  String type;
  String linkType;
  String link;
  String label;
  String? image;
  bool geoFlagged;

  Promotion({
    required this.id,
    required this.key,
    required this.type,
    required this.linkType,
    required this.link,
    required this.label,
    required this.image,
    required this.geoFlagged,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
    id: json["id"],
    key: json["key"],
    type: json["type"],
    linkType: json["link_type"],
    link: json["link"],
    label: json["label"],
    image: json["image"] as String?,
    geoFlagged: json["geo_flagged"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "type": type,
    "link_type": linkType,
    "link": link,
    "label": label,
    "image": image,
    "geo_flagged": geoFlagged,
  };
}


