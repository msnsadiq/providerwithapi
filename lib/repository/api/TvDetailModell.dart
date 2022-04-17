/// adult : false
/// backdrop_path : "/7gbmM2NWcqZONbp65HUWDf4wr0Q.jpg"
/// created_by : [{"id":2564771,"credit_id":"623ea32b9451e7005e6a1522","name":"Hikaru Yamaguchi","gender":0,"profile_path":null}]
/// episode_run_time : [23]
/// first_air_date : "2019-07-12"
/// genres : [{"id":16,"name":"Animation"},{"id":18,"name":"Drama"}]
/// homepage : "http://given-anime.com/"
/// id : 88040
/// in_production : false
/// languages : ["ja"]
/// last_air_date : "2019-09-20"
/// last_episode_to_air : {"air_date":"2019-09-20","episode_number":11,"id":1821974,"name":"Song2","overview":"Mafuyu tells Ritsuka that he likes him and Ritsuka is ecstatic to find out that they both like each other but at the same time, he remembers himself saying that band members should never bring relationships into the band. However, they both decide to talk to Haruki and Akihiko about it. Haruki gives them a lecture and Akihiko congratulates them. Meanwhile, Haruki, who likes Akihiko...","production_code":"","season_number":1,"still_path":"/jCVp3AgKkPlfrTSeajv6T1WDc2I.jpg","vote_average":0.0,"vote_count":0}
/// name : "Given"
/// next_episode_to_air : null
/// networks : [{"name":"Fuji TV","id":1,"logo_path":"/yS5UJjsSdZXML0YikWTYYHLPKhQ.png","origin_country":"JP"}]
/// number_of_episodes : 11
/// number_of_seasons : 1
/// origin_country : ["JP"]
/// original_language : "ja"
/// original_name : "ギヴン"
/// overview : "Tightly clutching his Gibson guitar, Mafuyu Satou steps out of his dark apartment to begin another day of his high school life. While taking a nap in a quiet spot on the gymnasium staircase, he has a chance encounter with fellow student Ritsuka Uenoyama, who berates him for letting his guitar's strings rust and break. Noticing Uenoyama's knowledge of the instrument, Satou pleads for him to fix it and to teach him how to play. Uenoyama eventually agrees and invites him to sit in on a jam session with his two band mates: bassist Haruki Nakayama and drummer Akihiko Kaji."
/// popularity : 46.844
/// poster_path : "/lTP5yFKt2wzv8vM4EheNgIejEVu.jpg"
/// production_companies : [{"id":42811,"logo_path":"/2ZPUk3aYOtKbZk1W4Kp6mfeays8.png","name":"Lerche","origin_country":"JP"}]
/// production_countries : [{"iso_3166_1":"JP","name":"Japan"}]
/// seasons : [{"air_date":"2021-12-01","episode_count":1,"id":197057,"name":"Specials","overview":"","poster_path":"/uX0XLiZpA1tuyobSMb38HyGv5xR.jpg","season_number":0},{"air_date":"2019-07-12","episode_count":11,"id":121356,"name":"Season 1","overview":"","poster_path":"/vmuzyiHZv3JNRVUOEAEy0YqJKsO.jpg","season_number":1}]
/// spoken_languages : [{"english_name":"Japanese","iso_639_1":"ja","name":"日本語"}]
/// status : "Ended"
/// tagline : "Can't say goodbye, I'm still drifting with your echoes."
/// type : "Scripted"
/// vote_average : 9.0
/// vote_count : 605

class TvDetailModell {
  TvDetailModell({
    bool? adult,
    String? backdropPath,
    List<CreatedBy>? createdBy,
    List<int>? episodeRunTime,
    String? firstAirDate,
    List<Genres>? genres,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    String? lastAirDate,
    LastEpisodeToAir? lastEpisodeToAir,
    String? name,
    dynamic nextEpisodeToAir,
    List<Networks>? networks,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompanies>? productionCompanies,
    List<ProductionCountries>? productionCountries,
    List<Seasons>? seasons,
    List<SpokenLanguages>? spokenLanguages,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
  }) {
    _adult = adult;
    _backdropPath = backdropPath;
    _createdBy = createdBy;
    _episodeRunTime = episodeRunTime;
    _firstAirDate = firstAirDate;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _inProduction = inProduction;
    _languages = languages;
    _lastAirDate = lastAirDate;
    _lastEpisodeToAir = lastEpisodeToAir;
    _name = name;
    _nextEpisodeToAir = nextEpisodeToAir;
    _networks = networks;
    _numberOfEpisodes = numberOfEpisodes;
    _numberOfSeasons = numberOfSeasons;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalName = originalName;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _seasons = seasons;
    _spokenLanguages = spokenLanguages;
    _status = status;
    _tagline = tagline;
    _type = type;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  TvDetailModell.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      _createdBy = [];
      json['created_by'].forEach((v) {
        _createdBy?.add(CreatedBy.fromJson(v));
      });
    }
    _episodeRunTime = json['episode_run_time'] != null
        ? json['episode_run_time'].cast<int>()
        : [];
    _firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
    _inProduction = json['in_production'];
    _languages =
        json['languages'] != null ? json['languages'].cast<String>() : [];
    _lastAirDate = json['last_air_date'];
    _lastEpisodeToAir = json['last_episode_to_air'] != null
        ? LastEpisodeToAir.fromJson(json['lastEpisodeToAir'])
        : null;
    _name = json['name'];
    _nextEpisodeToAir = json['next_episode_to_air'];
    if (json['networks'] != null) {
      _networks = [];
      json['networks'].forEach((v) {
        _networks?.add(Networks.fromJson(v));
      });
    }
    _numberOfEpisodes = json['number_of_episodes'];
    _numberOfSeasons = json['number_of_seasons'];
    _originCountry = json['origin_country'] != null
        ? json['origin_country'].cast<String>()
        : [];
    _originalLanguage = json['original_language'];
    _originalName = json['original_name'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = [];
      json['production_companies'].forEach((v) {
        _productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = [];
      json['production_countries'].forEach((v) {
        _productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      _seasons = [];
      json['seasons'].forEach((v) {
        _seasons?.add(Seasons.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      _spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        _spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    _status = json['status'];
    _tagline = json['tagline'];
    _type = json['type'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  List<CreatedBy>? _createdBy;
  List<int>? _episodeRunTime;
  String? _firstAirDate;
  List<Genres>? _genres;
  String? _homepage;
  int? _id;
  bool? _inProduction;
  List<String>? _languages;
  String? _lastAirDate;
  LastEpisodeToAir? _lastEpisodeToAir;
  String? _name;
  dynamic _nextEpisodeToAir;
  List<Networks>? _networks;
  int? _numberOfEpisodes;
  int? _numberOfSeasons;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalName;
  String? _overview;
  double? _popularity;
  String? _posterPath;
  List<ProductionCompanies>? _productionCompanies;
  List<ProductionCountries>? _productionCountries;
  List<Seasons>? _seasons;
  List<SpokenLanguages>? _spokenLanguages;
  String? _status;
  String? _tagline;
  String? _type;
  double? _voteAverage;
  int? _voteCount;

  bool? get adult => _adult;
  String? get backdropPath => _backdropPath;
  List<CreatedBy>? get createdBy => _createdBy;
  List<int>? get episodeRunTime => _episodeRunTime;
  String? get firstAirDate => _firstAirDate;
  List<Genres>? get genres => _genres;
  String? get homepage => _homepage;
  int? get id => _id;
  bool? get inProduction => _inProduction;
  List<String>? get languages => _languages;
  String? get lastAirDate => _lastAirDate;
  LastEpisodeToAir? get lastEpisodeToAir => _lastEpisodeToAir;
  String? get name => _name;
  dynamic get nextEpisodeToAir => _nextEpisodeToAir;
  List<Networks>? get networks => _networks;
  int? get numberOfEpisodes => _numberOfEpisodes;
  int? get numberOfSeasons => _numberOfSeasons;
  List<String>? get originCountry => _originCountry;
  String? get originalLanguage => _originalLanguage;
  String? get originalName => _originalName;
  String? get overview => _overview;
  double? get popularity => _popularity;
  String? get posterPath => _posterPath;
  List<ProductionCompanies>? get productionCompanies => _productionCompanies;
  List<ProductionCountries>? get productionCountries => _productionCountries;
  List<Seasons>? get seasons => _seasons;
  List<SpokenLanguages>? get spokenLanguages => _spokenLanguages;
  String? get status => _status;
  String? get tagline => _tagline;
  String? get type => _type;
  double? get voteAverage => _voteAverage;
  int? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    if (_createdBy != null) {
      map['created_by'] = _createdBy?.map((v) => v.toJson()).toList();
    }
    map['episode_run_time'] = _episodeRunTime;
    map['first_air_date'] = _firstAirDate;
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = _homepage;
    map['id'] = _id;
    map['in_production'] = _inProduction;
    map['languages'] = _languages;
    map['last_air_date'] = _lastAirDate;
    if (_lastEpisodeToAir != null) {
      map['last_episode_to_air'] = _lastEpisodeToAir?.toJson();
    }
    map['name'] = _name;
    map['next_episode_to_air'] = _nextEpisodeToAir;
    if (_networks != null) {
      map['networks'] = _networks?.map((v) => v.toJson()).toList();
    }
    map['number_of_episodes'] = _numberOfEpisodes;
    map['number_of_seasons'] = _numberOfSeasons;
    map['origin_country'] = _originCountry;
    map['original_language'] = _originalLanguage;
    map['original_name'] = _originalName;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    if (_productionCompanies != null) {
      map['production_companies'] =
          _productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (_productionCountries != null) {
      map['production_countries'] =
          _productionCountries?.map((v) => v.toJson()).toList();
    }
    if (_seasons != null) {
      map['seasons'] = _seasons?.map((v) => v.toJson()).toList();
    }
    if (_spokenLanguages != null) {
      map['spoken_languages'] =
          _spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['tagline'] = _tagline;
    map['type'] = _type;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }
}

/// english_name : "Japanese"
/// iso_639_1 : "ja"
/// name : "日本語"

class SpokenLanguages {
  SpokenLanguages({
    String? englishName,
    String? iso6391,
    String? name,
  }) {
    _englishName = englishName;
    _iso6391 = iso6391;
    _name = name;
  }

  SpokenLanguages.fromJson(dynamic json) {
    _englishName = json['english_name'];
    _iso6391 = json['iso_639_1'];
    _name = json['name'];
  }
  String? _englishName;
  String? _iso6391;
  String? _name;

  String? get englishName => _englishName;
  String? get iso6391 => _iso6391;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = _englishName;
    map['iso_639_1'] = _iso6391;
    map['name'] = _name;
    return map;
  }
}

/// air_date : "2021-12-01"
/// episode_count : 1
/// id : 197057
/// name : "Specials"
/// overview : ""
/// poster_path : "/uX0XLiZpA1tuyobSMb38HyGv5xR.jpg"
/// season_number : 0

class Seasons {
  Seasons({
    String? airDate,
    int? episodeCount,
    int? id,
    String? name,
    String? overview,
    String? posterPath,
    int? seasonNumber,
  }) {
    _airDate = airDate;
    _episodeCount = episodeCount;
    _id = id;
    _name = name;
    _overview = overview;
    _posterPath = posterPath;
    _seasonNumber = seasonNumber;
  }

  Seasons.fromJson(dynamic json) {
    _airDate = json['air_date'];
    _episodeCount = json['episode_count'];
    _id = json['id'];
    _name = json['name'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _seasonNumber = json['season_number'];
  }
  String? _airDate;
  int? _episodeCount;
  int? _id;
  String? _name;
  String? _overview;
  String? _posterPath;
  int? _seasonNumber;

  String? get airDate => _airDate;
  int? get episodeCount => _episodeCount;
  int? get id => _id;
  String? get name => _name;
  String? get overview => _overview;
  String? get posterPath => _posterPath;
  int? get seasonNumber => _seasonNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = _airDate;
    map['episode_count'] = _episodeCount;
    map['id'] = _id;
    map['name'] = _name;
    map['overview'] = _overview;
    map['poster_path'] = _posterPath;
    map['season_number'] = _seasonNumber;
    return map;
  }
}

/// iso_3166_1 : "JP"
/// name : "Japan"

class ProductionCountries {
  ProductionCountries({
    String? iso31661,
    String? name,
  }) {
    _iso31661 = iso31661;
    _name = name;
  }

  ProductionCountries.fromJson(dynamic json) {
    _iso31661 = json['iso_3166_1'];
    _name = json['name'];
  }
  String? _iso31661;
  String? _name;

  String? get iso31661 => _iso31661;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = _iso31661;
    map['name'] = _name;
    return map;
  }
}

/// id : 42811
/// logo_path : "/2ZPUk3aYOtKbZk1W4Kp6mfeays8.png"
/// name : "Lerche"
/// origin_country : "JP"

class ProductionCompanies {
  ProductionCompanies({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) {
    _id = id;
    _logoPath = logoPath;
    _name = name;
    _originCountry = originCountry;
  }

  ProductionCompanies.fromJson(dynamic json) {
    _id = json['id'];
    _logoPath = json['logo_path'];
    _name = json['name'];
    _originCountry = json['origin_country'];
  }
  int? _id;
  String? _logoPath;
  String? _name;
  String? _originCountry;

  int? get id => _id;
  String? get logoPath => _logoPath;
  String? get name => _name;
  String? get originCountry => _originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['logo_path'] = _logoPath;
    map['name'] = _name;
    map['origin_country'] = _originCountry;
    return map;
  }
}

/// name : "Fuji TV"
/// id : 1
/// logo_path : "/yS5UJjsSdZXML0YikWTYYHLPKhQ.png"
/// origin_country : "JP"

class Networks {
  Networks({
    String? name,
    int? id,
    String? logoPath,
    String? originCountry,
  }) {
    _name = name;
    _id = id;
    _logoPath = logoPath;
    _originCountry = originCountry;
  }

  Networks.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _logoPath = json['logo_path'];
    _originCountry = json['origin_country'];
  }
  String? _name;
  int? _id;
  String? _logoPath;
  String? _originCountry;

  String? get name => _name;
  int? get id => _id;
  String? get logoPath => _logoPath;
  String? get originCountry => _originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['logo_path'] = _logoPath;
    map['origin_country'] = _originCountry;
    return map;
  }
}

/// air_date : "2019-09-20"
/// episode_number : 11
/// id : 1821974
/// name : "Song2"
/// overview : "Mafuyu tells Ritsuka that he likes him and Ritsuka is ecstatic to find out that they both like each other but at the same time, he remembers himself saying that band members should never bring relationships into the band. However, they both decide to talk to Haruki and Akihiko about it. Haruki gives them a lecture and Akihiko congratulates them. Meanwhile, Haruki, who likes Akihiko..."
/// production_code : ""
/// season_number : 1
/// still_path : "/jCVp3AgKkPlfrTSeajv6T1WDc2I.jpg"
/// vote_average : 0.0
/// vote_count : 0

class LastEpisodeToAir {
  LastEpisodeToAir({
    String? airDate,
    int? episodeNumber,
    int? id,
    String? name,
    String? overview,
    String? productionCode,
    int? seasonNumber,
    String? stillPath,
    double? voteAverage,
    int? voteCount,
  }) {
    _airDate = airDate;
    _episodeNumber = episodeNumber;
    _id = id;
    _name = name;
    _overview = overview;
    _productionCode = productionCode;
    _seasonNumber = seasonNumber;
    _stillPath = stillPath;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  LastEpisodeToAir.fromJson(dynamic json) {
    // _airDate = json['air_date'];
    //_episodeNumber = json['episode_number'];
    //_id = json['id'];
    // _name = json['name'];
    // _overview = json['overview'];
    //_productionCode = json['production_code'];
    //_seasonNumber = json['season_number'];
    //_stillPath = json['still_path'];
    //_voteAverage = json['vote_average'];
    //_voteCount = json['vote_count'];
  }
  String? _airDate;
  int? _episodeNumber;
  int? _id;
  String? _name;
  String? _overview;
  String? _productionCode;
  int? _seasonNumber;
  String? _stillPath;
  double? _voteAverage;
  int? _voteCount;

  String? get airDate => _airDate;
  int? get episodeNumber => _episodeNumber;
  int? get id => _id;
  String? get name => _name;
  String? get overview => _overview;
  String? get productionCode => _productionCode;
  int? get seasonNumber => _seasonNumber;
  String? get stillPath => _stillPath;
  double? get voteAverage => _voteAverage;
  int? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = _airDate;
    map['episode_number'] = _episodeNumber;
    map['id'] = _id;
    map['name'] = _name;
    map['overview'] = _overview;
    map['production_code'] = _productionCode;
    map['season_number'] = _seasonNumber;
    map['still_path'] = _stillPath;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }
}

/// id : 16
/// name : "Animation"

class Genres {
  Genres({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Genres.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;

  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}

/// id : 2564771
/// credit_id : "623ea32b9451e7005e6a1522"
/// name : "Hikaru Yamaguchi"
/// gender : 0
/// profile_path : null

class CreatedBy {
  CreatedBy({
    int? id,
    String? creditId,
    String? name,
    int? gender,
    dynamic profilePath,
  }) {
    _id = id;
    _creditId = creditId;
    _name = name;
    _gender = gender;
    _profilePath = profilePath;
  }

  CreatedBy.fromJson(dynamic json) {
    _id = json['id'];
    _creditId = json['credit_id'];
    _name = json['name'];
    _gender = json['gender'];
    _profilePath = json['profile_path'];
  }
  int? _id;
  String? _creditId;
  String? _name;
  int? _gender;
  dynamic _profilePath;

  int? get id => _id;
  String? get creditId => _creditId;
  String? get name => _name;
  int? get gender => _gender;
  dynamic get profilePath => _profilePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['credit_id'] = _creditId;
    map['name'] = _name;
    map['gender'] = _gender;
    map['profile_path'] = _profilePath;
    return map;
  }
}
