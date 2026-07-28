import 'dart:io';

const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
const sentryUrl = String.fromEnvironment('SENTRY_URL');

const _revenueCatAppleKey = String.fromEnvironment('REVENUECAT_APPLE_KEY');
const _revenueCatAndroidKey = String.fromEnvironment('REVENUECAT_ANDROID_KEY');

String get revenueCatPublicKey =>
    Platform.isIOS ? _revenueCatAppleKey : _revenueCatAndroidKey;

const playStoreUrl =
    "https://play.google.com/store/apps/details?id=com.cunibongames.recipath";
const appStoreUrl = "https://apps.apple.com/app/id6791212568";

String get storeUrl =>
    Platform.isIOS && appStoreUrl.isNotEmpty ? appStoreUrl : playStoreUrl;

const String fileExtension = "recipath";

const List<String> dataKeys = [recipeDataKey, groceryDataKey, tagDataKey];

const String recipeDataKey = "recipeData";
const String groceryDataKey = "groceryData";
@Deprecated("Use [recipeTagDataKey] instead")
const String tagDataKey = "tagData";
const String recipeTagDataKey = "recipeTagData";
const String groceryTagDataKey = "groceryTagData";

const String idParameter = "id";

const String recipeIdKey = "recipeId";

const String uploadedKey = "uploaded";
const String deletedKey = "deleted";
