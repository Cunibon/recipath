// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get login => 'Acceso';

  @override
  String get register => 'Registro';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get eMail => 'correo electrónico';

  @override
  String objectInvalid(String object) {
    return '$object inválido';
  }

  @override
  String get addEMail => 'Agregar un correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get addPassword => 'Agregar una contraseña';

  @override
  String get repeatPassword => 'Repita la contraseña';

  @override
  String get passwordsDontMatch => 'Las contraseñas no coinciden';

  @override
  String get passwordLength => 'La contraseña debe tener al menos 12 letras.';

  @override
  String get verifactionEMailSent =>
      'Se ha enviado un correo electrónico de verificación';

  @override
  String get couldNotAuthenticate => 'No se pudo autenticar el usuario';

  @override
  String searchFor(String type) {
    return 'Buscar $type';
  }

  @override
  String get changeSearchForResults =>
      'Cambia tu búsqueda para ver otros resultados';

  @override
  String get clearAllItems => '¿Borrar todos los elementos?';

  @override
  String get clearAllContent =>
      '¿Realmente quieres borrar todos los elementos?\nNo hay forma de recuperarlos.';

  @override
  String get recipeImportInfo => 'Seleccione las recetas que desea importar.';

  @override
  String get groceryImportInfo =>
      'Asigne los ingredientes importados a sus ingredientes existentes o déjelos sin asignar para crear nuevos.';

  @override
  String get tagImportInfo =>
      'Puede asignar las etiquetas importadas a sus etiquetas existentes, dejarlas sin asignar para crear nuevas, o eliminarlas.';

  @override
  String get missingMapping => 'Asignación faltante';

  @override
  String missingMappingContent(int count, String type) {
    return 'Los elementos sin asignar crearán $count nuevos $type.';
  }

  @override
  String get select => 'Seleccionar';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get actionContinue => 'Continuar';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get pick => 'Elegir';

  @override
  String get apply => 'Aplicar';

  @override
  String get discard => 'Descartar';

  @override
  String get filter => 'Filtrar';

  @override
  String get reallyDelete => '¿Realmente quieres eliminar?';

  @override
  String get cancelShoppingPlanning => 'Cancelar la planificación de compras';

  @override
  String get cancelShoppingContent =>
      '¿Quieres cancelar tu planificación de compras?\nEsto no se puede deshacer.';

  @override
  String get finishShoppingPlanning => 'Terminar la planificación de compras';

  @override
  String get cancelExport => 'Cancelar exportación';

  @override
  String get cancelExportContent => '¿Desea cancelar la exportación?';

  @override
  String get finishExport => 'Finalizar exportación';

  @override
  String get theseRecipesHaveBeenAdded => 'Se han añadido estas recetas:';

  @override
  String get leaveThisPage =>
      '¿Estás seguro de que quieres salir de esta página?';

  @override
  String get leaveThisPageContent =>
      '¡Se perderán todos los cambios no guardados!';

  @override
  String get closeTheApp => '¿Desea salir de esta aplicación?';

  @override
  String get baseValue => 'Valor base';

  @override
  String get recipes => 'Recetas';

  @override
  String get shoppingList => 'Lista de compras';

  @override
  String get storage => 'Almacenamiento';

  @override
  String get groceries => 'Comestibles';

  @override
  String get tags => 'Etiquetas';

  @override
  String get dashboard => 'Panel';

  @override
  String get cookingHistory => 'Historia de la cocina';

  @override
  String get shoppingHistory => 'Historial de compras';

  @override
  String get settings => 'Ajustes';

  @override
  String get recipeUsage => 'Uso de recetas';

  @override
  String get groceryUsage => 'Uso de comestibles';

  @override
  String get nutriments => 'Nutrimentos';

  @override
  String get grocery => 'Tienda de comestibles';

  @override
  String cantDeleteGroceryMessage(int recipes, int shopping, int storage) {
    return 'Hay $recipes recetas, $shopping artículos de compra y $storage artículos de almacenamiento que utilizan este ingrediente.\nNo se puede eliminar.';
  }

  @override
  String get createGrocery => 'crear tienda de comestibles';

  @override
  String get createTag => 'Crear etiqueta';

  @override
  String get save => 'Ahorrar';

  @override
  String get copy => 'Copiar';

  @override
  String get saveCopy => 'guardar copia';

  @override
  String get saveCopyContent => '¿Quieres guardar una copia de esta receta?';

  @override
  String get delete => 'Borrar';

  @override
  String get name => 'Nombre';

  @override
  String get addName => 'Agregar nombre';

  @override
  String get normalAmount => 'Cantidad normal';

  @override
  String get addNormalAmount => 'Agregar cantidad normal';

  @override
  String get unit => 'Unidad';

  @override
  String get addUnit => 'Agregar unidad';

  @override
  String get conversionAmount => 'Monto de conversión';

  @override
  String get addConversionAmount => 'Agregar cantidad de conversión';

  @override
  String get addRealNumber => 'Sumar numero real';

  @override
  String get scanGrocery => 'Escanear comestibles';

  @override
  String couldNotFindBarcode(String barcode) {
    return 'No se pudo encontrar el producto para el código: $barcode';
  }

  @override
  String get servings => 'Porciones';

  @override
  String get addedItemsToShopping =>
      '¡Artículos añadidos a la lista de compras!';

  @override
  String get recipe => 'Receta';

  @override
  String get addNew => 'Agregar nuevo';

  @override
  String get done => 'Hecho';

  @override
  String get takePicture => 'tomar foto';

  @override
  String get addPictureFromGallery => 'Añadir una imagen de la galería';

  @override
  String get createRecipe => 'crear receta';

  @override
  String get title => 'Título';

  @override
  String get addTitle => 'Agregar título';

  @override
  String get step => 'Paso';

  @override
  String get addStep => 'Agregar paso';

  @override
  String get amount => 'Cantidad';

  @override
  String get addAmount => 'Agregar cantidad';

  @override
  String get expand => 'Expandir';

  @override
  String get collapse => 'colapsar';

  @override
  String objectDescription(String object) {
    return 'Descripción del $object';
  }

  @override
  String get addDescription => 'Agregar descripción';

  @override
  String get changeIngredients => 'Cambiar ingredientes';

  @override
  String get ingredients => 'Ingredientes';

  @override
  String get perServing => 'Por porción';

  @override
  String get somethingWentWrong => 'Algo salió mal :(';

  @override
  String get howLongDidTheRecipeTake =>
      '¿Cuanto tiempo te tomo hacer la receta?';

  @override
  String get howLongWillTheStepTake => '¿Cuánto tiempo tardará el paso?';

  @override
  String get addTimer => 'Agregar temporizador';

  @override
  String get cancelTimer => 'Cancelar temporizador';

  @override
  String get timersRunningHeader => 'Temporizadores en marcha';

  @override
  String get timersRunningDescription =>
      '⏱️ Todavía hay temporizadores activos';

  @override
  String get stepTimerFinishedTitle => 'Se ha terminado un temporizador';

  @override
  String stepTimerFinishedBody(int step, String recipe) {
    return 'Se terminó un temporizador para el paso $step de $recipe';
  }

  @override
  String get removedIngredientsFromStorage =>
      '¡Ingredientes retirados del almacenamiento!';

  @override
  String get appearance => 'Apariencia';

  @override
  String get data => 'datos';

  @override
  String get importData => 'Importar datos';

  @override
  String get selectFileToImport => 'Seleccione un archivo para importar.';

  @override
  String get exportData => 'Exportar datos';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get darkMode => 'Modo oscuro';

  @override
  String get storageMode => 'Modo inventario';

  @override
  String get clear => 'Claro';

  @override
  String get items => 'Elementos';

  @override
  String get language => 'Idioma';

  @override
  String get description => 'Descripción';

  @override
  String get changeColor => 'Cambiar color';

  @override
  String get changeTags => 'Cambiar etiquetas';

  @override
  String get kcal => 'Calorías';

  @override
  String get fat => 'Gordo';

  @override
  String get carbs => 'Carbohidratos';

  @override
  String get protein => 'Proteína';

  @override
  String get fiber => 'Fibra';

  @override
  String get milliliter => 'ml';

  @override
  String get liter => 'l';

  @override
  String get teaspoon => 'cucharadita';

  @override
  String get tablespoon => 'cucharada';

  @override
  String get cup => 'taza';

  @override
  String get gram => 'g';

  @override
  String get kg => 'kg';

  @override
  String get ounce => 'oz';

  @override
  String get pound => 'lb';

  @override
  String get pinch => 'pellizco';

  @override
  String get clove => 'clavo';

  @override
  String get can => 'clavo';

  @override
  String get piece => 'pedazo';

  @override
  String get version => 'Versión';

  @override
  String get introduction => 'Introducción';

  @override
  String get appIntroduction =>
      '## Empezando\n\n### 1.Crear recetas\nPuedes crear recetas desde el primer momento.\n- Añade un título y quizás una imagen\n- Añade los pasos y sus respectivos ingredientes\n    - Los comestibles creados están disponibles para todas las recetas y se pueden encontrar en la pantalla Comestibles\n    - Los comestibles tienen una cantidad normal (en qué cantidad los comprarías) esto se usa para determinar cuántos de dicho ingrediente se deben comprar\n    - El pequeño código QR en la parte superior derecha puede ayudarte a ingresar rápidamente la mayoría de los valores\n- Save and you are ready to go\n\n### 2. Empezar a comprar\nAl deslizar una receta o hacer clic en el botón de compras en la parte superior, puede ingresar \"modo de compras\".\nPlanifique su próximo viaje de compras seleccionando las recetas que desea cocinar y agregando automáticamente todos los ingredientes a la pantalla de Compras.\n\nYou can also see all the recipes you added in the shopping history.\n\n### 3. Lleva un registro de lo que tienes\nTodo lo que marques en tu lista se agregará a tu pantalla de almacenamiento.\nPodrás consultarlo como referencia y tanto la pantalla de Compras como la de Recetas resaltarán los ingredientes que tienes en casa, haciéndote fácil ver qué puedes cocinar o qué necesitas comprar.\n\n### 4. Empezar a cocinar\nCuando esté listo para cocinar, haga clic en una receta e inicie el temporizador.\nUna vez que haya terminado, se registrará su tiempo y se mostrará un tiempo promedio para la receta en la pantalla Receta.';

  @override
  String get nothingToSee => 'Nada que ver';

  @override
  String get cookRecipeForDataHint =>
      'Cocina una receta para empezar a registrar datos';

  @override
  String get shopRecipeForDataHint =>
      'Compra una receta para empezar a registrar datos';

  @override
  String get createRecipeHint => 'Crea o importa una receta para comenzar';

  @override
  String get shoppingHint =>
      'Usa el modo de compras en la página de Recetas o añade ingredientes individualmente';

  @override
  String get createGroceryHint =>
      'Crea o importa ingredientes para tus recetas';

  @override
  String get storageHint => 'Compra ingredientes para añadirlos a tu despensa';

  @override
  String get createTagHint =>
      'Crea etiquetas para organizar y filtrar tus recetas';

  @override
  String get goPro => 'Hazte profesional';

  @override
  String get manageSubscription => 'Gestionar suscripción';

  @override
  String get subscription => 'Suscripción';

  @override
  String get destinations => 'Destinos';

  @override
  String get somethingUnexpected => 'Ups, pasó algo inesperado';

  @override
  String get selectOne => 'Seleccione al menos un elemento';
}
