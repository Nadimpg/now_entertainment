import 'dart:convert';

class HomeCategoryModel {
  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? slug;
  Taxonomy? taxonomy;
  int? parent;
  List<dynamic>? meta;
  List<dynamic>? acf;
  String? yoastHead;
  YoastHeadJson? yoastHeadJson;
  Links? links;

  HomeCategoryModel({
    this.id,


    this.link,
    this.name,
    this.slug,

  });

  factory HomeCategoryModel.fromRawJson(String str) => HomeCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) => HomeCategoryModel(
    id: json["id"],

    link: json["link"],
    name: json["name"],
    slug: json["slug"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "count": count,
    "description": description,
    "link": link,
    "name": name,
    "slug": slug,
    "taxonomy": taxonomyValues.reverse[taxonomy],
    "parent": parent,
    "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
    "acf": acf == null ? [] : List<dynamic>.from(acf!.map((x) => x)),
    "yoast_head": yoastHead,
    "yoast_head_json": yoastHeadJson?.toJson(),
    "_links": links?.toJson(),
  };
}

class Links {
  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<About>? wpPostType;
  List<Cury>? curies;

  Links({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
  });

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? [] : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? [] : List<About>.from(json["collection"]!.map((x) => About.fromJson(x))),
    about: json["about"] == null ? [] : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
    wpPostType: json["wp:post_type"] == null ? [] : List<About>.from(json["wp:post_type"]!.map((x) => About.fromJson(x))),
    curies: json["curies"] == null ? [] : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? [] : List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": collection == null ? [] : List<dynamic>.from(collection!.map((x) => x.toJson())),
    "about": about == null ? [] : List<dynamic>.from(about!.map((x) => x.toJson())),
    "wp:post_type": wpPostType == null ? [] : List<dynamic>.from(wpPostType!.map((x) => x.toJson())),
    "curies": curies == null ? [] : List<dynamic>.from(curies!.map((x) => x.toJson())),
  };
}

class About {
  String? href;

  About({
    this.href,
  });

  factory About.fromRawJson(String str) => About.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory About.fromJson(Map<String, dynamic> json) => About(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Cury {
  Name? name;
  Href? href;
  bool? templated;

  Cury({
    this.name,
    this.href,
    this.templated,
  });

  factory Cury.fromRawJson(String str) => Cury.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: nameValues.map[json["name"]]!,
    href: hrefValues.map[json["href"]]!,
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "href": hrefValues.reverse[href],
    "templated": templated,
  };
}

enum Href {
  HTTPS_API_W_ORG_REL
}

final hrefValues = EnumValues({
  "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name {
  WP
}

final nameValues = EnumValues({
  "wp": Name.WP
});

enum Taxonomy {
  CATEGORY
}

final taxonomyValues = EnumValues({
  "category": Taxonomy.CATEGORY
});

class YoastHeadJson {
  String? title;
  String? description;
  Robots? robots;
  String? canonical;
  OgLocale? ogLocale;
  OgType? ogType;
  String? ogTitle;
  String? ogDescription;
  String? ogUrl;
  OgSiteName? ogSiteName;
  List<OgImage>? ogImage;
  TwitterCard? twitterCard;
  TwitterSite? twitterSite;
  Schema? schema;

  YoastHeadJson({
    this.title,
    this.description,
    this.robots,
    this.canonical,
    this.ogLocale,
    this.ogType,
    this.ogTitle,
    this.ogDescription,
    this.ogUrl,
    this.ogSiteName,
    this.ogImage,
    this.twitterCard,
    this.twitterSite,
    this.schema,
  });

  factory YoastHeadJson.fromRawJson(String str) => YoastHeadJson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
    title: json["title"],
    description: json["description"],
    robots: json["robots"] == null ? null : Robots.fromJson(json["robots"]),
    canonical: json["canonical"],
    ogLocale: ogLocaleValues.map[json["og_locale"]]!,
    ogType: ogTypeValues.map[json["og_type"]]!,
    ogTitle: json["og_title"],
    ogDescription: json["og_description"],
    ogUrl: json["og_url"],
    ogSiteName: ogSiteNameValues.map[json["og_site_name"]]!,
    ogImage: json["og_image"] == null ? [] : List<OgImage>.from(json["og_image"]!.map((x) => OgImage.fromJson(x))),
    twitterCard: twitterCardValues.map[json["twitter_card"]]!,
    twitterSite: twitterSiteValues.map[json["twitter_site"]]!,
    schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "robots": robots?.toJson(),
    "canonical": canonical,
    "og_locale": ogLocaleValues.reverse[ogLocale],
    "og_type": ogTypeValues.reverse[ogType],
    "og_title": ogTitle,
    "og_description": ogDescription,
    "og_url": ogUrl,
    "og_site_name": ogSiteNameValues.reverse[ogSiteName],
    "og_image": ogImage == null ? [] : List<dynamic>.from(ogImage!.map((x) => x.toJson())),
    "twitter_card": twitterCardValues.reverse[twitterCard],
    "twitter_site": twitterSiteValues.reverse[twitterSite],
    "schema": schema?.toJson(),
  };
}

class OgImage {
  int? width;
  int? height;
  String? url;
  Type? type;

  OgImage({
    this.width,
    this.height,
    this.url,
    this.type,
  });

  factory OgImage.fromRawJson(String str) => OgImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
    width: json["width"],
    height: json["height"],
    url: json["url"],
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "url": url,
    "type": typeValues.reverse[type],
  };
}

enum Type {
  IMAGE_PNG
}

final typeValues = EnumValues({
  "image/png": Type.IMAGE_PNG
});

enum OgLocale {
  EN_US
}

final ogLocaleValues = EnumValues({
  "en_US": OgLocale.EN_US
});

enum OgSiteName {
  NOW_ENTERTAINMENT_MAGAZINE
}

final ogSiteNameValues = EnumValues({
  "Now Entertainment Magazine": OgSiteName.NOW_ENTERTAINMENT_MAGAZINE
});

enum OgType {
  ARTICLE
}

final ogTypeValues = EnumValues({
  "article": OgType.ARTICLE
});

class Robots {
  Index? index;
  Follow? follow;
  MaxSnippet? maxSnippet;
  MaxImagePreview? maxImagePreview;
  MaxVideoPreview? maxVideoPreview;

  Robots({
    this.index,
    this.follow,
    this.maxSnippet,
    this.maxImagePreview,
    this.maxVideoPreview,
  });

  factory Robots.fromRawJson(String str) => Robots.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
    index: indexValues.map[json["index"]]!,
    follow: followValues.map[json["follow"]]!,
    maxSnippet: maxSnippetValues.map[json["max-snippet"]]!,
    maxImagePreview: maxImagePreviewValues.map[json["max-image-preview"]]!,
    maxVideoPreview: maxVideoPreviewValues.map[json["max-video-preview"]]!,
  );

  Map<String, dynamic> toJson() => {
    "index": indexValues.reverse[index],
    "follow": followValues.reverse[follow],
    "max-snippet": maxSnippetValues.reverse[maxSnippet],
    "max-image-preview": maxImagePreviewValues.reverse[maxImagePreview],
    "max-video-preview": maxVideoPreviewValues.reverse[maxVideoPreview],
  };
}

enum Follow {
  FOLLOW
}

final followValues = EnumValues({
  "follow": Follow.FOLLOW
});

enum Index {
  INDEX
}

final indexValues = EnumValues({
  "index": Index.INDEX
});

enum MaxImagePreview {
  MAX_IMAGE_PREVIEW_LARGE
}

final maxImagePreviewValues = EnumValues({
  "max-image-preview:large": MaxImagePreview.MAX_IMAGE_PREVIEW_LARGE
});

enum MaxSnippet {
  MAX_SNIPPET_1
}

final maxSnippetValues = EnumValues({
  "max-snippet:-1": MaxSnippet.MAX_SNIPPET_1
});

enum MaxVideoPreview {
  MAX_VIDEO_PREVIEW_1
}

final maxVideoPreviewValues = EnumValues({
  "max-video-preview:-1": MaxVideoPreview.MAX_VIDEO_PREVIEW_1
});

class Schema {
  String? context;
  List<Graph>? graph;

  Schema({
    this.context,
    this.graph,
  });

  factory Schema.fromRawJson(String str) => Schema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
    context: json["@context"],
    graph: json["@graph"] == null ? [] : List<Graph>.from(json["@graph"]!.map((x) => Graph.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@context": context,
    "@graph": graph == null ? [] : List<dynamic>.from(graph!.map((x) => x.toJson())),
  };
}

class Graph {
  GraphType? type;
  String? id;
  String? url;
  String? name;
  Breadcrumb? isPartOf;
  String? description;
  Breadcrumb? breadcrumb;
  InLanguage? inLanguage;
  List<ItemListElement>? itemListElement;
  Breadcrumb? publisher;
  AlternateName? alternateName;
  List<PotentialAction>? potentialAction;
  Logo? logo;
  Breadcrumb? image;
  List<String>? sameAs;
  String? publishingPrinciples;
  String? ownershipFundingInfo;
  String? actionableFeedbackPolicy;

  Graph({
    this.type,
    this.id,
    this.url,
    this.name,
    this.isPartOf,
    this.description,
    this.breadcrumb,
    this.inLanguage,
    this.itemListElement,
    this.publisher,
    this.alternateName,
    this.potentialAction,
    this.logo,
    this.image,
    this.sameAs,
    this.publishingPrinciples,
    this.ownershipFundingInfo,
    this.actionableFeedbackPolicy,
  });

  factory Graph.fromRawJson(String str) => Graph.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
    type: graphTypeValues.map[json["@type"]]!,
    id: json["@id"],
    url: json["url"],
    name: json["name"],
    isPartOf: json["isPartOf"] == null ? null : Breadcrumb.fromJson(json["isPartOf"]),
    description: json["description"],
    breadcrumb: json["breadcrumb"] == null ? null : Breadcrumb.fromJson(json["breadcrumb"]),
    inLanguage: inLanguageValues.map[json["inLanguage"]]!,
    itemListElement: json["itemListElement"] == null ? [] : List<ItemListElement>.from(json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
    publisher: json["publisher"] == null ? null : Breadcrumb.fromJson(json["publisher"]),
    alternateName: alternateNameValues.map[json["alternateName"]]!,
    potentialAction: json["potentialAction"] == null ? [] : List<PotentialAction>.from(json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
    logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
    image: json["image"] == null ? null : Breadcrumb.fromJson(json["image"]),
    sameAs: json["sameAs"] == null ? [] : List<String>.from(json["sameAs"]!.map((x) => x)),
    publishingPrinciples: json["publishingPrinciples"],
    ownershipFundingInfo: json["ownershipFundingInfo"],
    actionableFeedbackPolicy: json["actionableFeedbackPolicy"],
  );

  Map<String, dynamic> toJson() => {
    "@type": graphTypeValues.reverse[type],
    "@id": id,
    "url": url,
    "name": name,
    "isPartOf": isPartOf?.toJson(),
    "description": description,
    "breadcrumb": breadcrumb?.toJson(),
    "inLanguage": inLanguageValues.reverse[inLanguage],
    "itemListElement": itemListElement == null ? [] : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
    "publisher": publisher?.toJson(),
    "alternateName": alternateNameValues.reverse[alternateName],
    "potentialAction": potentialAction == null ? [] : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
    "logo": logo?.toJson(),
    "image": image?.toJson(),
    "sameAs": sameAs == null ? [] : List<dynamic>.from(sameAs!.map((x) => x)),
    "publishingPrinciples": publishingPrinciples,
    "ownershipFundingInfo": ownershipFundingInfo,
    "actionableFeedbackPolicy": actionableFeedbackPolicy,
  };
}

enum AlternateName {
  NOW_ENTERTAINMENT
}

final alternateNameValues = EnumValues({
  "Now Entertainment": AlternateName.NOW_ENTERTAINMENT
});

class Breadcrumb {
  String? id;

  Breadcrumb({
    this.id,
  });

  factory Breadcrumb.fromRawJson(String str) => Breadcrumb.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
    id: json["@id"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id,
  };
}

enum InLanguage {
  EN_US
}

final inLanguageValues = EnumValues({
  "en-US": InLanguage.EN_US
});

class ItemListElement {
  ItemListElementType? type;
  int? position;
  String? name;
  String? item;

  ItemListElement({
    this.type,
    this.position,
    this.name,
    this.item,
  });

  factory ItemListElement.fromRawJson(String str) => ItemListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemListElement.fromJson(Map<String, dynamic> json) => ItemListElement(
    type: itemListElementTypeValues.map[json["@type"]]!,
    position: json["position"],
    name: json["name"],
    item: json["item"],
  );

  Map<String, dynamic> toJson() => {
    "@type": itemListElementTypeValues.reverse[type],
    "position": position,
    "name": name,
    "item": item,
  };
}

enum ItemListElementType {
  LIST_ITEM
}

final itemListElementTypeValues = EnumValues({
  "ListItem": ItemListElementType.LIST_ITEM
});

class Logo {
  LogoType? type;
  InLanguage? inLanguage;
  String? id;
  String? url;
  String? contentUrl;
  int? width;
  int? height;
  OgSiteName? caption;

  Logo({
    this.type,
    this.inLanguage,
    this.id,
    this.url,
    this.contentUrl,
    this.width,
    this.height,
    this.caption,
  });

  factory Logo.fromRawJson(String str) => Logo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
    type: logoTypeValues.map[json["@type"]]!,
    inLanguage: inLanguageValues.map[json["inLanguage"]]!,
    id: json["@id"],
    url: json["url"],
    contentUrl: json["contentUrl"],
    width: json["width"],
    height: json["height"],
    caption: ogSiteNameValues.map[json["caption"]]!,
  );

  Map<String, dynamic> toJson() => {
    "@type": logoTypeValues.reverse[type],
    "inLanguage": inLanguageValues.reverse[inLanguage],
    "@id": id,
    "url": url,
    "contentUrl": contentUrl,
    "width": width,
    "height": height,
    "caption": ogSiteNameValues.reverse[caption],
  };
}

enum LogoType {
  IMAGE_OBJECT
}

final logoTypeValues = EnumValues({
  "ImageObject": LogoType.IMAGE_OBJECT
});

class PotentialAction {
  PotentialActionType? type;
  Target? target;
  QueryInput? queryInput;

  PotentialAction({
    this.type,
    this.target,
    this.queryInput,
  });

  factory PotentialAction.fromRawJson(String str) => PotentialAction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
    type: potentialActionTypeValues.map[json["@type"]]!,
    target: json["target"] == null ? null : Target.fromJson(json["target"]),
    queryInput: queryInputValues.map[json["query-input"]]!,
  );

  Map<String, dynamic> toJson() => {
    "@type": potentialActionTypeValues.reverse[type],
    "target": target?.toJson(),
    "query-input": queryInputValues.reverse[queryInput],
  };
}

enum QueryInput {
  REQUIRED_NAME_SEARCH_TERM_STRING
}

final queryInputValues = EnumValues({
  "required name=search_term_string": QueryInput.REQUIRED_NAME_SEARCH_TERM_STRING
});

class Target {
  TargetType? type;
  UrlTemplate? urlTemplate;

  Target({
    this.type,
    this.urlTemplate,
  });

  factory Target.fromRawJson(String str) => Target.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Target.fromJson(Map<String, dynamic> json) => Target(
    type: targetTypeValues.map[json["@type"]]!,
    urlTemplate: urlTemplateValues.map[json["urlTemplate"]]!,
  );

  Map<String, dynamic> toJson() => {
    "@type": targetTypeValues.reverse[type],
    "urlTemplate": urlTemplateValues.reverse[urlTemplate],
  };
}

enum TargetType {
  ENTRY_POINT
}

final targetTypeValues = EnumValues({
  "EntryPoint": TargetType.ENTRY_POINT
});

enum UrlTemplate {
  HTTPS_WWW_NOWENTERTAINMENT_NET_S_SEARCH_TERM_STRING
}

final urlTemplateValues = EnumValues({
  "https://www.nowentertainment.net/?s={search_term_string}": UrlTemplate.HTTPS_WWW_NOWENTERTAINMENT_NET_S_SEARCH_TERM_STRING
});

enum PotentialActionType {
  SEARCH_ACTION
}

final potentialActionTypeValues = EnumValues({
  "SearchAction": PotentialActionType.SEARCH_ACTION
});

enum GraphType {
  BREADCRUMB_LIST,
  COLLECTION_PAGE,
  ORGANIZATION,
  WEB_SITE
}

final graphTypeValues = EnumValues({
  "BreadcrumbList": GraphType.BREADCRUMB_LIST,
  "CollectionPage": GraphType.COLLECTION_PAGE,
  "Organization": GraphType.ORGANIZATION,
  "WebSite": GraphType.WEB_SITE
});

enum TwitterCard {
  SUMMARY_LARGE_IMAGE
}

final twitterCardValues = EnumValues({
  "summary_large_image": TwitterCard.SUMMARY_LARGE_IMAGE
});

enum TwitterSite {
  OFFICIALNOWENT
}

final twitterSiteValues = EnumValues({
  "@officialnowent": TwitterSite.OFFICIALNOWENT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
