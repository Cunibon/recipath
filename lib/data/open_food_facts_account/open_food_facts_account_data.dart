class OpenFoodFactsAccountData {
  final String username;
  final String password;
  final String appUuid;

  const OpenFoodFactsAccountData({
    required this.username,
    required this.password,
    required this.appUuid,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'appUuid': appUuid,
  };

  factory OpenFoodFactsAccountData.fromJson(Map<String, dynamic> json) =>
      OpenFoodFactsAccountData(
        username: json['username'] as String,
        password: json['password'] as String,
        appUuid: json['appUuid'] as String,
      );
}
