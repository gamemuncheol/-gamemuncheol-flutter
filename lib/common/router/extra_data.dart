class ExtraData {
  final Map<String, dynamic> data;

  ExtraData(this.data);

  ExtraData copyWith(String key, dynamic value) {
    Map<String, dynamic> newData = Map.from(data);
    newData[key] = value;
    return ExtraData(newData);
  }

  factory ExtraData.empty() => ExtraData({});
}
