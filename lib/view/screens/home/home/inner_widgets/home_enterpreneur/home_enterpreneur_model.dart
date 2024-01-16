/*
import 'dart:convert';

class HomeEnterpreneurModel {
  int? id;
  DateTime? date;
  // DateTime? dateGmt;
  // Guid? guid;
  // DateTime? modified;
  // DateTime? modifiedGmt;
  String? slug;
  // String? status;
  // String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  // int? author;
  // int? featuredMedia;
  // String? commentStatus;
  // String? pingStatus;
  // bool? sticky;
  // String? template;
  // String? format;
  // Meta? meta;
  // List<int>? categories;
  // List<int>? tags;
  // List<dynamic>? acf;
  // List<dynamic>? appleNewsNotices;
  // String? yoastHead;
  YoastHeadJson? yoastHeadJson;
  // Links? links;

  HomeEnterpreneurModel({
    this.id,
    this.date,
    // this.dateGmt,
    // this.guid,
    // this.modified,
    // this.modifiedGmt,
    this.slug,
    // this.status,
    // this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    // this.author,
    // this.featuredMedia,
    // this.commentStatus,
    // this.pingStatus,
    // this.sticky,
    // this.template,
    // this.format,
    // this.meta,
    // this.categories,
    // this.tags,
    // this.acf,
    // this.appleNewsNotices,
    // this.yoastHead,
    this.yoastHeadJson,
    // this.links,
  });

  factory HomeEnterpreneurModel.fromRawJson(String str) => HomeEnterpreneurModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeEnterpreneurModel.fromJson(Map<String, dynamic> json) => HomeEnterpreneurModel(
    id: json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    // dateGmt: json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
    // guid: json["guid"] == null ? null : Guid.fromJson(json["guid"]),
    // modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    // modifiedGmt: json["modified_gmt"] == null ? null : DateTime.parse(json["modified_gmt"]),
    slug: json["slug"],
    // status: json["status"],
    // type: json["type"],
    link: json["link"],
    title: json["title"] == null ? null : Guid.fromJson(json["title"]),
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
    excerpt: json["excerpt"] == null ? null : Content.fromJson(json["excerpt"]),
    // author: json["author"],
    // featuredMedia: json["featured_media"],
    // commentStatus: json["comment_status"],
    // pingStatus: json["ping_status"],
    // sticky: json["sticky"],
    // template: json["template"],
    // format: json["format"],
    // meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    // categories: json["categories"] == null ? [] : List<int>.from(json["categories"]!.map((x) => x)),
    // tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
    // acf: json["acf"] == null ? [] : List<dynamic>.from(json["acf"]!.map((x) => x)),
    // appleNewsNotices: json["apple_news_notices"] == null ? [] : List<dynamic>.from(json["apple_news_notices"]!.map((x) => x)),
    // yoastHead: json["yoast_head"],
    yoastHeadJson: json["yoast_head_json"] == null ? null : YoastHeadJson.fromJson(json["yoast_head_json"]),
    // links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date?.toIso8601String(),
    // "date_gmt": dateGmt?.toIso8601String(),
    // "guid": guid?.toJson(),
    // "modified": modified?.toIso8601String(),
    // "modified_gmt": modifiedGmt?.toIso8601String(),
    "slug": slug,
    // "status": status,
    // "type": type,
    "link": link,
    "title": title?.toJson(),
    "content": content?.toJson(),
    "excerpt": excerpt?.toJson(),
    // "author": author,
    // "featured_media": featuredMedia,
    // "comment_status": commentStatus,
    // "ping_status": pingStatus,
    // "sticky": sticky,
    // "template": template,
    // "format": format,
    // "meta": meta?.toJson(),
    // "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    // "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    // "acf": acf == null ? [] : List<dynamic>.from(acf!.map((x) => x)),
    // "apple_news_notices": appleNewsNotices == null ? [] : List<dynamic>.from(appleNewsNotices!.map((x) => x)),
    // "yoast_head": yoastHead,
    "yoast_head_json": yoastHeadJson?.toJson(),
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
  List<AuthorElement>? author;
  List<AuthorElement>? replies;
  List<VersionHistory>? versionHistory;
  List<AuthorElement>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;

  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? [] : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? [] : List<About>.from(json["collection"]!.map((x) => About.fromJson(x))),
    about: json["about"] == null ? [] : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
    author: json["author"] == null ? [] : List<AuthorElement>.from(json["author"]!.map((x) => AuthorElement.fromJson(x))),
    replies: json["replies"] == null ? [] : List<AuthorElement>.from(json["replies"]!.map((x) => AuthorElement.fromJson(x))),
    versionHistory: json["version-history"] == null ? [] : List<VersionHistory>.from(json["version-history"]!.map((x) => VersionHistory.fromJson(x))),
    wpFeaturedmedia: json["wp:featuredmedia"] == null ? [] : List<AuthorElement>.from(json["wp:featuredmedia"]!.map((x) => AuthorElement.fromJson(x))),
    wpAttachment: json["wp:attachment"] == null ? [] : List<About>.from(json["wp:attachment"]!.map((x) => About.fromJson(x))),
    wpTerm: json["wp:term"] == null ? [] : List<WpTerm>.from(json["wp:term"]!.map((x) => WpTerm.fromJson(x))),
    curies: json["curies"] == null ? [] : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? [] : List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": collection == null ? [] : List<dynamic>.from(collection!.map((x) => x.toJson())),
    "about": about == null ? [] : List<dynamic>.from(about!.map((x) => x.toJson())),
    "author": author == null ? [] : List<dynamic>.from(author!.map((x) => x.toJson())),
    "replies": replies == null ? [] : List<dynamic>.from(replies!.map((x) => x.toJson())),
    "version-history": versionHistory == null ? [] : List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
    "wp:featuredmedia": wpFeaturedmedia == null ? [] : List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
    "wp:attachment": wpAttachment == null ? [] : List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
    "wp:term": wpTerm == null ? [] : List<dynamic>.from(wpTerm!.map((x) => x.toJson())),
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

class AuthorElement {
  bool? embeddable;
  String? href;

  AuthorElement({
    this.embeddable,
    this.href,
  });

  factory AuthorElement.fromRawJson(String str) => AuthorElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthorElement.fromJson(Map<String, dynamic> json) => AuthorElement(
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

class WpTerm {
  Taxonomy? taxonomy;
  bool? embeddable;
  String? href;

  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  factory WpTerm.fromRawJson(String str) => WpTerm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
    taxonomy: taxonomyValues.map[json["taxonomy"]]!,
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "taxonomy": taxonomyValues.reverse[taxonomy],
    "embeddable": embeddable,
    "href": href,
  };
}

enum Taxonomy {
  CATEGORY,
  POST_TAG
}

final taxonomyValues = EnumValues({
  "category": Taxonomy.CATEGORY,
  "post_tag": Taxonomy.POST_TAG
});

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
  String? appleNewsApiCreatedAt;
  String? appleNewsApiId;
  String? appleNewsApiModifiedAt;
  String? appleNewsApiRevision;
  String? appleNewsApiShareUrl;
  int? appleNewsCoverimage;
  String? appleNewsCoverimageCaption;
  bool? appleNewsIsHidden;
  bool? appleNewsIsPaid;
  bool? appleNewsIsPreview;
  bool? appleNewsIsSponsored;
  String? appleNewsMaturityRating;
  String? appleNewsMetadata;
  String? appleNewsPullquote;
  String? appleNewsPullquotePosition;
  String? appleNewsSlug;
  String? appleNewsSections;
  bool? appleNewsSuppressVideoUrl;
  bool? appleNewsUseImageComponent;
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
    this.appleNewsApiCreatedAt,
    this.appleNewsApiId,
    this.appleNewsApiModifiedAt,
    this.appleNewsApiRevision,
    this.appleNewsApiShareUrl,
    this.appleNewsCoverimage,
    this.appleNewsCoverimageCaption,
    this.appleNewsIsHidden,
    this.appleNewsIsPaid,
    this.appleNewsIsPreview,
    this.appleNewsIsSponsored,
    this.appleNewsMaturityRating,
    this.appleNewsMetadata,
    this.appleNewsPullquote,
    this.appleNewsPullquotePosition,
    this.appleNewsSlug,
    this.appleNewsSections,
    this.appleNewsSuppressVideoUrl,
    this.appleNewsUseImageComponent,
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
    appleNewsApiCreatedAt: json["apple_news_api_created_at"],
    appleNewsApiId: json["apple_news_api_id"],
    appleNewsApiModifiedAt: json["apple_news_api_modified_at"],
    appleNewsApiRevision: json["apple_news_api_revision"],
    appleNewsApiShareUrl: json["apple_news_api_share_url"],
    appleNewsCoverimage: json["apple_news_coverimage"],
    appleNewsCoverimageCaption: json["apple_news_coverimage_caption"],
    appleNewsIsHidden: json["apple_news_is_hidden"],
    appleNewsIsPaid: json["apple_news_is_paid"],
    appleNewsIsPreview: json["apple_news_is_preview"],
    appleNewsIsSponsored: json["apple_news_is_sponsored"],
    appleNewsMaturityRating: json["apple_news_maturity_rating"],
    appleNewsMetadata: json["apple_news_metadata"],
    appleNewsPullquote: json["apple_news_pullquote"],
    appleNewsPullquotePosition: json["apple_news_pullquote_position"],
    appleNewsSlug: json["apple_news_slug"],
    appleNewsSections: json["apple_news_sections"],
    appleNewsSuppressVideoUrl: json["apple_news_suppress_video_url"],
    appleNewsUseImageComponent: json["apple_news_use_image_component"],
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
    "apple_news_api_created_at": appleNewsApiCreatedAt,
    "apple_news_api_id": appleNewsApiId,
    "apple_news_api_modified_at": appleNewsApiModifiedAt,
    "apple_news_api_revision": appleNewsApiRevision,
    "apple_news_api_share_url": appleNewsApiShareUrl,
    "apple_news_coverimage": appleNewsCoverimage,
    "apple_news_coverimage_caption": appleNewsCoverimageCaption,
    "apple_news_is_hidden": appleNewsIsHidden,
    "apple_news_is_paid": appleNewsIsPaid,
    "apple_news_is_preview": appleNewsIsPreview,
    "apple_news_is_sponsored": appleNewsIsSponsored,
    "apple_news_maturity_rating": appleNewsMaturityRating,
    "apple_news_metadata": appleNewsMetadata,
    "apple_news_pullquote": appleNewsPullquote,
    "apple_news_pullquote_position": appleNewsPullquotePosition,
    "apple_news_slug": appleNewsSlug,
    "apple_news_sections": appleNewsSections,
    "apple_news_suppress_video_url": appleNewsSuppressVideoUrl,
    "apple_news_use_image_component": appleNewsUseImageComponent,
    "footnotes": footnotes,
  };
}

class YoastHeadJson {
  String? title;
  String? description;
  // Robots? robots;
  // String? ogLocale;
  // String? ogType;
  String? ogTitle;
  String? ogDescription;
  // String? ogUrl;
  AuthorEnum? ogSiteName;
  // String? articlePublisher;
  // DateTime? articlePublishedTime;
  // DateTime? articleModifiedTime;
  List<OgImage>? ogImage;
  AuthorEnum? author;
  String? twitterCard;
  // String? twitterCreator;
  // String? twitterSite;
  // TwitterMisc? twitterMisc;
  // Schema? schema;

  YoastHeadJson({
    this.title,
    this.description,
    // this.robots,
    // this.ogLocale,
    // this.ogType,
    this.ogTitle,
    this.ogDescription,
    // this.ogUrl,
    this.ogSiteName,
    // this.articlePublisher,
    // this.articlePublishedTime,
    // this.articleModifiedTime,
    this.ogImage,
    this.author,
    this.twitterCard,
    // this.twitterCreator,
    // this.twitterSite,
    // this.twitterMisc,
    // this.schema,
  });

  factory YoastHeadJson.fromRawJson(String str) => YoastHeadJson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
    title: json["title"],
    description: json["description"],
    // robots: json["robots"] == null ? null : Robots.fromJson(json["robots"]),
    // ogLocale: json["og_locale"],
    // ogType: json["og_type"],
    ogTitle: json["og_title"],
    ogDescription: json["og_description"],
    // ogUrl: json["og_url"],
    ogSiteName: authorEnumValues.map[json["og_site_name"]]!,
    // articlePublisher: json["article_publisher"],
    // articlePublishedTime: json["article_published_time"] == null ? null : DateTime.parse(json["article_published_time"]),
    // articleModifiedTime: json["article_modified_time"] == null ? null : DateTime.parse(json["article_modified_time"]),
    ogImage: json["og_image"] == null ? [] : List<OgImage>.from(json["og_image"]!.map((x) => OgImage.fromJson(x))),
    author: authorEnumValues.map[json["author"]]!,
    twitterCard: json["twitter_card"],
    // twitterCreator: json["twitter_creator"],
    // twitterSite: json["twitter_site"],
    // twitterMisc: json["twitter_misc"] == null ? null : TwitterMisc.fromJson(json["twitter_misc"]),
    // schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    // "robots": robots?.toJson(),
    // "og_locale": ogLocale,
    // "og_type": ogType,
    "og_title": ogTitle,
    "og_description": ogDescription,
    // "og_url": ogUrl,
    "og_site_name": authorEnumValues.reverse[ogSiteName],
    // "article_publisher": articlePublisher,
    // "article_published_time": articlePublishedTime?.toIso8601String(),
    // "article_modified_time": articleModifiedTime?.toIso8601String(),
    "og_image": ogImage == null ? [] : List<dynamic>.from(ogImage!.map((x) => x.toJson())),
    "author": authorEnumValues.reverse[author],
    "twitter_card": twitterCard,
    // "twitter_creator": twitterCreator,
    // "twitter_site": twitterSite,
    // "twitter_misc": twitterMisc?.toJson(),
    // "schema": schema?.toJson(),
  };
}

enum AuthorEnum {
  NOW_ENTERTAINMENT_MAGAZINE,
  WRITTEN_IN_PARTNERSHIP_WITH_JON_STOJAN
}

final authorEnumValues = EnumValues({
  "Now Entertainment Magazine": AuthorEnum.NOW_ENTERTAINMENT_MAGAZINE,
  "Written in partnership with Jon Stojan": AuthorEnum.WRITTEN_IN_PARTNERSHIP_WITH_JON_STOJAN
});

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

  Robots({
    this.index,
    this.follow,
  });

  factory Robots.fromRawJson(String str) => Robots.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
    index: json["index"],
    follow: json["follow"],
  );

  Map<String, dynamic> toJson() => {
    "index": index,
    "follow": follow,
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
  GraphType? type;
  String? id;
  Breadcrumb? isPartOf;
  GraphAuthor? author;
  String? headline;
  DateTime? datePublished;
  DateTime? dateModified;
  Breadcrumb? mainEntityOfPage;
  int? wordCount;
  Breadcrumb? publisher;
  List<String>? keywords;
  List<String>? articleSection;
  InLanguage? inLanguage;
  String? copyrightYear;
  Breadcrumb? copyrightHolder;
  String? url;
  String? name;
  String? description;
  Breadcrumb? breadcrumb;
  List<PotentialAction>? potentialAction;
  List<ItemListElement>? itemListElement;
  AlternateName? alternateName;
  Image? logo;
  Image? image;
  List<String>? sameAs;
  String? publishingPrinciples;
  String? ownershipFundingInfo;
  String? actionableFeedbackPolicy;

  Graph({
    this.type,
    this.id,
    this.isPartOf,
    this.author,
    this.headline,
    this.datePublished,
    this.dateModified,
    this.mainEntityOfPage,
    this.wordCount,
    this.publisher,
    this.keywords,
    this.articleSection,
    this.inLanguage,
    this.copyrightYear,
    this.copyrightHolder,
    this.url,
    this.name,
    this.description,
    this.breadcrumb,
    this.potentialAction,
    this.itemListElement,
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
    type: graphTypeValues.map[json["@type"]]!,
    id: json["@id"],
    isPartOf: json["isPartOf"] == null ? null : Breadcrumb.fromJson(json["isPartOf"]),
    author: json["author"] == null ? null : GraphAuthor.fromJson(json["author"]),
    headline: json["headline"],
    datePublished: json["datePublished"] == null ? null : DateTime.parse(json["datePublished"]),
    dateModified: json["dateModified"] == null ? null : DateTime.parse(json["dateModified"]),
    mainEntityOfPage: json["mainEntityOfPage"] == null ? null : Breadcrumb.fromJson(json["mainEntityOfPage"]),
    wordCount: json["wordCount"],
    publisher: json["publisher"] == null ? null : Breadcrumb.fromJson(json["publisher"]),
    keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
    articleSection: json["articleSection"] == null ? [] : List<String>.from(json["articleSection"]!.map((x) => x)),
    inLanguage: inLanguageValues.map[json["inLanguage"]]!,
    copyrightYear: json["copyrightYear"],
    copyrightHolder: json["copyrightHolder"] == null ? null : Breadcrumb.fromJson(json["copyrightHolder"]),
    url: json["url"],
    name: json["name"],
    description: json["description"],
    breadcrumb: json["breadcrumb"] == null ? null : Breadcrumb.fromJson(json["breadcrumb"]),
    potentialAction: json["potentialAction"] == null ? [] : List<PotentialAction>.from(json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
    itemListElement: json["itemListElement"] == null ? [] : List<ItemListElement>.from(json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
    alternateName: alternateNameValues.map[json["alternateName"]]!,
    logo: json["logo"] == null ? null : Image.fromJson(json["logo"]),
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    sameAs: json["sameAs"] == null ? [] : List<String>.from(json["sameAs"]!.map((x) => x)),
    publishingPrinciples: json["publishingPrinciples"],
    ownershipFundingInfo: json["ownershipFundingInfo"],
    actionableFeedbackPolicy: json["actionableFeedbackPolicy"],
  );

  Map<String, dynamic> toJson() => {
    "@type": graphTypeValues.reverse[type],
    "@id": id,
    "isPartOf": isPartOf?.toJson(),
    "author": author?.toJson(),
    "headline": headline,
    "datePublished": datePublished?.toIso8601String(),
    "dateModified": dateModified?.toIso8601String(),
    "mainEntityOfPage": mainEntityOfPage?.toJson(),
    "wordCount": wordCount,
    "publisher": publisher?.toJson(),
    "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
    "articleSection": articleSection == null ? [] : List<dynamic>.from(articleSection!.map((x) => x)),
    "inLanguage": inLanguageValues.reverse[inLanguage],
    "copyrightYear": copyrightYear,
    "copyrightHolder": copyrightHolder?.toJson(),
    "url": url,
    "name": name,
    "description": description,
    "breadcrumb": breadcrumb?.toJson(),
    "potentialAction": potentialAction == null ? [] : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
    "itemListElement": itemListElement == null ? [] : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
    "alternateName": alternateNameValues.reverse[alternateName],
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

class GraphAuthor {
  AuthorEnum? name;
  String? id;

  GraphAuthor({
    this.name,
    this.id,
  });

  factory GraphAuthor.fromRawJson(String str) => GraphAuthor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GraphAuthor.fromJson(Map<String, dynamic> json) => GraphAuthor(
    name: authorEnumValues.map[json["name"]]!,
    id: json["@id"],
  );

  Map<String, dynamic> toJson() => {
    "name": authorEnumValues.reverse[name],
    "@id": id,
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

class Image {
  String? id;
  ImageType? type;
  InLanguage? inLanguage;
  String? url;
  String? contentUrl;
  AuthorEnum? caption;
  int? width;
  int? height;

  Image({
    this.id,
    this.type,
    this.inLanguage,
    this.url,
    this.contentUrl,
    this.caption,
    this.width,
    this.height,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["@id"],
    type: imageTypeValues.map[json["@type"]]!,
    inLanguage: inLanguageValues.map[json["inLanguage"]]!,
    url: json["url"],
    contentUrl: json["contentUrl"],
    caption: authorEnumValues.map[json["caption"]]!,
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id,
    "@type": imageTypeValues.reverse[type],
    "inLanguage": inLanguageValues.reverse[inLanguage],
    "url": url,
    "contentUrl": contentUrl,
    "caption": authorEnumValues.reverse[caption],
    "width": width,
    "height": height,
  };
}

enum InLanguage {
  EN_US
}

final inLanguageValues = EnumValues({
  "en-US": InLanguage.EN_US
});

enum ImageType {
  IMAGE_OBJECT
}

final imageTypeValues = EnumValues({
  "ImageObject": ImageType.IMAGE_OBJECT
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

class PotentialAction {
  PotentialActionType? type;
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
    type: potentialActionTypeValues.map[json["@type"]]!,
    target: json["target"],
    queryInput: json["query-input"],
  );

  Map<String, dynamic> toJson() => {
    "@type": potentialActionTypeValues.reverse[type],
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

enum PotentialActionType {
  READ_ACTION,
  SEARCH_ACTION
}

final potentialActionTypeValues = EnumValues({
  "ReadAction": PotentialActionType.READ_ACTION,
  "SearchAction": PotentialActionType.SEARCH_ACTION
});

enum GraphType {
  ARTICLE,
  BREADCRUMB_LIST,
  ORGANIZATION,
  PERSON,
  WEB_PAGE,
  WEB_SITE
}

final graphTypeValues = EnumValues({
  "Article": GraphType.ARTICLE,
  "BreadcrumbList": GraphType.BREADCRUMB_LIST,
  "Organization": GraphType.ORGANIZATION,
  "Person": GraphType.PERSON,
  "WebPage": GraphType.WEB_PAGE,
  "WebSite": GraphType.WEB_SITE
});

class TwitterMisc {
  AuthorEnum? writtenBy;
  String? estReadingTime;

  TwitterMisc({
    this.writtenBy,
    this.estReadingTime,
  });

  factory TwitterMisc.fromRawJson(String str) => TwitterMisc.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
    writtenBy: authorEnumValues.map[json["Written by"]]!,
    estReadingTime: json["Est. reading time"],
  );

  Map<String, dynamic> toJson() => {
    "Written by": authorEnumValues.reverse[writtenBy],
    "Est. reading time": estReadingTime,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
*/
