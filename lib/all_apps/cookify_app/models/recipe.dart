class Recipe {
  final String title, tag, image;
  final int preparationTime, serving;
  final bool favorite;

  Recipe(this.title, this.tag, this.image, this.preparationTime, this.serving,
      this.favorite);

  static List<Recipe> getList() {
    return [
      Recipe("Matar Paneer", "South",
          "./assets/images/all_apps/cookify_app/recipe-2.jpg", 30, 1, true),
      Recipe("Tandoori Chicken", "Non Veg",
          "./assets/images/all_apps/cookify_app/recipe-3.jpg", 30, 1, false),
      Recipe("Aloo Gobi", "Cheese", "./assets/images/all_apps/cookify_app/recipe-4.jpg",
          30, 1, true),
    ];
  }

  static Recipe getOne() {
    return Recipe("Chicken Makhani\nSouth Special", "Non Veg",
        './assets/images/all_apps/cookify_app/recipe-1.jpg', 30, 1, false);
  }
}
