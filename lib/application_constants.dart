const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
const revenueCatPublicKey = String.fromEnvironment('REVENUECAT_PUBLIC_KEY');
const sentryUrl = String.fromEnvironment('SENTRY_URL');

const String fileExtenstion = "recipath";

const String openAppFirstTime = "openAppFirstTime";

const List<String> dataKeys = [
  recipeDataKey,
  groceryDataKey,
  shoppingDataKey,
  storageDataKey,
];

const String recipeDataKey = "recipeData";
const String groceryDataKey = "groceryData";
const String shoppingDataKey = "shoppingData";
const String storageDataKey = "storageData";

const String idParameter = "id";
