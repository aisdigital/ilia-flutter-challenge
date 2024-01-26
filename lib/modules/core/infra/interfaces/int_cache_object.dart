/// Sempre que um [IntCacheObject] for colocado em um [IntCache],
/// converta seus dados em [String]  utilizando json.encode().

interface class IntCacheObject {
  String key;
  String data;
  String? expiry;

  IntCacheObject({
    required this.key,
    required this.data,
    this.expiry,
  });
}
