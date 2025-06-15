class product {
  String id;
  String name;
  int quantity;
  double price;

  product(this.id, this.name, this.quantity, this.price);

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'quantity': quantity,
    'price': price,
  };

  static product fromJson(Map<String,dynamic> json) => product(
    json['id'],
     json['name'],
      json['quantity'],
       (json['price'] as
       num).toDouble(),
       ); 
}
