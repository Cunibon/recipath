import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @eMail.
  ///
  /// In en, this message translates to:
  /// **'E-Mail'**
  String get eMail;

  /// No description provided for @objectInvalid.
  ///
  /// In en, this message translates to:
  /// **'{object} invalid'**
  String objectInvalid(String object);

  /// No description provided for @addEMail.
  ///
  /// In en, this message translates to:
  /// **'Add an email'**
  String get addEMail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @addPassword.
  ///
  /// In en, this message translates to:
  /// **'Add a password'**
  String get addPassword;

  /// No description provided for @repeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get repeatPassword;

  /// No description provided for @passwordsDontMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get passwordsDontMatch;

  /// No description provided for @passwordLength.
  ///
  /// In en, this message translates to:
  /// **'Password needs to be at least 12 letters long'**
  String get passwordLength;

  /// No description provided for @verifactionEMailSent.
  ///
  /// In en, this message translates to:
  /// **'Verifaction E-Mail has been sent'**
  String get verifactionEMailSent;

  /// No description provided for @couldNotAuthenticate.
  ///
  /// In en, this message translates to:
  /// **'Could not authenticate user'**
  String get couldNotAuthenticate;

  /// No description provided for @searchFor.
  ///
  /// In en, this message translates to:
  /// **'Search for {type}'**
  String searchFor(String type);

  /// No description provided for @clearAllItems.
  ///
  /// In en, this message translates to:
  /// **'Clear all items?'**
  String get clearAllItems;

  /// No description provided for @clearAllContent.
  ///
  /// In en, this message translates to:
  /// **'Do you really want clear all items?\nThere is no way to get them back.'**
  String get clearAllContent;

  /// No description provided for @recipeImportInfo.
  ///
  /// In en, this message translates to:
  /// **'Please select the recipes you want to import.'**
  String get recipeImportInfo;

  /// No description provided for @groceryImportInfo.
  ///
  /// In en, this message translates to:
  /// **'Please map the imported groceries to your existing groceries, or leave them unmapped to create new ones.'**
  String get groceryImportInfo;

  /// No description provided for @missingMapping.
  ///
  /// In en, this message translates to:
  /// **'Missing mapping'**
  String get missingMapping;

  /// No description provided for @missingMappingContent.
  ///
  /// In en, this message translates to:
  /// **'Unmapped items will create {count} new groceries.'**
  String missingMappingContent(int count);

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @pick.
  ///
  /// In en, this message translates to:
  /// **'Pick'**
  String get pick;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @discard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get discard;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @reallyDelete.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to delete'**
  String get reallyDelete;

  /// No description provided for @cancelShoppingPlanning.
  ///
  /// In en, this message translates to:
  /// **'Cancel shopping planning'**
  String get cancelShoppingPlanning;

  /// No description provided for @cancelShoppingContent.
  ///
  /// In en, this message translates to:
  /// **'Do you want to cancel your shopping planning?\nThis can not be undone.'**
  String get cancelShoppingContent;

  /// No description provided for @finishShoppingPlanning.
  ///
  /// In en, this message translates to:
  /// **'Finish shopping planning'**
  String get finishShoppingPlanning;

  /// No description provided for @cancelExport.
  ///
  /// In en, this message translates to:
  /// **'Cancel export'**
  String get cancelExport;

  /// No description provided for @cancelExportContent.
  ///
  /// In en, this message translates to:
  /// **'Do you want to cancel your export?'**
  String get cancelExportContent;

  /// No description provided for @finishExport.
  ///
  /// In en, this message translates to:
  /// **'Finish export'**
  String get finishExport;

  /// No description provided for @theseRecipesHaveBeenAdded.
  ///
  /// In en, this message translates to:
  /// **'These recipes have been added:'**
  String get theseRecipesHaveBeenAdded;

  /// No description provided for @leaveThisPage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave this page?'**
  String get leaveThisPage;

  /// No description provided for @leaveThisPageContent.
  ///
  /// In en, this message translates to:
  /// **'All unsaved changes will be lost!'**
  String get leaveThisPageContent;

  /// No description provided for @closeTheApp.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to close the app?'**
  String get closeTheApp;

  /// No description provided for @baseValue.
  ///
  /// In en, this message translates to:
  /// **'Base value'**
  String get baseValue;

  /// No description provided for @recipes.
  ///
  /// In en, this message translates to:
  /// **'Recipes'**
  String get recipes;

  /// No description provided for @shoppingList.
  ///
  /// In en, this message translates to:
  /// **'Shopping list'**
  String get shoppingList;

  /// No description provided for @storage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storage;

  /// No description provided for @groceries.
  ///
  /// In en, this message translates to:
  /// **'Groceries'**
  String get groceries;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tags;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @cookingHistory.
  ///
  /// In en, this message translates to:
  /// **'Cooking history'**
  String get cookingHistory;

  /// No description provided for @shoppingHistory.
  ///
  /// In en, this message translates to:
  /// **'Shopping history'**
  String get shoppingHistory;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @recipeUsage.
  ///
  /// In en, this message translates to:
  /// **'Recipe usage'**
  String get recipeUsage;

  /// No description provided for @groceryUsage.
  ///
  /// In en, this message translates to:
  /// **'Grocery usage'**
  String get groceryUsage;

  /// No description provided for @nutriments.
  ///
  /// In en, this message translates to:
  /// **'Nutriments'**
  String get nutriments;

  /// No description provided for @grocery.
  ///
  /// In en, this message translates to:
  /// **'Grocery'**
  String get grocery;

  /// No description provided for @cantDeleteGroceryMessage.
  ///
  /// In en, this message translates to:
  /// **'There are {recipes} recipes, {shopping} shopping items and {storage} storage items using this ingredient.\nIt cannot be deleted.'**
  String cantDeleteGroceryMessage(int recipes, int shopping, int storage);

  /// No description provided for @createGrocery.
  ///
  /// In en, this message translates to:
  /// **'Create grocery'**
  String get createGrocery;

  /// No description provided for @createTag.
  ///
  /// In en, this message translates to:
  /// **'Create tag'**
  String get createTag;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @saveCopy.
  ///
  /// In en, this message translates to:
  /// **'Save copy'**
  String get saveCopy;

  /// No description provided for @saveCopyContent.
  ///
  /// In en, this message translates to:
  /// **'Do you want to save a copy of this recipe?'**
  String get saveCopyContent;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @addName.
  ///
  /// In en, this message translates to:
  /// **'Add name'**
  String get addName;

  /// No description provided for @normalAmount.
  ///
  /// In en, this message translates to:
  /// **'Normal amount'**
  String get normalAmount;

  /// No description provided for @addNormalAmount.
  ///
  /// In en, this message translates to:
  /// **'Add normal amount'**
  String get addNormalAmount;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @addUnit.
  ///
  /// In en, this message translates to:
  /// **'Add unit'**
  String get addUnit;

  /// No description provided for @conversionAmount.
  ///
  /// In en, this message translates to:
  /// **'Conversion amount'**
  String get conversionAmount;

  /// No description provided for @addConversionAmount.
  ///
  /// In en, this message translates to:
  /// **'Add conversion amount'**
  String get addConversionAmount;

  /// No description provided for @addRealNumber.
  ///
  /// In en, this message translates to:
  /// **'Add real number'**
  String get addRealNumber;

  /// No description provided for @scanGrocery.
  ///
  /// In en, this message translates to:
  /// **'Scan grocery'**
  String get scanGrocery;

  /// No description provided for @couldNotFindBarcode.
  ///
  /// In en, this message translates to:
  /// **'Could not find product for code: {barcode}'**
  String couldNotFindBarcode(String barcode);

  /// No description provided for @servings.
  ///
  /// In en, this message translates to:
  /// **'Servings'**
  String get servings;

  /// No description provided for @addedItemsToShopping.
  ///
  /// In en, this message translates to:
  /// **'Added items to shopping list!'**
  String get addedItemsToShopping;

  /// No description provided for @recipe.
  ///
  /// In en, this message translates to:
  /// **'Recipe'**
  String get recipe;

  /// No description provided for @addNew.
  ///
  /// In en, this message translates to:
  /// **'Add new'**
  String get addNew;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @takePicture.
  ///
  /// In en, this message translates to:
  /// **'Take picture'**
  String get takePicture;

  /// No description provided for @addPictureFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Add a picture from gallery'**
  String get addPictureFromGallery;

  /// No description provided for @createRecipe.
  ///
  /// In en, this message translates to:
  /// **'Create recipe'**
  String get createRecipe;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @addTitle.
  ///
  /// In en, this message translates to:
  /// **'Add title'**
  String get addTitle;

  /// No description provided for @step.
  ///
  /// In en, this message translates to:
  /// **'Step'**
  String get step;

  /// No description provided for @addStep.
  ///
  /// In en, this message translates to:
  /// **'Add step'**
  String get addStep;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @addAmount.
  ///
  /// In en, this message translates to:
  /// **'Add amount'**
  String get addAmount;

  /// No description provided for @expand.
  ///
  /// In en, this message translates to:
  /// **'Expand'**
  String get expand;

  /// No description provided for @collapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get collapse;

  /// No description provided for @objectDescription.
  ///
  /// In en, this message translates to:
  /// **'{object} description'**
  String objectDescription(String object);

  /// No description provided for @addDescription.
  ///
  /// In en, this message translates to:
  /// **'Add description'**
  String get addDescription;

  /// No description provided for @changeIngredients.
  ///
  /// In en, this message translates to:
  /// **'Change ingredients'**
  String get changeIngredients;

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredients;

  /// No description provided for @perServing.
  ///
  /// In en, this message translates to:
  /// **'Per serving'**
  String get perServing;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong :('**
  String get somethingWentWrong;

  /// No description provided for @howLongDidTheRecipeTake.
  ///
  /// In en, this message translates to:
  /// **'How long did the recipe take?'**
  String get howLongDidTheRecipeTake;

  /// No description provided for @cancelTimer.
  ///
  /// In en, this message translates to:
  /// **'Cancel timer'**
  String get cancelTimer;

  /// No description provided for @timersRunningHeader.
  ///
  /// In en, this message translates to:
  /// **'Timers running'**
  String get timersRunningHeader;

  /// No description provided for @timersRunningDescription.
  ///
  /// In en, this message translates to:
  /// **'⏱️ you have active timers running'**
  String get timersRunningDescription;

  /// No description provided for @removedIngredientsFromStorage.
  ///
  /// In en, this message translates to:
  /// **'Removed ingredients from storage!'**
  String get removedIngredientsFromStorage;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get data;

  /// No description provided for @importData.
  ///
  /// In en, this message translates to:
  /// **'Import data'**
  String get importData;

  /// No description provided for @selectFileToImport.
  ///
  /// In en, this message translates to:
  /// **'Select a file to import.'**
  String get selectFileToImport;

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export data'**
  String get exportData;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @storageMode.
  ///
  /// In en, this message translates to:
  /// **'Storage mode'**
  String get storageMode;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @changeColor.
  ///
  /// In en, this message translates to:
  /// **'Change color'**
  String get changeColor;

  /// No description provided for @changeTags.
  ///
  /// In en, this message translates to:
  /// **'Change tags'**
  String get changeTags;

  /// No description provided for @kcal.
  ///
  /// In en, this message translates to:
  /// **'Kcal'**
  String get kcal;

  /// No description provided for @fat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// No description provided for @carbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get carbs;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @fiber.
  ///
  /// In en, this message translates to:
  /// **'Fiber'**
  String get fiber;

  /// No description provided for @milliliter.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get milliliter;

  /// No description provided for @liter.
  ///
  /// In en, this message translates to:
  /// **'l'**
  String get liter;

  /// No description provided for @teaspoon.
  ///
  /// In en, this message translates to:
  /// **'tsp'**
  String get teaspoon;

  /// No description provided for @tablespoon.
  ///
  /// In en, this message translates to:
  /// **'tbsp'**
  String get tablespoon;

  /// No description provided for @cup.
  ///
  /// In en, this message translates to:
  /// **'cup'**
  String get cup;

  /// No description provided for @gram.
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get gram;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kg;

  /// No description provided for @ounce.
  ///
  /// In en, this message translates to:
  /// **'oz'**
  String get ounce;

  /// No description provided for @pound.
  ///
  /// In en, this message translates to:
  /// **'lb'**
  String get pound;

  /// No description provided for @pinch.
  ///
  /// In en, this message translates to:
  /// **'pinch'**
  String get pinch;

  /// No description provided for @clove.
  ///
  /// In en, this message translates to:
  /// **'clove'**
  String get clove;

  /// No description provided for @can.
  ///
  /// In en, this message translates to:
  /// **'can'**
  String get can;

  /// No description provided for @piece.
  ///
  /// In en, this message translates to:
  /// **'piece'**
  String get piece;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @introduction.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get introduction;

  /// No description provided for @appIntroduction.
  ///
  /// In en, this message translates to:
  /// **'## Getting Started\n\n### 1. Create recipes\nYou can create recipes right off the bat.\n- Add a title and maybe an image\n- Add steps and their respective ingredients\n    - Groceries created are available for all recipes and can be found in the Groceries Screen\n    - Groceries have a normal amount (in what quantity you would buy them) this is used to determine how many of said ingredient needs to be bought\n    - You can also add a conversion rate and Nutriments, both of which are important for accurate dashboard data\n    - The little QR code at the top right can help you quickly enter most values\n- Save and you are ready to go\n\n### 2. Start shopping\nBy swiping a recipe or clicking the shopping button at the top you can enter \"shopping mode\".\nPlan your next shopping trip by selecting the recipes you want to cook, automatically adding all ingredients to the Shopping screen.\n\nYou can also see all the recipes you added in the shopping history.\n\n### 3. Keep track of what you have\nEverything you tick off your list is added to your Storage Screen.\nYou can check it as a reference and both the Shopping and Recipe screen will highlight ingredients you have at home, making it easy to see what you can cook or what needs to be bought.\n\n### 4. Start cooking\nWhen you are ready to cook, click on a recipe and start the timer.\nOnce you are done your time will be recorded, an average time for the recipe will be displayed on the Recipe screen.'**
  String get appIntroduction;

  /// No description provided for @nothingToSee.
  ///
  /// In en, this message translates to:
  /// **'Nothing to see'**
  String get nothingToSee;

  /// No description provided for @cookRecipeForDataHint.
  ///
  /// In en, this message translates to:
  /// **'Cook a recipe to start tracking data'**
  String get cookRecipeForDataHint;

  /// No description provided for @shopRecipeForDataHint.
  ///
  /// In en, this message translates to:
  /// **'Shop for a recipe to start tracking data'**
  String get shopRecipeForDataHint;

  /// No description provided for @createRecipeHint.
  ///
  /// In en, this message translates to:
  /// **'Create or import a recipe to get started'**
  String get createRecipeHint;

  /// No description provided for @shoppingHint.
  ///
  /// In en, this message translates to:
  /// **'Use shopping mode on the Recipes page or add individual groceries'**
  String get shoppingHint;

  /// No description provided for @createGroceryHint.
  ///
  /// In en, this message translates to:
  /// **'Create or import groceries to use in your recipes'**
  String get createGroceryHint;

  /// No description provided for @storageHint.
  ///
  /// In en, this message translates to:
  /// **'Shop for groceries to add them to your storage'**
  String get storageHint;

  /// No description provided for @createTagHint.
  ///
  /// In en, this message translates to:
  /// **'Create tags to organize and filter your recipes'**
  String get createTagHint;

  /// No description provided for @goPro.
  ///
  /// In en, this message translates to:
  /// **'Go Pro'**
  String get goPro;

  /// No description provided for @manageSubscription.
  ///
  /// In en, this message translates to:
  /// **'Manage subscription'**
  String get manageSubscription;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// No description provided for @destinations.
  ///
  /// In en, this message translates to:
  /// **'Destinations'**
  String get destinations;

  /// No description provided for @somethingUnexpected.
  ///
  /// In en, this message translates to:
  /// **'Oops, something unexpected happened'**
  String get somethingUnexpected;

  /// No description provided for @selectOne.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one item'**
  String get selectOne;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
