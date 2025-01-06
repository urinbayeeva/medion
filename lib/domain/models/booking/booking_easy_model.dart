import 'dart:convert';

class BookingCategory {
    List<Empty> empty;

    BookingCategory({
        required this.empty,
    });

    factory BookingCategory.fromRawJson(String str) => BookingCategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BookingCategory.fromJson(Map<String, dynamic> json) => BookingCategory(
        empty: List<Empty>.from(json["Анестезиология"].map((x) => Empty.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Анестезиология": List<dynamic>.from(empty.map((x) => x.toJson())),
    };
}

class Empty {
    int id;
    String name;
    dynamic description;
    int doctorPriceStartUzs;
    double doctorPriceStartUsd;
    Age age;

    Empty({
        required this.id,
        required this.name,
        required this.description,
        required this.doctorPriceStartUzs,
        required this.doctorPriceStartUsd,
        required this.age,
    });

    factory Empty.fromRawJson(String str) => Empty.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Empty.fromJson(Map<String, dynamic> json) => Empty(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        doctorPriceStartUzs: json["doctor_price_start_uzs"],
        doctorPriceStartUsd: json["doctor_price_start_usd"]?.toDouble(),
        age: ageValues.map[json["age"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "doctor_price_start_uzs": doctorPriceStartUzs,
        "doctor_price_start_usd": doctorPriceStartUsd,
        "age": ageValues.reverse[age],
    };
}

enum Age {
    ALL
}

final ageValues = EnumValues({
    "all": Age.ALL
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
