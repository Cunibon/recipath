# 🍳 ReciPath — Recipes, Shopping, Storage and Charts

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/Cunibon/recipath?style=social)](https://github.com/Cunibon/recipath/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/Cunibon/recipath)](https://github.com/Cunibon/recipath/issues)

**ReciPath** is an open-source app that helps you manage your recipes, track your pantry, and create shopping lists based on your recipes — all stored securely on supabase.


---

## Features

- 📖 **Recipes** — Save recipes with images and step-by-step instructions.
- 🛒 **Shopping** — Create a shopping list based on your recipes and tick them off as you go.
- 🥫 **Storage** — Keep track of ingredients and quantities in your storage.
- 📈 **Charts** — Analyze your cooking habits with a dashboard showing what you cooked, what ingredients it took and how many calories those have.
- ☁️ **Syncing** — Access your data on multiple devices.

---

## Free vs. Pro

ReciPath is **free to use locally** with Shopping sync.  
Upgrade to **Pro** to sync all your recipes, images, charts etc.

| Feature | Free | Pro |
|---------|------|-----|
| Local recipes & lists | ✅ | ✅ |
| Cloud sync | Shopping | Everything |
| Price | Free | 4.99€ a year |

---

## Getting Started

### 1. Install
Compile or download the app

### 2. Create recipes
You can create recipes right off the bat. 
- Add a title and maybe an image
- Add steps and their respective ingredients
    - Groceries created are available for all recipes and can be found in the Groceries Screen
    - Groceries have a normal amount (in what quantity you would buy them) this is used to determine how many of said ingredient needs to be bought
    - You can also add a conversion rate and Nutriments, both of which are important for accurate dashboard data
    - The little QR code at the top right can help you quickly enter most values
- Save and you are ready to go

### 3. Start shopping
By swiping a recipe or clicking the shopping button at the top you can enter "shopping mode".
Plan your next shopping trip by selecting the recipes you want to cook, automatically adding all ingredients to the Shopping screen.

You can also see all the recipes you added in the shopping history.

### 4. Keep track of what you have
Everything you tick off your list is added to your Storage Screen.
You can check it as a reference and both the Shopping and Recipe screen will highlight ingredients you have at home, making it easy to see what you can cook or what needs to be bought.

### 5. Start cooking
When you are ready to cook, click on a recipe and start the timer.
Once you are done your time will be recorded, an average time for the recipe will be displayed on the Recipe screen.

---

## Tech Stack

- **Frontend:** Flutter (cross-platform)
- **Backend:** Supabase
- **Database:** PostgreSQL

---

## Contributing

We welcome contributions!  
Whether it’s bug reports, feature requests, or code contributions

---

## License

This project is licensed under the [MIT License](LICENSE).

