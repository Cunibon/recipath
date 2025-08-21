// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get logout => 'Logout';

  @override
  String get eMail => 'E-Mail';

  @override
  String objectInvalid(String object) {
    return '$object invalid';
  }

  @override
  String get addEMail => 'Add an email';

  @override
  String get password => 'Password';

  @override
  String get addPassword => 'Add a password';

  @override
  String get repeatPassword => 'Repeat password';

  @override
  String get passwordsDontMatch => 'Passwords don\'t match';

  @override
  String get passwordLength => 'Password needs to be at least 12 letters long';

  @override
  String get verifactionEMailSent => 'Verifaction E-Mail has been sent';

  @override
  String get couldNotAuthenticate => 'Could not authenticate user';

  @override
  String searchFor(String type) {
    return 'Search for $type';
  }

  @override
  String get clearAllItems => 'Clear all items?';

  @override
  String get clearAllContent =>
      'Do you really want clear all items?\nThere is no way to get them back.';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get reallyDelete => 'Do you really want to delete';

  @override
  String get finishShoppingPlanning => 'Finish shopping planning';

  @override
  String get finishShoppingContent =>
      'Do you want to finish your shopping planning and your items to your shopping list';

  @override
  String get leaveThisPage => 'Are you want to leave this page?';

  @override
  String get leaveThisPageContent => 'All unsaved changes will be lost!';

  @override
  String get recipes => 'Recipes';

  @override
  String get shoppingList => 'Shopping list';

  @override
  String get storage => 'Storage';

  @override
  String get groceries => 'Groceries';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get cookingHistory => 'Cooking history';

  @override
  String get shoppingHistory => 'Shopping history';

  @override
  String get settings => 'Settings';

  @override
  String get recipeUsage => 'Recipe usage';

  @override
  String get groceryUsage => 'Grocery usage';

  @override
  String get nutriments => 'Nutriments';

  @override
  String get grocery => 'Grocery';

  @override
  String cantDeleteGroceryMessage(int recipes, int shopping, int storage) {
    return 'There are $recipes recipes, $shopping shopping items and $storage storage items using this ingredient.\nIt cannot be deleted.';
  }

  @override
  String get createGrocery => 'Create grocery';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get name => 'Name';

  @override
  String get addName => 'Add name';

  @override
  String get normalAmount => 'Normal amount';

  @override
  String get addNormalAmount => 'Add normal amount';

  @override
  String get unit => 'Unit';

  @override
  String get addUnit => 'Add unit';

  @override
  String get conversionAmount => 'Conversion amount';

  @override
  String get addConversionAmount => 'Add conversion amount';

  @override
  String get addRealNumber => 'Add real number';

  @override
  String get scanGrocery => 'Scan grocery';

  @override
  String get couldNotFindBarcode =>
      'Could not find product for code: \$barcode';

  @override
  String get servings => 'Servings';

  @override
  String get addedItemsToShopping => 'Added items to shopping list!';

  @override
  String get recipe => 'Recipe';

  @override
  String get addNew => 'Add new';

  @override
  String get done => 'Done';

  @override
  String get takePicture => 'Take picture';

  @override
  String get addPictureFromGallery => 'Add a picture from gallery';

  @override
  String get createRecipe => 'Create recipe';

  @override
  String get title => 'Title';

  @override
  String get addTitle => 'Add title';

  @override
  String get step => 'Step';

  @override
  String get addStep => 'Add step';

  @override
  String get amount => 'Amount';

  @override
  String get addAmount => 'Add amount';

  @override
  String get expand => 'Expand';

  @override
  String get collapse => 'Collapse';

  @override
  String objectDescription(String object) {
    return '$object description';
  }

  @override
  String get addDescription => 'Add description';

  @override
  String get changeIngredients => 'Change ingredients';

  @override
  String get ingredients => 'Ingredients';

  @override
  String get perServing => 'Per serving';

  @override
  String get somethingWentWrong => 'Something went wrong :(';

  @override
  String get howLongDidTheRecipeTake => 'How long did the recipe take?';

  @override
  String get cancleTimer => 'Cancle timer';

  @override
  String get removedIngredientsFromStorage =>
      'Removed ingredients from storage!';

  @override
  String get appearance => 'Appearance';

  @override
  String get data => 'Data';

  @override
  String get importData => 'Import data';

  @override
  String get exportData => 'Export data';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get clear => 'Clear';

  @override
  String get items => 'Items';

  @override
  String get language => 'Language';

  @override
  String get kcal => 'Kcal';

  @override
  String get fat => 'Fat';

  @override
  String get carbs => 'Carbs';

  @override
  String get protein => 'Protein';

  @override
  String get fiber => 'Fiber';

  @override
  String get milliliter => 'ml';

  @override
  String get liter => 'l';

  @override
  String get teaspoon => 'tsp';

  @override
  String get tablespoon => 'tbsp';

  @override
  String get cup => 'cup';

  @override
  String get gram => 'g';

  @override
  String get kg => 'kg';

  @override
  String get ounce => 'oz';

  @override
  String get pound => 'lb';

  @override
  String get pinch => 'pinch';

  @override
  String get clove => 'clove';

  @override
  String get can => 'can';

  @override
  String get piece => 'piece';

  @override
  String get version => 'Version';

  @override
  String get introduction => 'Introduction';

  @override
  String get appIntroduction =>
      '## Getting Started\n\n### 1. Create recipes\nYou can create recipes right off the bat.\n- Add a title and maybe an image\n- Add steps and their respective ingredients\n    - Groceries created are available for all recipes and can be found in the Groceries Screen\n    - Groceries have a normal amount (in what quantity you would buy them) this is used to determine how many of said ingredient needs to be bought\n    - You can also add a conversion rate and Nutriments, both of which are important for accurate dashboard data\n    - The little QR code at the top right can help you quickly enter most values\n- Save and you are ready to go\n\n### 2. Start shopping\nBy swiping a recipe or clicking the shopping button at the top you can enter \"shopping mode\".\nPlan your next shopping trip by selecting the recipes you want to cook, automatically adding all ingredients to the Shopping screen.\n\nYou can also see all the recipes you added in the shopping history.\n\n### 3. Keep track of what you have\nEverything you tick off your list is added to your Storage Screen.\nYou can check it as a reference and both the Shopping and Recipe screen will highlight ingredients you have at home, making it easy to see what you can cook or what needs to be bought.\n\n### 4. Start cooking\nWhen you are ready to cook, click on a recipe and start the timer.\nOnce you are done your time will be recorded, an average time for the recipe will be displayed on the Recipe screen.';
}
