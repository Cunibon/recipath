// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get login => 'Anmelden';

  @override
  String get register => 'Registrieren';

  @override
  String get logout => 'Abmelden';

  @override
  String get eMail => 'E-Mail';

  @override
  String objectInvalid(String object) {
    return '$object ungültig';
  }

  @override
  String get addEMail => 'E-Mail hinzufügen';

  @override
  String get password => 'Passwort';

  @override
  String get addPassword => 'Passwort hinzufügen';

  @override
  String get repeatPassword => 'Passwort wiederholen';

  @override
  String get passwordsDontMatch => 'Passwörter stimmen nicht überein';

  @override
  String get passwordLength => 'Passwort muss mindestens 12 Zeichen lang sein';

  @override
  String get verifactionEMailSent => 'Bestätigungs-E-Mail wurde gesendet';

  @override
  String get couldNotAuthenticate =>
      'Benutzer konnte nicht authentifiziert werden';

  @override
  String searchFor(String type) {
    return 'Suche nach $type';
  }

  @override
  String get changeSearchForResults =>
      'Ändern Sie Ihre Suche, um andere Ergebnisse anzuzeigen';

  @override
  String get clearAllItems => 'Alle Elemente löschen?';

  @override
  String get clearAllContent =>
      'Möchten Sie wirklich alle Elemente löschen?\nEs gibt keine Möglichkeit, sie wiederherzustellen.';

  @override
  String get recipeImportInfo =>
      'Bitte wählen Sie die Rezepte aus, die Sie importieren möchten.';

  @override
  String get groceryImportInfo =>
      'Bitte ordnen Sie die importierten Zutaten Ihren vorhandenen Zutaten zu oder lassen Sie sie unzugeordnet, um neue zu erstellen.';

  @override
  String get tagImportInfo =>
      'Sie können importierte Tags Ihren vorhandenen Tags zuordnen, sie unzugeordnet lassen, um neue zu erstellen, oder sie entfernen.';

  @override
  String get missingMapping => 'Fehlende Zuordnung';

  @override
  String missingMappingContent(int count, String type) {
    return 'Nicht zugeordnete Einträge erstellen $count neue $type.';
  }

  @override
  String get select => 'Auswählen';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get actionContinue => 'Weiter';

  @override
  String get actionCancel => 'Abbrechen';

  @override
  String get pick => 'Auswählen';

  @override
  String get apply => 'Anwenden';

  @override
  String get discard => 'Verwerfen';

  @override
  String get filter => 'Filter';

  @override
  String get reallyDelete => 'Möchten Sie wirklich löschen';

  @override
  String get cancelShoppingPlanning => 'Einkaufsplanung abbrechen';

  @override
  String get cancelShoppingContent =>
      'Möchten Sie Ihre Einkaufsplanung abbrechen?\nDies kann nicht rückgängig gemacht werden.';

  @override
  String get finishShoppingPlanning => 'Einkaufsplanung abschließen';

  @override
  String get cancelExport => 'Export abbrechen';

  @override
  String get cancelExportContent => 'Möchten Sie den Export abbrechen?';

  @override
  String get finishExport => 'Export abschließen';

  @override
  String get theseRecipesHaveBeenAdded => 'Diese Rezepte wurden hinzugefügt:';

  @override
  String get leaveThisPage => 'Möchten Sie diese Seite verlassen?';

  @override
  String get leaveThisPageContent =>
      'Alle ungespeicherten Änderungen gehen verloren!';

  @override
  String get closeTheApp => 'Möchten Sie diese App verlassen?';

  @override
  String get baseValue => 'Basiswert';

  @override
  String get recipes => 'Rezepte';

  @override
  String get shoppingList => 'Einkaufsliste';

  @override
  String get storage => 'Vorrat';

  @override
  String get groceries => 'Lebensmittel';

  @override
  String get tags => 'Tags';

  @override
  String get dashboard => 'Übersicht';

  @override
  String get cookingHistory => 'Kochverlauf';

  @override
  String get shoppingHistory => 'Einkaufsverlauf';

  @override
  String get settings => 'Einstellungen';

  @override
  String get recipeUsage => 'Rezeptnutzung';

  @override
  String get groceryUsage => 'Lebensmittelnutzung';

  @override
  String get nutriments => 'Nährstoffe';

  @override
  String get grocery => 'Lebensmittel';

  @override
  String cantDeleteGroceryMessage(int recipes, int shopping, int storage) {
    return 'Es gibt $recipes Rezepte, $shopping Einkaufsartikel und $storage Vorratsartikel, die diese Zutat verwenden.\nSie kann nicht gelöscht werden.';
  }

  @override
  String get createGrocery => 'Lebensmittel erstellen';

  @override
  String get createTag => 'Tag erstellen';

  @override
  String get save => 'Speichern';

  @override
  String get copy => 'Kopie';

  @override
  String get saveCopy => 'Kopie speichern';

  @override
  String get saveCopyContent =>
      'Möchten Sie eine Kopie von diesem Rezept speichern?';

  @override
  String get delete => 'Löschen';

  @override
  String get name => 'Name';

  @override
  String get addName => 'Name hinzufügen';

  @override
  String get normalAmount => 'Normale Menge';

  @override
  String get addNormalAmount => 'Normale Menge hinzufügen';

  @override
  String get unit => 'Einheit';

  @override
  String get addUnit => 'Einheit hinzufügen';

  @override
  String get conversionAmount => 'Umrechnungsmenge';

  @override
  String get addConversionAmount => 'Umrechnungsmenge hinzufügen';

  @override
  String get addRealNumber => 'Echte Zahl hinzufügen';

  @override
  String get scanGrocery => 'Lebensmittel scannen';

  @override
  String couldNotFindBarcode(String barcode) {
    return 'Kein Produkt gefunden für Code: $barcode';
  }

  @override
  String get servings => 'Portionen';

  @override
  String get addedItemsToShopping => 'Artikel zur Einkaufsliste hinzugefügt!';

  @override
  String get recipe => 'Rezept';

  @override
  String get addNew => 'Neu hinzufügen';

  @override
  String get done => 'Fertig';

  @override
  String get takePicture => 'Foto aufnehmen';

  @override
  String get addPictureFromGallery => 'Bild aus Galerie hinzufügen';

  @override
  String get createRecipe => 'Rezept erstellen';

  @override
  String get title => 'Titel';

  @override
  String get addTitle => 'Titel hinzufügen';

  @override
  String get step => 'Schritt';

  @override
  String get addStep => 'Schritt hinzufügen';

  @override
  String get amount => 'Menge';

  @override
  String get addAmount => 'Menge hinzufügen';

  @override
  String get expand => 'Erweitern';

  @override
  String get collapse => 'Einklappen';

  @override
  String objectDescription(String object) {
    return '$object Beschreibung';
  }

  @override
  String get addDescription => 'Beschreibung hinzufügen';

  @override
  String get changeIngredients => 'Zutaten ändern';

  @override
  String get ingredients => 'Zutaten';

  @override
  String get perServing => 'Pro Portion';

  @override
  String get somethingWentWrong => 'Etwas ist schiefgelaufen :(';

  @override
  String get howLongDidTheRecipeTake => 'Wie lange hat das Rezept gedauert?';

  @override
  String get howLongWillTheStepTake => 'Wie lange wird der Schritt dauern?';

  @override
  String get addTimer => 'Timer hinzufügen';

  @override
  String get cancelTimer => 'Timer abbrechen';

  @override
  String get timersRunningHeader => 'Timer laufen';

  @override
  String get timersRunningDescription => '⏱️ es sind noch Timer aktiv';

  @override
  String get stepTimerFinishedTitle => 'Ein Timer ist abgelaufen';

  @override
  String stepTimerFinishedBody(int step, String recipe) {
    return 'Ein Timer für Schritt $step von $recipe ist abgelaufen';
  }

  @override
  String get removedIngredientsFromStorage =>
      'Zutaten aus dem Vorrat entfernt!';

  @override
  String get appearance => 'Darstellung';

  @override
  String get data => 'Daten';

  @override
  String get importData => 'Daten importieren';

  @override
  String get selectFileToImport => 'Wählen Sie eine Datei zum Importieren aus.';

  @override
  String get exportData => 'Daten exportieren';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get darkMode => 'Dunkelmodus';

  @override
  String get storageMode => 'Vorrat modus';

  @override
  String get clear => 'Löschen';

  @override
  String get items => 'Elemente';

  @override
  String get language => 'Sprache';

  @override
  String get description => 'Beschreibung';

  @override
  String get changeColor => 'Farbe ändern';

  @override
  String get changeTags => 'Tags ändern';

  @override
  String get kcal => 'Kcal';

  @override
  String get fat => 'Fett';

  @override
  String get carbs => 'Kohlenhydrate';

  @override
  String get protein => 'Protein';

  @override
  String get fiber => 'Ballaststoffe';

  @override
  String get milliliter => 'ml';

  @override
  String get liter => 'l';

  @override
  String get teaspoon => 'TL';

  @override
  String get tablespoon => 'EL';

  @override
  String get cup => 'Tasse';

  @override
  String get gram => 'g';

  @override
  String get kg => 'kg';

  @override
  String get ounce => 'oz';

  @override
  String get pound => 'lb';

  @override
  String get pinch => 'Prise';

  @override
  String get clove => 'Zehe';

  @override
  String get can => 'Dose';

  @override
  String get piece => 'Stück';

  @override
  String get version => 'Version';

  @override
  String get introduction => 'Einleitung';

  @override
  String get nothingToSee => 'Nichts zu sehen';

  @override
  String get cookRecipeForDataHint =>
      'Koche ein Rezept, um mit der Datenerfassung zu beginnen';

  @override
  String get shopRecipeForDataHint =>
      'Kaufe ein Rezept, um mit der Datenerfassung zu beginnen';

  @override
  String get createRecipeHint =>
      'Erstelle oder importiere ein Rezept, um loszulegen';

  @override
  String get shoppingHint =>
      'Nutze den Einkaufsmodus auf der Rezepte-Seite oder füge einzelne Zutaten hinzu';

  @override
  String get createGroceryHint =>
      'Erstelle oder importiere Zutaten für deine Rezepte';

  @override
  String get storageHint => 'Kaufe Zutaten, um sie deinem Vorrat hinzuzufügen';

  @override
  String get createTagHint =>
      'Erstelle Tags, um deine Rezepte zu organisieren und zu filtern';

  @override
  String get goPro => 'Go Pro';

  @override
  String get manageSubscription => 'Abonnement verwalten';

  @override
  String get subscription => 'Abonnement';

  @override
  String get destinations => 'Reiseziele';

  @override
  String get somethingUnexpected => 'Ups, etwas Unerwartetes ist passiert';

  @override
  String get selectOne => 'Bitte wählen Sie einen Artikel aus';

  @override
  String get downloadToImport =>
      'Laden Sie Recipath herunter:\nhttps://play.google.com/store/apps/details?id=com.cunibongames.recipath\n\nUm diese Rezepte zu importieren';

  @override
  String get aiToken => 'KI-Token';

  @override
  String get aiProvider => 'KI-Anbieter';

  @override
  String get addAiTokenDescription =>
      'Fügen Sie ein KI-Token hinzu, um KI-Funktionen in der App zu nutzen';

  @override
  String get selectAiProvider => 'KI-Anbieter auswählen';

  @override
  String get addAiToken => 'KI-Token hinzufügen';

  @override
  String get createATokenHere => 'Sie können hier ein Token erstellen!';

  @override
  String get importFile => 'Aus Datei importieren';

  @override
  String get importImage => 'Aus Bild importieren';

  @override
  String get importUrl => 'Aus URL importieren';

  @override
  String get addAiUrlDescription =>
      'URL hinzufügen, die Sie importieren möchten';

  @override
  String get enterValidUrl => 'Bitte geben Sie eine gültige URL ein';
}
