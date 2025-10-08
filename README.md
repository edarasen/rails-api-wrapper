# Rails API Wrapper Project

Avion Bootcamp Project
Created an API Wrapper for the Spoonacular API : https://spoonacular.com/food-api

## Required Gems
- httparty
- dotenv-rails

## How to Use

### Available Routes
- 1/ Natural Query Recipe Search
- 2/ Recipe Info by Recipe ID
- 3/ Similar Recipes by Recipe ID
- 4/ Nutrition Info by Recipe ID
- 5/ Random Recipe
- 6/ Search Recipe by Ingredient

### 1. Natural Query Recipe Search

```http
  GET api/v1/spoonacular/:query
```

| Parameter | Type     | Description                                               |
| :-------- | :------- | :-------------------------------------------------------- |
| `:query`  | `string` | **Required**. The (natural language) recipe search query  |

#### Sample Route
```
api/v1/spoonacular/pasta
```
#### Sample Response
```
{
    "results": [
        {
            "id": 642583,
            "title": "Farfalle with Peas, Ham and Cream",
            "image": "https://img.spoonacular.com/recipes/642583-312x231.jpg",
            "imageType": "jpg"
        },
        {
            "id": 715538,
...
```

### 2. Recipe Info by Recipe ID

```http
  GET api/v1/spoonacular/recipe/:id
```

| Parameter | Type      | Description                                               |
| :-------- | :-------- | :-------------------------------------------------------- |
| `:id`     | `number`  | **Required**. The id of the recipe                        |

#### Sample Route
```
api/v1/spoonacular/recipe/1
```
#### Sample Response
```
{
    "id": 1,
    "image": "https://img.spoonacular.com/recipes/1-556x370.jpg",
    "imageType": "jpg",
    "title": "Fried Anchovies with Sage",
    "readyInMinutes": 45,
    "servings": 3,
    "sourceUrl": "http://latavolamarcherecipebox.blogspot.com/2009/10/fried-anchovies-with-sage.html",
...
```

### 3. Similar Recipes by Recipe ID

```http
  GET api/v1/spoonacular/recipe/:id/similar/:number
```

| Parameter | Type      | Description                                                                   |
| :-------- | :-------- | :---------------------------------------------------------------------------- |
| `:id`     | `number`  | **Required**. The id of the recipe                                            |
| `:number` | `number`  | **Required**. The number of random recipes to be returned (between 1 and 100) |

#### Sample Route
```
api/v1/spoonacular/recipe/1/similar/2
```
#### Sample Response
```
[
    {
        "id": 636212,
        "image": "Broccoli-Rabe-with-Tomatoes--Anchovies---Spaghetti-636212.jpg",
        "imageType": "jpg",
        "title": "Broccoli Rabe with Tomatoes, Anchovies & Spaghetti",
        "readyInMinutes": 45,
        "servings": 4,
        "sourceUrl": "https://www.foodista.com/recipe/NN7GPTYR/broccoli-rabe-with-tomatoes-anchovies-spaghetti"
    },
...
```

### 4. Nutrition Info by Recipe ID

```http
  GET api/v1/spoonacular/nutrition/:id
```

| Parameter | Type      | Description                                               |
| :-------- | :-------- | :-------------------------------------------------------- |
| `:id`     | `number`  | **Required**. The id of the recipe                        |

#### Sample Route
```
api/v1/spoonacular/nutrition/1
```
#### Sample Response
```
{
    "calories": "396",
    "carbs": "32g",
    "fat": "11g",
    "protein": "36g",
    "bad": [
        {
            "title": "Calories",
            "amount": "396",
            "indented": false,
            "percentOfDailyNeeds": 19.81
...
```

### 5. Random Recipe

```http
  GET api/v1/spoonacular/random
  GET api/v1/spoonacular/random/i/:include_tags
  GET api/v1/spoonacular/random/e/:exclude_tags
  GET api/v1/spoonacular/random/i/:include_tags/e/:exclude_tags
```

| Parameter           | Type      | Description                                               |
| :--------------     | :-------- | :-------------------------------------------------------- |
| `:include_tags`     | `string`  | The tags (can be diets, meal types, cuisines, or intolerances) that the recipe **must** have, separated by commas (ex. vegetarian,dessert,chinese) |
| `:exclude_tags`     | `string`  | The tags (can be diets, meal types, cuisines, or intolerances) that the recipe **must not** have, separated by commas (ex. vegetarian,dessert,chinese) |

#### Sample Route
```
api/v1/spoonacular/random
api/v1/spoonacular/random/i/vegetarian
api/v1/spoonacular/random/e/dairy
api/v1/spoonacular/random/i/vegetarian/e/dairy
```
#### Sample Response
```
{
    "recipes": [
        {
            "id": 651225,
            "image": "https://img.spoonacular.com/recipes/651225-556x370.jpg",
            "imageType": "jpg",
            "title": "Mashed Potatoes with Garlic, Sage & Goat Cheese",
            "readyInMinutes": 45,
            "servings": 8,
            "sourceUrl": "https://www.foodista.com/recipe/BMY7FDGN/mashed-potatoes-with-garlic-sage-goat-cheese",
...
```

### 5. Search Recipe by Ingredient

```http
  GET api/v1/spoonacular/findByIngredients/:ingredients
```

| Parameter           | Type      | Description                                                            |
| :--------------     | :-------- | :--------------------------------------------------------------------- |
| `:ingredients`      | `string`  | A comma-separated list of ingredients that the recipes should contain. |

#### Sample Route
```
api/v1/spoonacular/findByIngredients/chicken,butter
```
#### Sample Response
```
[
    {
        "id": 649827,
        "title": "Lemon, Garlic and Thyme Roast Chicken – Quick and Easy Method",
        "image": "https://img.spoonacular.com/recipes/649827-312x231.jpg",
        "imageType": "jpg",
        "usedIngredientCount": 2,
        "missedIngredientCount": 3,
        "missedIngredients": [
            {
...
```