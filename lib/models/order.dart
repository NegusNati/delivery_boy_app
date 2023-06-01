class Order {
  int? _orderId;
  int? get orderId => _orderId;
  late List<Detail> _details;
  List<Detail>? get details => _details;
  late List<FoodDetails> _detailsList;
  List<FoodDetails> get detailsList => _detailsList;

  Order({required orderId, required details, required detailsList}) {
    _orderId = orderId;
    _details = details;
    _detailsList = detailsList;
  }

  Order.fromJson(Map<String, dynamic> json) {
    _orderId = json['order_id'];
    // _details = json['details'];
    if (json['details'] != null) {
      _details = <Detail>[];
      json['details'].forEach((v) {
       
        _details.add(Detail.fromJson(v));
      });
    }
     
  }

  // factory Order.fromJson(Map<String, dynamic> json) {
  //   if (json['details'] != null) {
  //     json['details'].forEach((v) {
  //       detailsList.add(Detail.fromJson(v));
  //     });
  //   }
  //   return Order(
  //     orderId: json['order_id'],
  //     details: detailsList,
  //   );
  // }
}

class Detail {
  int? id;
  int? foodId;
  int? price;
  FoodDetails foodDetails;
  int? quantity;
  int? taxAmount;
  String? createdAt;
  String? updatedAt;

  Detail({
    this.id,
    this.foodId,
    this.price,
    required this.foodDetails,
    this.quantity,
    this.taxAmount,
    this.createdAt,
    this.updatedAt,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      id: json['id'],
      foodId: json['food_id'],
      price: json['price'],
      foodDetails: FoodDetails.fromJson(json['food_details']),
      quantity: json['quantity'],
      taxAmount: json['tax_amount'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class FoodDetails {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  int? people;
  int? selectedPeople;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  FoodDetails({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.people,
    this.selectedPeople,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });

  FoodDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "";
    description = json['description'] ?? "";
    price = json['price'] ?? "";
    stars = json['stars'] ?? "";
    people = json['people'] ?? "";
    selectedPeople = json['selected_people'] ?? "";
    img = json['img'] ?? "";
    location = json['location'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    typeId = json['type_id'] ?? "";
  }
}
