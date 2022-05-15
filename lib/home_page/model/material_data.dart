class MaterialData {
  MaterialData._({
    required this.id,
    required this.title,
    required this.value,
    required this.description,
    required this.photo,
  });

  factory MaterialData.fromList(List values) {
    return MaterialData._(
      id: values[0],
      title: values[1],
      value: values[2],
      description: values[3],
      photo: values[4],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'description': description,
      'photo': photo,
    };
  }

  final String id;
  final String title;
  final String description;
  final String photo;
  final int value;

  Map<String, dynamic> get values {
    return {
      'id': id,
      'title': title,
      'value': value,
      'description': description,
      'photo': photo,
    };
  }
}
