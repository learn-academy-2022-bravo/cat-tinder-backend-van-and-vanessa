foods = [
    {
      dishname: "Spaghetti",
      genre: "Italian",
      category: "Entree",
      image: "https://cdn.pixabay.com/photo/2020/01/07/05/52/spaghetti-4746831_1280.jpg"
    },
    {
      dishname: "Sushi",
      genre: "Japanese",
      category: "Entree",
      image: "https://upload.wikimedia.org/wikipedia/commons/7/7b/Sushi_Roll.jpg"
    },
    {
        dishname: "Eggs Benedict",
        genre: "French",
        category: "Breakfast",
        image: "https://assets.rbl.ms/24962678/origin.jpg"
      },
  ]
  foods.each do |each_food|
    Food.create each_food
    puts "creating food #{each_food}"
  end
