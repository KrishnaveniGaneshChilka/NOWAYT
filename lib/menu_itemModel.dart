class ItemModel{
  dynamic name;
  int price;

  ItemModel(dynamic name, int price){
    this.name = name;
    this.price = price;
  }

  /*Map<dynamic, int> toJson() {
    return {
      "name": this.name,
      "price": this.price
    };
  }

  ItemModel.fromJson(Map<dynamic, int> json)
      : name = json['name'],
        price=json['price'];*/
}