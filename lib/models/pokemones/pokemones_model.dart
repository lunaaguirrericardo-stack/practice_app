import 'dart:convert';

//Estructura del JSON para almacenar la lista de pokemones (consumo API)
class PokemonesModel {
    int count;
    String next;
    String? previous;
    List<Result> results;

    PokemonesModel({
        required this.count,
        required this.next,
        this.previous,
        required this.results,
    });

    factory PokemonesModel.fromRawJson(String str) => PokemonesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PokemonesModel.fromJson(Map<String, dynamic> json) => PokemonesModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String name;
    String url;

    Result({
        required this.name,
        required this.url,
    });

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
