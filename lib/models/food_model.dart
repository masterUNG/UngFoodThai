class FoodModel {
  String id,
      Category,
      NameFood,
      Price,
      Detail,
      ImagePath,
      NameReview,
      DetailReview,
      ScoreReview;

  FoodModel(this.id, this.Category, this.NameFood, this.Price, this.Detail,
      this.ImagePath, this.NameReview, this.DetailReview, this.ScoreReview);

  FoodModel.formJSON(Map<String, dynamic> parseJSON){
    id = parseJSON['id'];
    Category = parseJSON['Category'];
    NameFood = parseJSON['NameFood'];
    Price = parseJSON['Price'];
    Detail = parseJSON['Detail'];
    ImagePath = parseJSON['ImagePath'];
    NameReview = parseJSON['NameReview'];
    DetailReview = parseJSON['DetailReview'];
    ScoreReview = parseJSON['ScoreReview'];
  }

}
