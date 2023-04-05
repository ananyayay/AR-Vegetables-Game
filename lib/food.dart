class Ingredient{
  String? name;
  String? score;
  String? benefits;

  Ingredient({
    this.name,
    this.score,
    this.benefits,
  });


}

class Ingredients{
  String? type;

  List<Ingredient>? listIngredientTypes;

  Ingredients({
    this.type,
    this.listIngredientTypes,
  });

  // Ingredients.fromJson(Map<String, dynamic> json){
  // }

}



class Food{
  String? food;
  String? path;
  List<Ingredients>? listIngredientTypes; //base, cheese, toppings

  Food(
      {
      this.food,
      this.path,
      this.listIngredientTypes,

      });

  Food.fromJson(Map<String,dynamic> json)
  {
    food =json['food'];
    path = json['path'];
    listIngredientTypes = json['ingredients'];
    
    
  }
}