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
  String get cancelShoppingPlanning => 'Einkaufsplanung abbrechen';

  @override
  String get cancelShoppingContent =>
      'Möchten Sie Ihre Einkaufsplanung abbrechen?\nDies kann nicht rückgängig gemacht werden.';

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
  String get privacyPolicy => 'Datenschutzerklärung';

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

  @override
  String get introduction => 'Einleitung';

  @override
  String get appIntroduction =>
      '## Erste Schritte\n\n### 1. Rezepte erstellen\nDu kannst sofort mit dem Erstellen von Rezepten beginnen.\n- Füge einen Titel und eventuell ein Bild hinzu\n- Füge Schritte und die jeweiligen Zutaten hinzu\n    - Erstellte Lebensmittel sind für alle Rezepte verfügbar und können im Lebensmittel-Bildschirm gefunden werden\n    - Lebensmittel haben eine Standardmenge (in der Menge, in der du sie kaufen würdest), diese wird verwendet, um zu berechnen, wie viel von einer Zutat gekauft werden muss\n    - Du kannst auch eine Umrechnungsrate und Nährwerte hinzufügen, beides ist wichtig für genaue Dashboard-Daten\n    - Der kleine QR-Code oben rechts hilft dir, die meisten Werte schnell einzutragen\n- Speichere und du bist startklar\n\n### 2. Einkaufen beginnen\nDurch Wischen eines Rezepts oder Klicken auf die Einkaufsschaltfläche oben kannst du in den \"Einkaufsmodus\" wechseln.\nPlane deinen nächsten Einkauf, indem du die Rezepte auswählst, die du kochen möchtest; alle Zutaten werden automatisch in die Einkaufsliste übernommen.\n\nDu kannst auch alle hinzugefügten Rezepte in dem Einkaufsverlauf sehen.\n\n### 3. Behalte den Überblick\nAlles, was du von deiner Liste abhakst, wird in deinem Vorrat gespeichert.\nDu kannst ihn als Referenz verwenden und sowohl der Einkaufs- als auch der Rezeptbildschirm markieren Zutaten, die du im Vorrat hast, sodass du leicht sehen kannst, was du kochen kannst oder was gekauft werden muss.\n\n### 4. Kochen beginnen\nWenn du bereit zum Kochen bist, klicke auf ein Rezept und starte den Timer.\nSobald du fertig bist, wird deine Zeit aufgezeichnet und eine Durchschnittszeit für das Rezept auf dem Rezeptbildschirm angezeigt.';

  @override
  String get nothingToSee => 'Nichts zu sehen';

  @override
  String get cookRecipeForData => 'Koche ein Rezept, um Daten hinzuzufügen';

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
}
