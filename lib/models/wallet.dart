class XtripWallet {
  final String token;
  final double balance;
  final String? address;
  XtripWallet({this.token = '', this.address, this.balance = 0.0});

  factory XtripWallet.fromJson(Map<String, dynamic> json) => XtripWallet(
        token: json['token'] as String,
        balance: double.parse(json['balance'].toString()),
      );

  String hiddenAddress() {
    return "${address!.substring(0, 5)}...${address!.substring(address!.length - 10)}";
  }
}
