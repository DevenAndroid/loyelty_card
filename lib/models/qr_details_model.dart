class QrDetailsModel {
  String? id;
  String? externalId;
  String? groupingIdentifier;
  String? tierId;
  String? programId;
  Person? person;
  MetaData? metaData;
  bool? optOut;
  int? points;
  int? secondaryPoints;
  int? tierPoints;
  Null? expiryDate;
  String? status;
  PassOverrides? passOverrides;
  PassMetaData? passMetaData;
  Null? currentTierAwarded;
  Null? currentTierExpires;
  String? created;
  String? updated;
  String? profileImage;
  String? operation;

  QrDetailsModel(
      {this.id,
        this.externalId,
        this.groupingIdentifier,
        this.tierId,
        this.programId,
        this.person,
        this.metaData,
        this.optOut,
        this.points,
        this.secondaryPoints,
        this.tierPoints,
        this.expiryDate,
        this.status,
        this.passOverrides,
        this.passMetaData,
        this.currentTierAwarded,
        this.currentTierExpires,
        this.created,
        this.updated,
        this.profileImage,
        this.operation});

  QrDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    externalId = json['externalId'];
    groupingIdentifier = json['groupingIdentifier'];
    tierId = json['tierId'];
    programId = json['programId'];
    person =
    json['person'] != null ? new Person.fromJson(json['person']) : null;
    metaData = json['metaData'] != null
        ? new MetaData.fromJson(json['metaData'])
        : null;
    optOut = json['optOut'];
    points = json['points'];
    secondaryPoints = json['secondaryPoints'];
    tierPoints = json['tierPoints'];
    expiryDate = json['expiryDate'];
    status = json['status'];
    passOverrides = json['passOverrides'] != null
        ? new PassOverrides.fromJson(json['passOverrides'])
        : null;
    passMetaData = json['passMetaData'] != null
        ? new PassMetaData.fromJson(json['passMetaData'])
        : null;
    currentTierAwarded = json['currentTierAwarded'];
    currentTierExpires = json['currentTierExpires'];
    created = json['created'];
    updated = json['updated'];
    profileImage = json['profileImage'];
    operation = json['operation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['externalId'] = this.externalId;
    data['groupingIdentifier'] = this.groupingIdentifier;
    data['tierId'] = this.tierId;
    data['programId'] = this.programId;
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    if (this.metaData != null) {
      data['metaData'] = this.metaData!.toJson();
    }
    data['optOut'] = this.optOut;
    data['points'] = this.points;
    data['secondaryPoints'] = this.secondaryPoints;
    data['tierPoints'] = this.tierPoints;
    data['expiryDate'] = this.expiryDate;
    data['status'] = this.status;
    if (this.passOverrides != null) {
      data['passOverrides'] = this.passOverrides!.toJson();
    }
    if (this.passMetaData != null) {
      data['passMetaData'] = this.passMetaData!.toJson();
    }
    data['currentTierAwarded'] = this.currentTierAwarded;
    data['currentTierExpires'] = this.currentTierExpires;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['profileImage'] = this.profileImage;
    data['operation'] = this.operation;
    return data;
  }
}

class Person {
  String? surname;
  String? forename;
  List<String>? otherNames;
  String? salutation;
  String? suffix;
  String? displayName;
  String? gender;
  DateOfBirth? dateOfBirth;
  String? emailAddress;
  String? mobileNumber;
  String? externalId;

  Person(
      {this.surname,
        this.forename,
        this.otherNames,
        this.salutation,
        this.suffix,
        this.displayName,
        this.gender,
        this.dateOfBirth,
        this.emailAddress,
        this.mobileNumber,
        this.externalId});

  Person.fromJson(Map<String, dynamic> json) {
    surname = json['surname'];
    forename = json['forename'];
    otherNames = json['otherNames'].cast<String>();
    salutation = json['salutation'];
    suffix = json['suffix'];
    displayName = json['displayName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'] != null
        ? new DateOfBirth.fromJson(json['dateOfBirth'])
        : null;
    emailAddress = json['emailAddress'];
    mobileNumber = json['mobileNumber'];
    externalId = json['externalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surname'] = this.surname;
    data['forename'] = this.forename;
    data['otherNames'] = this.otherNames;
    data['salutation'] = this.salutation;
    data['suffix'] = this.suffix;
    data['displayName'] = this.displayName;
    data['gender'] = this.gender;
    if (this.dateOfBirth != null) {
      data['dateOfBirth'] = this.dateOfBirth!.toJson();
    }
    data['emailAddress'] = this.emailAddress;
    data['mobileNumber'] = this.mobileNumber;
    data['externalId'] = this.externalId;
    return data;
  }
}

class DateOfBirth {
  int? year;
  int? month;
  int? day;

  DateOfBirth({this.year, this.month, this.day});

  DateOfBirth.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    return data;
  }
}

class MetaData {
  String? remainingpoints;
  String? stampStatus;

  MetaData({this.remainingpoints, this.stampStatus});

  MetaData.fromJson(Map<String, dynamic> json) {
    remainingpoints = json['remainingpoints'];
    stampStatus = json['stamp.status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remainingpoints'] = this.remainingpoints;
    data['stamp.status'] = this.stampStatus;
    return data;
  }
}

class PassOverrides {
  Null? imageIds;
  Null? colors;
  List<int>? associatedStoreIdentifiers;

  PassOverrides({this.imageIds, this.colors, this.associatedStoreIdentifiers});

  PassOverrides.fromJson(Map<String, dynamic> json) {
    imageIds = json['imageIds'];
    colors = json['colors'];
    associatedStoreIdentifiers = json['associatedStoreIdentifiers'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageIds'] = this.imageIds;
    data['colors'] = this.colors;
    data['associatedStoreIdentifiers'] = this.associatedStoreIdentifiers;
    return data;
  }
}

class PassMetaData {
  String? status;
  List<String>? lifecycleEvents;
  Utm? utm;
  String? altId;
  String? issueIpAddress;
  String? installIpAddress;
  RenderLocation? renderLocation;
  String? renderIpAddress;
  String? installUserAgent;
  String? renderUserAgent;
  List<String>? installDeviceAttributes;
  List<String>? renderDeviceAttributes;
  String? issueAt;
  String? renderedAt;
  String? firstInstalledAt;
  String? lastInstalledAt;
  Null? firstUninstalledAt;
  Null? lastUninstalledAt;
  Null? invalidatedAt;
  Null? lastUpdatedAt;

  PassMetaData(
      {this.status,
        this.lifecycleEvents,
        this.utm,
        this.altId,
        this.issueIpAddress,
        this.installIpAddress,
        this.renderLocation,
        this.renderIpAddress,
        this.installUserAgent,
        this.renderUserAgent,
        this.installDeviceAttributes,
        this.renderDeviceAttributes,
        this.issueAt,
        this.renderedAt,
        this.firstInstalledAt,
        this.lastInstalledAt,
        this.firstUninstalledAt,
        this.lastUninstalledAt,
        this.invalidatedAt,
        this.lastUpdatedAt});

  PassMetaData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    lifecycleEvents = json['lifecycleEvents'].cast<String>();
    utm = json['utm'] != null ? new Utm.fromJson(json['utm']) : null;
    altId = json['altId'];
    issueIpAddress = json['issueIpAddress'];
    installIpAddress = json['installIpAddress'];
    renderLocation = json['renderLocation'] != null
        ? new RenderLocation.fromJson(json['renderLocation'])
        : null;
    renderIpAddress = json['renderIpAddress'];
    installUserAgent = json['installUserAgent'];
    renderUserAgent = json['renderUserAgent'];
    installDeviceAttributes = json['installDeviceAttributes'].cast<String>();
    renderDeviceAttributes = json['renderDeviceAttributes'].cast<String>();
    issueAt = json['issueAt'];
    renderedAt = json['renderedAt'];
    firstInstalledAt = json['firstInstalledAt'];
    lastInstalledAt = json['lastInstalledAt'];
    firstUninstalledAt = json['firstUninstalledAt'];
    lastUninstalledAt = json['lastUninstalledAt'];
    invalidatedAt = json['invalidatedAt'];
    lastUpdatedAt = json['lastUpdatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['lifecycleEvents'] = this.lifecycleEvents;
    if (this.utm != null) {
      data['utm'] = this.utm!.toJson();
    }
    data['altId'] = this.altId;
    data['issueIpAddress'] = this.issueIpAddress;
    data['installIpAddress'] = this.installIpAddress;
    if (this.renderLocation != null) {
      data['renderLocation'] = this.renderLocation!.toJson();
    }
    data['renderIpAddress'] = this.renderIpAddress;
    data['installUserAgent'] = this.installUserAgent;
    data['renderUserAgent'] = this.renderUserAgent;
    data['installDeviceAttributes'] = this.installDeviceAttributes;
    data['renderDeviceAttributes'] = this.renderDeviceAttributes;
    data['issueAt'] = this.issueAt;
    data['renderedAt'] = this.renderedAt;
    data['firstInstalledAt'] = this.firstInstalledAt;
    data['lastInstalledAt'] = this.lastInstalledAt;
    data['firstUninstalledAt'] = this.firstUninstalledAt;
    data['lastUninstalledAt'] = this.lastUninstalledAt;
    data['invalidatedAt'] = this.invalidatedAt;
    data['lastUpdatedAt'] = this.lastUpdatedAt;
    return data;
  }
}

class Utm {
  String? source;
  String? medium;
  String? name;
  String? term;
  String? content;

  Utm({this.source, this.medium, this.name, this.term, this.content});

  Utm.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    medium = json['medium'];
    name = json['name'];
    term = json['term'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    data['medium'] = this.medium;
    data['name'] = this.name;
    data['term'] = this.term;
    data['content'] = this.content;
    return data;
  }
}

class RenderLocation {
  String? country;
  String? city;
  String? state;
  double? latitude;
  double? longitude;

  RenderLocation(
      {this.country, this.city, this.state, this.latitude, this.longitude});

  RenderLocation.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
    state = json['state'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
