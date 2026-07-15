import 'dart:io';

const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
const revenueCatPublicKey = String.fromEnvironment('REVENUECAT_PUBLIC_KEY');
const sentryUrl = String.fromEnvironment('SENTRY_URL');

const playStoreUrl =
    "https://play.google.com/store/apps/details?id=com.cunibongames.recipath";
const appStoreUrl = "";

String get storeUrl =>
    Platform.isIOS && appStoreUrl.isNotEmpty ? appStoreUrl : playStoreUrl;

const String fileExtension = "recipath";

const List<String> dataKeys = [recipeDataKey, groceryDataKey, tagDataKey];

const String recipeDataKey = "recipeData";
const String groceryDataKey = "groceryData";
const String tagDataKey = "tagData";

const String idParameter = "id";

const String recipeIdKey = "recipeId";

const String uploadedKey = "uploaded";
const String deletedKey = "deleted";
