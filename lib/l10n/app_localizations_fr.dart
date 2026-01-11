// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get login => 'Se connecter';

  @override
  String get register => 'Registre';

  @override
  String get logout => 'Déconnexion';

  @override
  String get eMail => 'E-Mail';

  @override
  String objectInvalid(String object) {
    return '$object invalide';
  }

  @override
  String get addEMail => 'Ajouter un e-mail';

  @override
  String get password => 'Mot de passe';

  @override
  String get addPassword => 'Ajouter un mot de passe';

  @override
  String get repeatPassword => 'Répéter le mot de passe';

  @override
  String get passwordsDontMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get passwordLength =>
      'Le mot de passe doit comporter au moins 12 lettres';

  @override
  String get verifactionEMailSent => 'Un e-mail de vérification a été envoyé';

  @override
  String get couldNotAuthenticate =>
      'Impossible d\'authentifier l\'utilisateur';

  @override
  String searchFor(String type) {
    return 'Rechercher $type';
  }

  @override
  String get changeSearchForResults =>
      'Modifiez votre recherche pour voir d\'autres résultats';

  @override
  String get clearAllItems => 'Effacer tous les éléments?';

  @override
  String get clearAllContent =>
      'Voulez-vous vraiment effacer tous les éléments ?\nIl n\'y a aucun moyen de les récupérer.';

  @override
  String get recipeImportInfo =>
      'Veuillez sélectionner les recettes que vous souhaitez importer.';

  @override
  String get groceryImportInfo =>
      'Associez les ingrédients importés à vos ingrédients existants ou laissez-les non associés pour en créer de nouveaux.';

  @override
  String get missingMapping => 'Association manquante';

  @override
  String missingMappingContent(int count) {
    return 'Les éléments non associés créeront $count nouveaux ingrédients.';
  }

  @override
  String get select => 'Sélectionner';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get actionContinue => 'Continuar';

  @override
  String get actionCancel => 'Annuler';

  @override
  String get pick => 'Choisir';

  @override
  String get apply => 'Appliquer';

  @override
  String get discard => 'Annuler';

  @override
  String get filter => 'Filtrer';

  @override
  String get reallyDelete => 'Voulez-vous vraiment supprimer';

  @override
  String get cancelShoppingPlanning => 'Annuler la planification des achats';

  @override
  String get cancelShoppingContent =>
      'Voulez-vous annuler votre planification d\'achats ?\nC\'est irréversible.';

  @override
  String get finishShoppingPlanning => 'Terminer la planification des achats';

  @override
  String get cancelExport => 'Annuler l\'exportation';

  @override
  String get cancelExportContent => 'Souhaitez-vous annuler l\'exportation ?';

  @override
  String get finishExport => 'Finaliser l\'exportation';

  @override
  String get theseRecipesHaveBeenAdded => 'Ces recettes ont été ajoutées:';

  @override
  String get leaveThisPage => 'Êtes-vous sûr de vouloir quitter cette page ?';

  @override
  String get leaveThisPageContent =>
      'Toutes les modifications non enregistrées seront perdues !';

  @override
  String get closeTheApp => 'Voulez-vous quitter cette application ?';

  @override
  String get baseValue => 'Valeur de base';

  @override
  String get recipes => 'Recettes';

  @override
  String get shoppingList => 'Liste de courses';

  @override
  String get storage => 'Stockage';

  @override
  String get groceries => 'Épiceries';

  @override
  String get tags => 'Étiquettes';

  @override
  String get dashboard => 'Tableau de bord';

  @override
  String get cookingHistory => 'Histoire de la cuisine';

  @override
  String get shoppingHistory => 'Historique des achats';

  @override
  String get settings => 'Paramètres';

  @override
  String get recipeUsage => 'Utilisation de la recette';

  @override
  String get groceryUsage => 'Utilisation à l\'épicerie';

  @override
  String get nutriments => 'Nutriments';

  @override
  String get grocery => 'Épicerie';

  @override
  String cantDeleteGroceryMessage(int recipes, int shopping, int storage) {
    return 'Il existe des recettes $recipes, des articles de courses $shopping et des articles de stockage $storage utilisant cet ingrédient.\nIl ne peut pas être supprimé.';
  }

  @override
  String get createGrocery => 'Créer une épicerie';

  @override
  String get createTag => 'Créer une balise';

  @override
  String get save => 'Sauvegarder';

  @override
  String get copy => 'Copie';

  @override
  String get saveCopy => 'Enregistrer la copie';

  @override
  String get saveCopyContent =>
      'Voulez-vous enregistrer une copie de cette recette ?';

  @override
  String get delete => 'Supprimer';

  @override
  String get name => 'Nom';

  @override
  String get addName => 'Ajouter un nom';

  @override
  String get normalAmount => 'Montant normal';

  @override
  String get addNormalAmount => 'ajouter le montant normal';

  @override
  String get unit => 'Unité';

  @override
  String get addUnit => 'Ajouter une unité';

  @override
  String get conversionAmount => 'Montant de conversion';

  @override
  String get addConversionAmount => 'Ajouter le montant de la conversion';

  @override
  String get addRealNumber => 'Ajouter un nombre réel';

  @override
  String get scanGrocery => 'Scanner l\'épicerie';

  @override
  String couldNotFindBarcode(String barcode) {
    return 'Impossible de trouver le produit pour le code: $barcode';
  }

  @override
  String get servings => 'Portions';

  @override
  String get addedItemsToShopping => 'Articles ajoutés à la liste de courses!';

  @override
  String get recipe => 'Recette';

  @override
  String get addNew => 'Ajouter un nouveau';

  @override
  String get done => 'Fait';

  @override
  String get takePicture => 'Prendre une photo';

  @override
  String get addPictureFromGallery => 'Ajouter une image de la galerie';

  @override
  String get createRecipe => 'Créer une recette';

  @override
  String get title => 'Titre';

  @override
  String get addTitle => 'Ajouter un titre';

  @override
  String get step => 'Étape';

  @override
  String get addStep => 'Ajouter une étape';

  @override
  String get amount => 'Montant';

  @override
  String get addAmount => 'Ajouter un montant';

  @override
  String get expand => 'Développer';

  @override
  String get collapse => 'Effondrement';

  @override
  String objectDescription(String object) {
    return 'description de l\'$object';
  }

  @override
  String get addDescription => 'Ajouter une description';

  @override
  String get changeIngredients => 'Changer les ingrédients';

  @override
  String get ingredients => 'Ingrédients';

  @override
  String get perServing => 'Par portion';

  @override
  String get somethingWentWrong => 'Quelque chose s\'est mal passé :(';

  @override
  String get howLongDidTheRecipeTake => 'Combien de temps a pris la recette ?';

  @override
  String get addTimer => 'Ajouter une minuterie';

  @override
  String get cancelTimer => 'Annuler la minuterie';

  @override
  String get timersRunningHeader => 'Minuteries en cours';

  @override
  String get timersRunningDescription =>
      '⏱️ Des minuteries sont encore actives';

  @override
  String get stepTimerFinishedTitle => 'Une minuterie a terminé';

  @override
  String stepTimerFinishedBody(int step, String recipe) {
    return 'Une minuterie pour l\'étape $step de $recipe a terminé';
  }

  @override
  String get removedIngredientsFromStorage =>
      'Ingrédients retirés du stockage !';

  @override
  String get appearance => 'Apparence';

  @override
  String get data => 'Données';

  @override
  String get importData => 'Importer des données';

  @override
  String get selectFileToImport => 'Sélectionnez un fichier à importer.';

  @override
  String get exportData => 'Exporter des données';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get storageMode => 'Mode inventaire';

  @override
  String get clear => 'Claire';

  @override
  String get items => 'Articles';

  @override
  String get language => 'Langue';

  @override
  String get description => 'Description';

  @override
  String get changeColor => 'Changer la couleur';

  @override
  String get changeTags => 'Modifier les étiquettes';

  @override
  String get kcal => 'Kilocalories';

  @override
  String get fat => 'Graisse';

  @override
  String get carbs => 'Crabes';

  @override
  String get protein => 'Protéine';

  @override
  String get fiber => 'Fibre';

  @override
  String get milliliter => 'ml';

  @override
  String get liter => 'l';

  @override
  String get teaspoon => 'tsp';

  @override
  String get tablespoon => 'tbsp';

  @override
  String get cup => 'tasse';

  @override
  String get gram => 'g';

  @override
  String get kg => 'kg';

  @override
  String get ounce => 'oz';

  @override
  String get pound => 'lb';

  @override
  String get pinch => 'pincer';

  @override
  String get clove => 'clou de girofle';

  @override
  String get can => 'peut';

  @override
  String get piece => 'morceau';

  @override
  String get version => 'Version';

  @override
  String get introduction => 'Introduction';

  @override
  String get appIntroduction =>
      '## Commencer\n\n### 1. Créer des recettes\nVous pouvez créer des recettes dès le départ.\n- Ajoutez un titre et peut-être une image\n- Ajoutez des étapes et leurs ingrédients respectifs\n    - Les courses créées sont disponibles pour toutes les recettes et peuvent être trouvées dans l\'écran Courses\n    - Les produits d\'épicerie ont une quantité normale (dans quelle quantité vous les achèteriez) qui est utilisée pour déterminer la quantité de cet ingrédient qui doit être achetée\n    - Vous pouvez également ajouter un taux de conversion et des nutriments, tous deux importants pour des données de tableau de bord précises.\n    - Le petit code QR en haut à droite peut vous aider à saisir rapidement la plupart des valeurs\n- Enregistrez et vous êtes prêt à partir\n\n### 2. Commencez vos achats\nEn faisant glisser une recette ou en cliquant sur le bouton d\'achat en haut, vous pouvez entrer \"mode achats\".\nPlanifiez votre prochain voyage de shopping en sélectionnant les recettes que vous souhaitez cuisiner, en ajoutant automatiquement tous les ingrédients à l\'écran Shopping.\n\nVous pouvez également voir toutes les recettes que vous avez ajoutées dans l\'historique des achats.\n\n### 3. Gardez une trace de ce que vous avez\nTout ce que vous cochez sur votre liste est ajouté à votre écran de stockage.\nVous pouvez le consulter comme référence et les écrans Shopping et Recette mettront en évidence les ingrédients que vous avez à la maison, ce qui vous permettra de voir facilement ce que vous pouvez cuisiner ou ce qui doit être acheté.\n\n### 4. Commencez à cuisiner\nLorsque vous êtes prêt à cuisiner, cliquez sur une recette et démarrez le minuteur.\nUne fois que vous avez terminé, votre temps sera enregistré, un temps moyen pour la recette sera affiché sur l\'écran Recette.';

  @override
  String get nothingToSee => 'Rien à voir';

  @override
  String get cookRecipeForDataHint =>
      'Cuisinez une recette pour commencer à suivre vos données';

  @override
  String get shopRecipeForDataHint =>
      'Achetez une recette pour commencer à suivre vos données';

  @override
  String get createRecipeHint => 'Créez ou importez une recette pour commencer';

  @override
  String get shoppingHint =>
      'Utilisez le mode shopping sur la page Recettes ou ajoutez des ingrédients individuellement';

  @override
  String get createGroceryHint =>
      'Créez ou importez des ingrédients pour vos recettes';

  @override
  String get storageHint =>
      'Achetez des ingrédients pour les ajouter à votre stockage';

  @override
  String get createTagHint =>
      'Créez des tags pour organiser et filtrer vos recettes';

  @override
  String get goPro => 'Devenez Pro';

  @override
  String get manageSubscription => 'Gérer l\'abonnement';

  @override
  String get subscription => 'Abonnement';

  @override
  String get destinations => 'Destinations';

  @override
  String get somethingUnexpected =>
      'Oups, quelque chose d\'inattendu s\'est produit';

  @override
  String get selectOne => 'Veuillez sélectionner au moins un élément';
}
