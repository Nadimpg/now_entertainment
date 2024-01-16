import 'dart:convert';

class AboutUsModel {
  // int? id;
  // DateTime? date;
  // DateTime? dateGmt;
  // Guid? guid;
  // DateTime? modified;
  // DateTime? modifiedGmt;
  // String? slug;
  // String? status;
  // String? type;
  // String? link;
  // Guid? title;
  Content? content;
  // Content? excerpt;
  // int? author;
  // int? featuredMedia;
  // int? parent;
  // int? menuOrder;
  // String? commentStatus;
  // String? pingStatus;
  // String? template;
  // Meta? meta;
  // List<dynamic>? acf;
  // String? yoastHead;
  // YoastHeadJson? yoastHeadJson;
  // Links? links;

  AboutUsModel({
    // this.id,
    // this.date,
    // this.dateGmt,
    // this.guid,
    // this.modified,
    // this.modifiedGmt,
    // this.slug,
    // this.status,
    // this.type,
    // this.link,
    // this.title,
    this.content,
    // this.excerpt,
    // this.author,
    // this.featuredMedia,
    // this.parent,
    // this.menuOrder,
    // this.commentStatus,
    // this.pingStatus,
    // this.template,
    // this.meta,
    // this.acf,
    // this.yoastHead,
    // this.yoastHeadJson,
    // this.links,
  });

  factory AboutUsModel.fromRawJson(String str) => AboutUsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
    // id: json["id"],
    // date: json["date"] == null ? null : DateTime.parse(json["date"]),
    // dateGmt: json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
    // guid: json["guid"] == null ? null : Guid.fromJson(json["guid"]),
    // modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    // modifiedGmt: json["modified_gmt"] == null ? null : DateTime.parse(json["modified_gmt"]),
    // slug: json["slug"],
    // status: json["status"],
    // type: json["type"],
    // link: json["link"],
    // title: json["title"] == null ? null : Guid.fromJson(json["title"]),
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
    // excerpt: json["excerpt"] == null ? null : Content.fromJson(json["excerpt"]),
    // author: json["author"],
    // featuredMedia: json["featured_media"],
    // parent: json["parent"],
    // menuOrder: json["menu_order"],
    // commentStatus: json["comment_status"],
    // pingStatus: json["ping_status"],
    // template: json["template"],
    // meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    // acf: json["acf"] == null ? [] : List<dynamic>.from(json["acf"]!.map((x) => x)),
    // yoastHead: json["yoast_head"],
    // yoastHeadJson: json["yoast_head_json"] == null ? null : YoastHeadJson.fromJson(json["yoast_head_json"]),
    // links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    // "date": date?.toIso8601String(),
    // "date_gmt": dateGmt?.toIso8601String(),
    // "guid": guid?.toJson(),
    // "modified": modified?.toIso8601String(),
    // "modified_gmt": modifiedGmt?.toIso8601String(),
    // "slug": slug,
    // "status": status,
    // "type": type,
    // "link": link,
    // "title": title?.toJson(),
    "content": content?.toJson(),
    // "excerpt": excerpt?.toJson(),
    // "author": author,
    // "featured_media": featuredMedia,
    // "parent": parent,
    // "menu_order": menuOrder,
    // "comment_status": commentStatus,
    // "ping_status": pingStatus,
    // "template": template,
    // "meta": meta?.toJson(),
    // "acf": acf == null ? [] : List<dynamic>.from(acf!.map((x) => x)),
    // "yoast_head": yoastHead,
    // "yoast_head_json": yoastHeadJson?.toJson(),
    // "_links": links?.toJson(),
  };
}

class Content {
  String? rendered;
  bool? protected;

  Content({
    this.rendered,
    this.protected,
  });

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    rendered: json["rendered"],
    protected: json["protected"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
    "protected": protected,
  };
}

class Guid {
  String? rendered;

  Guid({
    this.rendered,
  });

  factory Guid.fromRawJson(String str) => Guid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
    rendered: json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
  };
}

class Links {
  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? author;
  List<Author>? replies;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
  List<Author>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<Cury>? curies;

  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.curies,
  });

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? [] : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? [] : List<About>.from(json["collection"]!.map((x) => About.fromJson(x))),
    about: json["about"] == null ? [] : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
    author: json["author"] == null ? [] : List<Author>.from(json["author"]!.map((x) => Author.fromJson(x))),
    replies: json["replies"] == null ? [] : List<Author>.from(json["replies"]!.map((x) => Author.fromJson(x))),
    versionHistory: json["version-history"] == null ? [] : List<VersionHistory>.from(json["version-history"]!.map((x) => VersionHistory.fromJson(x))),
    predecessorVersion: json["predecessor-version"] == null ? [] : List<PredecessorVersion>.from(json["predecessor-version"]!.map((x) => PredecessorVersion.fromJson(x))),
    wpFeaturedmedia: json["wp:featuredmedia"] == null ? [] : List<Author>.from(json["wp:featuredmedia"]!.map((x) => Author.fromJson(x))),
    wpAttachment: json["wp:attachment"] == null ? [] : List<About>.from(json["wp:attachment"]!.map((x) => About.fromJson(x))),
    curies: json["curies"] == null ? [] : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? [] : List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": collection == null ? [] : List<dynamic>.from(collection!.map((x) => x.toJson())),
    "about": about == null ? [] : List<dynamic>.from(about!.map((x) => x.toJson())),
    "author": author == null ? [] : List<dynamic>.from(author!.map((x) => x.toJson())),
    "replies": replies == null ? [] : List<dynamic>.from(replies!.map((x) => x.toJson())),
    "version-history": versionHistory == null ? [] : List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
    "predecessor-version": predecessorVersion == null ? [] : List<dynamic>.from(predecessorVersion!.map((x) => x.toJson())),
    "wp:featuredmedia": wpFeaturedmedia == null ? [] : List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
    "wp:attachment": wpAttachment == null ? [] : List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
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

class Author {
  bool? embeddable;
  String? href;

  Author({
    this.embeddable,
    this.href,
  });

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable,
    "href": href,
  };
}

class Cury {
  String? name;
  String? href;
  bool? templated;

  Cury({
    this.name,
    this.href,
    this.templated,
  });

  factory Cury.fromRawJson(String str) => Cury.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: json["name"],
    href: json["href"],
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "href": href,
    "templated": templated,
  };
}

class PredecessorVersion {
  int? id;
  String? href;

  PredecessorVersion({
    this.id,
    this.href,
  });

  factory PredecessorVersion.fromRawJson(String str) => PredecessorVersion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) => PredecessorVersion(
    id: json["id"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "href": href,
  };
}

class VersionHistory {
  int? count;
  String? href;

  VersionHistory({
    this.count,
    this.href,
  });

  factory VersionHistory.fromRawJson(String str) => VersionHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
    count: json["count"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "href": href,
  };
}

class Meta {
  String? msnCategories;
  bool? msnPublishOption;
  bool? msnIsLocalNews;
  String? msnLocation;
  bool? msnAddFeatureImgOnTopOfPost;
  bool? msnHasCustomAuthor;
  String? msnCustomAuthor;
  bool? msnHasCustomCanonicalUrl;
  String? msnCustomCanonicalUrl;
  bool? mbpGutenbergAutopost;
  String? footnotes;

  Meta({
    this.msnCategories,
    this.msnPublishOption,
    this.msnIsLocalNews,
    this.msnLocation,
    this.msnAddFeatureImgOnTopOfPost,
    this.msnHasCustomAuthor,
    this.msnCustomAuthor,
    this.msnHasCustomCanonicalUrl,
    this.msnCustomCanonicalUrl,
    this.mbpGutenbergAutopost,
    this.footnotes,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    msnCategories: json["MSN_Categories"],
    msnPublishOption: json["MSN_Publish_Option"],
    msnIsLocalNews: json["MSN_Is_Local_News"],
    msnLocation: json["MSN_Location"],
    msnAddFeatureImgOnTopOfPost: json["MSN_Add_Feature_Img_On_Top_Of_Post"],
    msnHasCustomAuthor: json["MSN_Has_Custom_Author"],
    msnCustomAuthor: json["MSN_Custom_Author"],
    msnHasCustomCanonicalUrl: json["MSN_Has_Custom_Canonical_Url"],
    msnCustomCanonicalUrl: json["MSN_Custom_Canonical_Url"],
    mbpGutenbergAutopost: json["_mbp_gutenberg_autopost"],
    footnotes: json["footnotes"],
  );

  Map<String, dynamic> toJson() => {
    "MSN_Categories": msnCategories,
    "MSN_Publish_Option": msnPublishOption,
    "MSN_Is_Local_News": msnIsLocalNews,
    "MSN_Location": msnLocation,
    "MSN_Add_Feature_Img_On_Top_Of_Post": msnAddFeatureImgOnTopOfPost,
    "MSN_Has_Custom_Author": msnHasCustomAuthor,
    "MSN_Custom_Author": msnCustomAuthor,
    "MSN_Has_Custom_Canonical_Url": msnHasCustomCanonicalUrl,
    "MSN_Custom_Canonical_Url": msnCustomCanonicalUrl,
    "_mbp_gutenberg_autopost": mbpGutenbergAutopost,
    "footnotes": footnotes,
  };
}

class YoastHeadJson {
  String? title;
  String? description;
  Robots? robots;
  String? canonical;
  String? ogLocale;
  String? ogType;
  String? ogTitle;
  String? ogUrl;
  String? ogSiteName;
  String? articlePublisher;
  DateTime? articleModifiedTime;
  List<OgImage>? ogImage;
  String? twitterCard;
  String? twitterSite;
  TwitterMisc? twitterMisc;
  Schema? schema;

  YoastHeadJson({
    this.title,
    this.description,
    this.robots,
    this.canonical,
    this.ogLocale,
    this.ogType,
    this.ogTitle,
    this.ogUrl,
    this.ogSiteName,
    this.articlePublisher,
    this.articleModifiedTime,
    this.ogImage,
    this.twitterCard,
    this.twitterSite,
    this.twitterMisc,
    this.schema,
  });

  factory YoastHeadJson.fromRawJson(String str) => YoastHeadJson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
    title: json["title"],
    description: json["description"],
    robots: json["robots"] == null ? null : Robots.fromJson(json["robots"]),
    canonical: json["canonical"],
    ogLocale: json["og_locale"],
    ogType: json["og_type"],
    ogTitle: json["og_title"],
    ogUrl: json["og_url"],
    ogSiteName: json["og_site_name"],
    articlePublisher: json["article_publisher"],
    articleModifiedTime: json["article_modified_time"] == null ? null : DateTime.parse(json["article_modified_time"]),
    ogImage: json["og_image"] == null ? [] : List<OgImage>.from(json["og_image"]!.map((x) => OgImage.fromJson(x))),
    twitterCard: json["twitter_card"],
    twitterSite: json["twitter_site"],
    twitterMisc: json["twitter_misc"] == null ? null : TwitterMisc.fromJson(json["twitter_misc"]),
    schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "robots": robots?.toJson(),
    "canonical": canonical,
    "og_locale": ogLocale,
    "og_type": ogType,
    "og_title": ogTitle,
    "og_url": ogUrl,
    "og_site_name": ogSiteName,
    "article_publisher": articlePublisher,
    "article_modified_time": articleModifiedTime?.toIso8601String(),
    "og_image": ogImage == null ? [] : List<dynamic>.from(ogImage!.map((x) => x.toJson())),
    "twitter_card": twitterCard,
    "twitter_site": twitterSite,
    "twitter_misc": twitterMisc?.toJson(),
    "schema": schema?.toJson(),
  };
}

class OgImage {
  int? width;
  int? height;
  String? url;
  String? type;

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
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "url": url,
    "type": type,
  };
}

class Robots {
  String? index;
  String? follow;
  String? maxSnippet;
  String? maxImagePreview;
  String? maxVideoPreview;

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
    index: json["index"],
    follow: json["follow"],
    maxSnippet: json["max-snippet"],
    maxImagePreview: json["max-image-preview"],
    maxVideoPreview: json["max-video-preview"],
  );

  Map<String, dynamic> toJson() => {
    "index": index,
    "follow": follow,
    "max-snippet": maxSnippet,
    "max-image-preview": maxImagePreview,
    "max-video-preview": maxVideoPreview,
  };
}

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
  String? type;
  String? id;
  String? url;
  String? name;
  Breadcrumb? isPartOf;
  DateTime? datePublished;
  DateTime? dateModified;
  String? description;
  Breadcrumb? breadcrumb;
  String? inLanguage;
  List<PotentialAction>? potentialAction;
  List<ItemListElement>? itemListElement;
  Breadcrumb? publisher;
  String? alternateName;
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
    this.datePublished,
    this.dateModified,
    this.description,
    this.breadcrumb,
    this.inLanguage,
    this.potentialAction,
    this.itemListElement,
    this.publisher,
    this.alternateName,
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
    type: json["@type"],
    id: json["@id"],
    url: json["url"],
    name: json["name"],
    isPartOf: json["isPartOf"] == null ? null : Breadcrumb.fromJson(json["isPartOf"]),
    datePublished: json["datePublished"] == null ? null : DateTime.parse(json["datePublished"]),
    dateModified: json["dateModified"] == null ? null : DateTime.parse(json["dateModified"]),
    description: json["description"],
    breadcrumb: json["breadcrumb"] == null ? null : Breadcrumb.fromJson(json["breadcrumb"]),
    inLanguage: json["inLanguage"],
    potentialAction: json["potentialAction"] == null ? [] : List<PotentialAction>.from(json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
    itemListElement: json["itemListElement"] == null ? [] : List<ItemListElement>.from(json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
    publisher: json["publisher"] == null ? null : Breadcrumb.fromJson(json["publisher"]),
    alternateName: json["alternateName"],
    logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
    image: json["image"] == null ? null : Breadcrumb.fromJson(json["image"]),
    sameAs: json["sameAs"] == null ? [] : List<String>.from(json["sameAs"]!.map((x) => x)),
    publishingPrinciples: json["publishingPrinciples"],
    ownershipFundingInfo: json["ownershipFundingInfo"],
    actionableFeedbackPolicy: json["actionableFeedbackPolicy"],
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "@id": id,
    "url": url,
    "name": name,
    "isPartOf": isPartOf?.toJson(),
    "datePublished": datePublished?.toIso8601String(),
    "dateModified": dateModified?.toIso8601String(),
    "description": description,
    "breadcrumb": breadcrumb?.toJson(),
    "inLanguage": inLanguage,
    "potentialAction": potentialAction == null ? [] : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
    "itemListElement": itemListElement == null ? [] : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
    "publisher": publisher?.toJson(),
    "alternateName": alternateName,
    "logo": logo?.toJson(),
    "image": image?.toJson(),
    "sameAs": sameAs == null ? [] : List<dynamic>.from(sameAs!.map((x) => x)),
    "publishingPrinciples": publishingPrinciples,
    "ownershipFundingInfo": ownershipFundingInfo,
    "actionableFeedbackPolicy": actionableFeedbackPolicy,
  };
}

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

class ItemListElement {
  String? type;
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
    type: json["@type"],
    position: json["position"],
    name: json["name"],
    item: json["item"],
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "position": position,
    "name": name,
    "item": item,
  };
}

class Logo {
  String? type;
  String? inLanguage;
  String? id;
  String? url;
  String? contentUrl;
  int? width;
  int? height;
  String? caption;

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
    type: json["@type"],
    inLanguage: json["inLanguage"],
    id: json["@id"],
    url: json["url"],
    contentUrl: json["contentUrl"],
    width: json["width"],
    height: json["height"],
    caption: json["caption"],
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "inLanguage": inLanguage,
    "@id": id,
    "url": url,
    "contentUrl": contentUrl,
    "width": width,
    "height": height,
    "caption": caption,
  };
}

class PotentialAction {
  String? type;
  dynamic target;
  String? queryInput;

  PotentialAction({
    this.type,
    this.target,
    this.queryInput,
  });

  factory PotentialAction.fromRawJson(String str) => PotentialAction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
    type: json["@type"],
    target: json["target"],
    queryInput: json["query-input"],
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "target": target,
    "query-input": queryInput,
  };
}

class TargetClass {
  String? type;
  String? urlTemplate;

  TargetClass({
    this.type,
    this.urlTemplate,
  });

  factory TargetClass.fromRawJson(String str) => TargetClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
    type: json["@type"],
    urlTemplate: json["urlTemplate"],
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "urlTemplate": urlTemplate,
  };
}

class TwitterMisc {
  String? estReadingTime;

  TwitterMisc({
    this.estReadingTime,
  });

  factory TwitterMisc.fromRawJson(String str) => TwitterMisc.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
    estReadingTime: json["Est. reading time"],
  );

  Map<String, dynamic> toJson() => {
    "Est. reading time": estReadingTime,
  };
}
