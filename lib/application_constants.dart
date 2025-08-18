const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
const revenueCatPublicKey = String.fromEnvironment('REVENUECAT_PUBLIC_KEY');

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

const String timerDataKey = "timerData";

const String idParameter = "id";
