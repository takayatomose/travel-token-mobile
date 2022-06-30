class Wallet {
  final String token;
  final double balance;
  final String? address;
  Wallet({required this.token, this.address, required this.balance});

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        token: json['token'] as String,
        balance: double.parse(json['balance'].toString()),
      );
}
