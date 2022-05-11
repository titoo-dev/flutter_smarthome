class MaterialData {
  MaterialData._({
    required this.id,
    required this.title,
    required this.value,
  });

  factory MaterialData.fromList(List values) {
    return MaterialData._(
      id: values[0],
      title: values[1],
      value: values[2],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
    };
  }

  final String id;
  final String title;
  final String value;

  Map<String, dynamic> get values {
    return {
      'id': id,
      'title': title,
      'value': value,
    };
  }
}
