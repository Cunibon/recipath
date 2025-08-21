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
  String get clearAllItems => 'Alle Elemente löschen?';

  @override
  String get clearAllContent =>
      'Möchten Sie wirklich alle Elemente löschen?\nEs gibt keine Möglichkeit, sie wiederherzustellen.';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get reallyDelete => 'Möchten Sie wirklich löschen';

  @override
  String get finishShoppingPlanning => 'Einkaufsplanung abschließen';

  @override
  String get finishShoppingContent =>
      'Möchten Sie Ihre Einkaufsplanung abschließen und die Artikel zur Einkaufsliste hinzufügen?';

  @override
  String get leaveThisPage => 'Möchten Sie diese Seite verlassen?';

  @override
  String get leaveThisPageContent =>
      'Alle ungespeicherten Änderungen gehen verloren!';

  @override
  String get recipes => 'Rezepte';

  @override
  String get shoppingList => 'Einkaufsliste';

  @override
  String get storage => 'Vorrat';

  @override
  String get groceries => 'Lebensmittel';

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
  String get save => 'Speichern';

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
  String get addRealNumber => 'Reelle Zahl hinzufügen';

  @override
  String get scanGrocery => 'Lebensmittel scannen';

  @override
  String get couldNotFindBarcode => 'Kein Produkt gefunden für Code: \$barcode';

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
  String get cancleTimer => 'Timer abbrechen';

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
  String get exportData => 'Daten exportieren';

  @override
  String get darkMode => 'Dunkelmodus';

  @override
  String get clear => 'Löschen';

  @override
  String get items => 'Elemente';

  @override
  String get language => 'Sprache';

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
}
