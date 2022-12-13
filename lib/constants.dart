import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

// Default values
const bool defaultBoolean = false;
const int defaultInt = 0;
const double defaultDouble = 0.0;
const String defaultString = "";
const String spaceString = " ";
const String newLineString = "\n";
const String currency = "৳";

// App colors (main)
const Color colorPrimary = Color(0xFFF26522);
const Color colorSecondary = Color(0xFF636466);
//const Color colorAccent = Color.fromRGBO(230, 46, 4, 1);
const Color colorAccent = Color(0xFFe52e04);

//const Color colorAccent = Color(0xFF258633);
const Color colorHighlight = Color(0xFFFFA100);
const Color colorDisabled = Color(0xD1272B37);
const Color colorGem = Color(0xFF1388C9);
const Color colorCoin = Color(0xFFFAB43D);

// App colors (text)
const Color colorTextRegular = Color(0xFF272B37);
const Color colorTextSecondary = Color(0xFF707586);
const Color colorTextTertiary = Color(0xFF6B7285);
const Color colorTextWarning = Color(0xFFFF5E00);

// App colors (light)
const Color colorLightGray1 = Color(0xFF353A44);
const Color colorLightGray2 = Color(0xFF404551);
const Color colorLightGray3 = Color(0xFF6A6B6D);
const Color colorLightGray4 = Color(0xFF8F949E);
const Color colorLightGray5 = Color(0xFF272B31);
const Color colorLightGray6 = Color(0xFFD5D5D5);
const Color colorLightGray7 = Color(0xFF333741);
const Color colorLightGray8 = Color(0xFF2B2F36);
const Color colorLightGray9 = Color(0xFFF1F3F6);
const Color colorLightGray10 = Color(0xFFBFBFBF);
const Color colorLightGray11 = Color(0xFF2B2F36);
const Color colorLightGray12 = Color(0xFF747474);
const Color colorLightGray13 = Color(0xFFD8D8D8);
const Color colorLightGray14 = Color(0xFFCFCFCF);
const Color colorLightGray15 = Color(0xFFA2A2A2);
const Color colorLightGray16 = Color(0xFFA29C9C);
const Color colorLightGray17 = Color(0xFFB4B4B4);
const Color colorLightWhite1 = Color(0xFFFAFAFA);
const Color colorLightWhite2 = Color(0xFFDBDBDB);
const Color colorLightWhite3 = Color(0xFFF9F9F9);
const Color colorLightGreen1 = Color(0xFF0ABB87);
const Color colorLightGreenAccent1 = Color(0xFF20C3AF);
const Color colorLightGreenAccent2 = Color(0xFFDDF6F3);
const Color colorLightOrange1 = Color(0xFFFF9900);
const Color colorLightOrange2 = Color(0xFFF8991C);
const Color colorLightOrange3 = Color(0xFFF6E8D5);
const Color colorWhite = Color(0xFFFFFFFF);

// App colors (others)
const Color colorSplashNavigationBarBackground = Color(0xFF0B0C0E);
const Color colorInputFieldBackground = Color(0xFFFAFAFA);
const Color colorInputFieldBorder = Color(0xFFF3F2F2);
const Color colorPageBackground = Color(0xFFF4F5F7);
const Color colorCloseButtonBackground = Color(0x12707586);
const Color colorResetPageBackground = Color(0xFFF6F5F5);
const Color colorNewPasswordBackground = Color(0xFF3C414B);
const Color colorNewPasswordRoundShape = Color(0xFF33383F);
const Color colorMyProfileBg = Color(0xFFF1F3F6);
const Color colorFavoriteImageBg = Color(0xFFF2F2F2);
const Color colorFavoriteImageBgBorder = Color(0xFFB7B7B7);

const Color colorItemInactiveBackground = Color(0xFFEBF2FE);
const Color colorItemActiveBackground = Color(0xFF3580F7);
const Color colorExamItemInactiveBackground = Color(0xFFF5F6FC);
const Color colorExamItemActiveBackground = Color(0xFF3580F7);
const Color colorUserActive = Color(0xFF00D563);
const Color colorWinningTeamBackground = Color(0xFF6CE6E1);
const Color colorWinProgress = Color(0xFF27AE60);
const Color colorLoseProgress = Color(0xFFEB5757);
const Color colorTieProgress = colorAccent;
const Color colorSkipProgress = colorWinningTeamBackground;
const Color colorOrange = Color(0xFFF2994A);
const Color colorPurple = Color(0xFF7632A7);

const Color colorRoundShapeBlue = Color(0x20008fb4);
const Color colorRoundShapeDarkBlue = Color(0xFF1565C0);
const Color colorRoundShapeOrange = Color(0x20fe793d);
const Color colorRoundShapeDarkOrange = Color(0xFFfe793d);
const Color colorRoundShapeGray1 = Color(0x20353A44);
const Color colorRoundShapeRed = Color(0x15EE1C25);
const Color colorRoundShapeDarkRed = Color(0xFFec514b);
const Color colorRoundShapePurple = Color(0x157632A7);

const Color colorAuctionBgSelect1 = Color(0xFFEDE7E0);
const Color colorAuctionBgSelect2 = Color(0xFFDFE3E9);

//StepColor
const Color colorStepComplete = Color(0xFF20C3AF);
const Color colorStepEdit = Color(0xFFb2b4b6);
const Color colorStepBackground = Color.fromRGBO(246, 249, 255, 1);
const Color colorStepLine = Color(0xFFDED9D9);

const Color colorHomeCircle = Color(0xFFacacac);
const Color colorCartInside = Color(0xFF666668);
const Color colorSearchIcon = Color(0xFFf8d2c0);
const Color colorProcessToShippping = Color(0xFFe52e04);

/*If you are not a developer, do not change the bottom colors*/
const Color white = Color.fromRGBO(255, 255, 255, 1);
const Color lightGrey = Color.fromRGBO(239, 239, 239, 1);
const Color darkGrey = Color.fromRGBO(112, 112, 112, 1);
const Color mediumGrey = Color.fromRGBO(132, 132, 132, 1);
const Color mediumGrey50 = Color.fromRGBO(132, 132, 132, .5);
const Color grey153 = Color.fromRGBO(153, 153, 153, 1);
const Color fontGrey = Color.fromRGBO(73, 73, 73, 1);
const Color textfieldGrey = Color.fromRGBO(209, 209, 209, 1);
const Color golden = Color.fromRGBO(248, 181, 91, 1);
const Color softAccentColor = Color.fromRGBO(247, 189, 168, 1);

Color shimmerBase = Colors.grey.shade50;
Color shimmerHighlighted = Colors.grey.shade200;

// Text styles
const TextStyle textStyleBottomBarItem = TextStyle(
  color: colorDisabled,
  fontSize: 14.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleSectionTitle = TextStyle(
  color: colorTextRegular,
  fontSize: 18.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleSectionItemTitle = TextStyle(
  color: colorTextRegular,
  fontSize: 16.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleSectionItemBody = TextStyle(
  color: colorTextRegular,
  fontSize: 16.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleAppBar = TextStyle(
  color: colorTextRegular,
  fontSize: 20.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w600,
);

const TextStyle textStyleFocused = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleExtraExtraLarge = TextStyle(
  color: colorTextRegular,
  fontSize: 20.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w400,
);

const TextStyle textStyleExtraLarge = TextStyle(
  color: colorTextRegular,
  fontSize: 18.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w400,
);

TextStyle textStyleLarge = const TextStyle(
  color: colorTextRegular,
  fontSize: 16.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w400,
);

TextStyle textStyleRegular = const TextStyle(
  color: colorTextRegular,
  fontSize: 14.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w400,
);

TextStyle textStyleSmall = const TextStyle(
  color: colorTextRegular,
  fontSize: 12.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w400,
);

TextStyle textStyleHeadline = const TextStyle(
  color: colorTextRegular,
  fontSize: 26.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w700,
);

TextStyle textStyleButtonRegular = const TextStyle(
  color: colorLightWhite1,
  fontSize: 14.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w500,
);

TextStyle hintTextStyleSmall = const TextStyle(
  color: colorLightGray4,
  fontSize: 10.0,
  fontFamily: fontFamilyPoppins,
  fontWeight: FontWeight.w400,
);

// Input Decoration
InputDecoration inputDecorationForm = const InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
  //hintStyle: textStyleInputFormHint,
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  border: InputBorder.none,
);

// Box Decoration
BoxDecoration boxDecorationBorderForm = const BoxDecoration(
  color: colorInputFieldBackground,
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  border: Border.fromBorderSide(
    BorderSide(color: colorInputFieldBorder),
  ),
);

BoxDecoration boxDecorationSectionCardBackground = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(20.0),
  ),
);

const BoxDecoration boxDecorationBackButtonBorder = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
  border: Border.fromBorderSide(
    BorderSide(color: colorTextSecondary),
  ),
);

const BoxDecoration otpPutDecoration = BoxDecoration(
  color: colorLightWhite1,
  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
  border: Border.fromBorderSide(
    BorderSide(color: colorLightWhite1),
  ),
);

// Shape
const RoundedRectangleBorder shapeButtonRectangle = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
);

const RoundedRectangleBorder shapeCardItemRectangle = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(16.0),
  ),
);

// Service
const SystemUiOverlayStyle systemUiOverlayStyleGlobal = SystemUiOverlayStyle(
  systemNavigationBarColor: colorPageBackground,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
);

// App essentials
const String responseOfJsonType = "application/json";
const String fontFamilyPoppins = "Poppins";
const String fontFamilyRoboto = "Roboto";
const String valueClientID = "APP_CLIENT";
const String valueClientSecret = "APP_CLIENT_AF61E59520943DC26494F8941B";
const String valueGrantTypeClientCredentials = "client_credentials";
const String valueGrantTypeRefreshToken = "refresh_token";
const int minimumPasswordLength = 8;
const int minimumVerificationCodeLength = 4;
late String mobileNumber = "09666 77 77 05";
late String emailForEzcart = "support@ezcart.bd.com";
const String appName = "EZCart"; //this shows in the splash screen
const String purchaseCode = "e61f6cbb-bf4f-4df0-bfc7-8b2632b513db"; //enter your purchase code for the app from codecanyon

//const String facebookUrl = "www.facebook.com/ezcart.com.bd"; //enter your purchase code for the app from codecanyon
const String facebookUrl = 'https://www.facebook.com/ezcart.com.bd';
const String facebook = 'https://www.facebook.com';

const String prefixAuthToken = "Bearer ";
const String saleTypeAuction = "Auction";
const String saleTypeBargain = "Bargain";
const String saleTypeGallery = "Gallery";

//Order Status
const String pending = "Pending";
const String confirmed = "Confirmed";
const String delivered = "Delivered";
const String processing = "Processing";
const String hold = "Hold";
const String returned = "Returned";
const String canceled = "Canceled";

// Backend
const String baseDevelopmentUrl = "";
const String baseLiveUrl = "";
const String baseUrl = baseDevelopmentUrl;

//const String baseAppDevelopmentUrl = "https://ezcart.com.bd/";
//const String baseAppDevelopmentUrl = "https://dev.ezcart.com.bd/";
const String baseAppDevelopmentUrl = "https://test.ezcart.com.bd/";

const String baseAppLiveUrl = "";
const String baseAppUrl = baseAppDevelopmentUrl;

final String baseAppImageUrl = join(baseAppUrl, "public");
final String baseApiUrl = join(baseAppUrl, "api/v2");
final String loginUrl = join(baseApiUrl, "auth/login");
final String socialLoginUrl = join(baseApiUrl, "auth/social-login");

final String logoutUrl = join(baseApiUrl, "auth/logout");
final String userSignUpUrl = join(baseApiUrl, "auth/signup");
final String resendCodeUrl = join(baseApiUrl, "auth/resend_code");
final String confirmCodeUrl = join(baseApiUrl, "auth/confirm_code");
final String forgetPasswordUrl = join(baseApiUrl, "auth/password/forget_request");
final String passwordConfirmCodeUrl = join(baseApiUrl, "auth/password/confirm_code");

final String confirmResetPasswordUrl = join(baseApiUrl, "auth/password/confirm_reset");
final String passwordResendCodeUrl = join(baseApiUrl, "auth/password/resend_code");
final String getUserByTokenUrl = join(baseApiUrl, "get-user-by-access_token");
final String getProfileCounterUrl = join(baseApiUrl, "profile/counters/");
final String profileUpdateUrl = join(baseApiUrl, "profile/update");
final String profileUpdateDeviceTokenUrl = join(baseApiUrl, "profile/update-device-token");
final String profileUpdateImageUrl = join(baseApiUrl, "profile/update-image");

final String siteSettingsUrl = join(baseApiUrl, "sitesetting/get");
final String slidersUrl = join(
  baseApiUrl,
  "sliders",
);
final String getFeaturedProductsUrl = join(
  baseApiUrl,
  "products/featured",
);

final String getBestSellerProductsUrl = join(
  baseApiUrl,
  "products/best-seller",
);

final String getTodaysDealProductsUrl = join(
  baseApiUrl,
  "products/todays-deal",
);

final String getFlashDealProductsUrl = join(
  baseApiUrl,
  "flash-deal-products",
);

final String getFlashDealUrl = join(
  baseApiUrl,
  "flash-deals",
);

final String getAllProductsUrl = join(
  baseApiUrl,
  "products/all",
);

final String getCategoryProductsUrl = join(
  baseApiUrl,
  "products/category/",
);

final String getSellerProductsUrl = join(
  baseApiUrl,
  "products/seller/",
);

final String getBrandProductsUrl = join(
  baseApiUrl,
  "products/brand/",
);

final String getSearchProductsUrl = join(
  baseApiUrl,
  "products/search",
);

final String getProductsDetailsUrl = join(
  baseApiUrl,
  "products/",
);

final String getRelatedProductsUrl = join(
  baseApiUrl,
  "products/related/",
);

final String getTopFromSellerProductsUrl = join(
  baseApiUrl,
  "products/top-from-seller/",
);

final String getVariantProductsUrl = join(
  baseApiUrl,
  "products/variant/",
);

final String getFeatureCategoriesUrl = join(
  baseApiUrl,
  "categories/featured",
);

final String getTopCategoriesUrl = join(
  baseApiUrl,
  "categories/top",
);

final String getCategoriesProductUrl = join(
  baseApiUrl,
  "categories?parent_id=",
);

final String getCategoriesUrl = join(
  baseApiUrl,
  "categories",
);

final String brandUrl = join(
  baseApiUrl,
  "brands",
);
final String filterBrandUrl = join(
  baseApiUrl,
  "filter/brands",
);

final String filterCategoriesUrl = join(
  baseApiUrl,
  "filter/categories",
);

final String shopsUrl = join(
  baseApiUrl,
  "shops",
);

final String shopsDetailsUrl = join(
  baseApiUrl,
  "shops/details/",
);
final String shopsProductTopUrl = join(
  baseApiUrl,
  "shops/products/top/",
);

final String shopsProductNewUrl = join(
  baseApiUrl,
  "shops/products/new/",
);
final String shopsProductFeaturedUrl = join(
  baseApiUrl,
  "shops/products/featured/",
);

final String getWishlistsUrl = join(
  baseApiUrl,
  "wishlists/",
);

final String getWishlistsCheckProductUrl = join(
  baseApiUrl,
  "wishlists-check-product?",
);

final String getAddWishlistsUrl = join(
  baseApiUrl,
  "wishlists-add-product?",
);

final String getRemoveWishlistsUrl = join(
  baseApiUrl,
  "wishlists-remove-product",
);

final String getCartListUrl = join(
  baseApiUrl,
  "carts/",
);

final String getCartProcessUrl = join(
  baseApiUrl,
  "carts/process",
);

final String getAddCartUrl = join(
  baseApiUrl,
  "carts/add",
);

final String getCartSummaryUrl = join(
  baseApiUrl,
  "cart-summary/",
);

// Coupon
final String couponApplyUrl = join(
  baseApiUrl,
  "coupon-apply",
);
final String couponRemoveUrl = join(
  baseApiUrl,
  "coupon-remove",
);

// Wallet
final String walletApplyUrl = join(
  baseApiUrl,
  "apply-wallet-balance",
);
final String walletRemoveUrl = join(
  baseApiUrl,
  "remove-wallet-balance",
);

// Review
final String reviewsProductUrl = join(
  baseApiUrl,
  "reviews/product/",
);

final String reviewsSubmitUrl = join(
  baseApiUrl,
  "reviews/submit",
);

final String getAddressUrl = join(
  baseApiUrl,
  "user/shipping/address/",
);

final String postCreateAddressUrl = join(
  baseApiUrl,
  "user/shipping/create",
);

final String postUpdateAddressUrl = join(
  baseApiUrl,
  "user/shipping/update",
);

final String updateLocationUrl = join(
  baseApiUrl,
  "user/shipping/update-location",
);

final String makeDefaultAddressUrl = join(
  baseApiUrl,
  "user/shipping/make_default",
);

final String deleteAddressUrl = join(
  baseApiUrl,
  "user/shipping/delete/",
);

final String updateAddressInCartUrl = join(
  baseApiUrl,
  "update-address-in-cart",
);

final String shippingCostUrl = join(
  baseApiUrl,
  "shipping_cost",
);

final String paymentTypeUrl = join(
  baseApiUrl,
  "payment-types",
);

final String orderCreateUrl = join(
  baseApiUrl,
  "order/store",
);

final String paypalPaymentUrl = join(
  baseApiUrl,
  "paypal/payment/",
);

final String paymentPayWalletUrl = join(
  baseApiUrl,
  "payments/pay/wallet",
);

final String paymentCashOnDeliveryUrl = join(
  baseApiUrl,
  "payments/pay/cod",
);

final String paymentPayRazorUrl = join(
  baseApiUrl,
  "razorpay/success",
);
final String bkashBeginUrl = join(
  baseApiUrl,
  "bkash/",
);

final String paystackUrl = join(
  baseApiUrl,
  "paystack/success",
);

final String bkashProcessUrl = join(
  baseApiUrl,
  "bkash/process",
);

final String sslcommerzBeginUrl = join(
  baseApiUrl,
  "sslcommerz/",
);

final String nagadBeginUrl = join(
  baseApiUrl,
  "nagad/",
);
final String nagadProcessUrl = join(
  baseApiUrl,
  "nagad/process",
);

// Chat
final String chatConversationsUrl = join(
  baseApiUrl,
  "chat/conversations/",
);
final String chatMessagesUrl = join(
  baseApiUrl,
  "chat/messages/",
);

final String chatInsertMessagesUrl = join(
  baseApiUrl,
  "chat/insert-message",
);

final String chatGetNewMessagesUrl = join(
  baseApiUrl,
  "chat/get-new-messages/",
);

final String chatCreateConversationUrl = join(
  baseApiUrl,
  "chat/create-conversation",
);

// wallet
final String walletHistoryUrl = join(
  baseApiUrl,
  "wallet/history/",
);
final String walletBalanceUrl = join(
  baseApiUrl,
  "wallet/balance/",
);

final String refunRequestListUrl = join(
  baseApiUrl,
  "refund-request/get-list/",
);

// Club Point
final String clubPointListUrl = join(
  baseApiUrl,
  "clubpoint/get-list/",
);

final String clubPointConvertIntoWalletUrl = join(
  baseApiUrl,
  "clubpoint/convert-into-wallet",
);

final String clubpointBalanceUrl = join(
  baseApiUrl,
  "clubpoint/total-point/",
);
// Refund
final String refunRequestSendUrl = join(
  baseApiUrl,
  "refund-request/send",
);

final String purchaseHistoryUrl = join(
  baseApiUrl,
  "purchase-history/",
);

final String purchaseHistoryDetailsUrl = join(
  baseApiUrl,
  "purchase-history-details/",
);

final String purchaseHistoryItemsUrl = join(
  baseApiUrl,
  "purchase-history-items/",
);

final String citiesUrl = join(
  baseApiUrl,
  "cities",
);

final String countriesUrl = join(
  baseApiUrl,
  "countries",
);

final String divisionsUrl = join(
  baseApiUrl,
  "divisions",
);

final String districtsUrl = join(
  baseApiUrl,
  "districts",
);

final String subDistrictsUrl = join(
  baseApiUrl,
  "sub-districts",
);

final String localAreasUrl = join(
  baseApiUrl,
  "local-areas",
);

final String privacyPolicyUrl = join(
  baseApiUrl,
  "page/privacypolicy",
);

final String allPrivacyPolicyUrl = join(
  baseApiUrl,
  "pages",
);

final String paymentsCardOnDeliveryUrl = join(
  baseApiUrl,
  "payments/pay/card_on_delivery",
);

// Key
const String keySuccess = "success";
const String keyData = "data";
const String keyMessage = "message";
const String keyTrainingCategories = "training_categories";
const String keyTimeLengths = "time_lengths";
const String keyProfessions = "professions";
const String keyCategoryIconUrl = "cat_icon_url";
const String keyStoreLoginResponse = "store_login_response";
const String keyStoreIsLoggedIn = "is_logged_in";
// --------------------------------------------- //

const String keyAccessToken = "access_token";
const String keyClientId = "client_id";
const String keyClientSecret = "client_secret";
const String keyGrantType = "grant_type";
const String keyavatarOriginal = "avatar_original";

const String keyUserName = "username";
const String keyEmail = "email";
const String keyPhone = "phone";
const String keyPassword = "password";
const String keyCurrentPassword = "current_password";
const String keyConfirmationPassword = "password_confirmation";
const String keyNewPassword = "new_password";

const String keyDob = "dob";

const String keyIdentityMatrix = "identity_matrix";
const String keyName = "name";
const String keyProvider = "provider";
const String keyEmailorPhone = "email_or_phone";
const String keyPasswordConfirmation = "password_confirmation";
const String keyRegisterBy = "register_by";
const String keyVerificationCode = "verification_code";
const String keySendCodeBy = "send_code_by";
const String keyEmailOrCode = "email_or_code";
const String keyVerifyBy = "verify_by";

const String keyUserOTP = "use_otp";
const String keyStart = "start";
const String keyLength = "length";
const String keyCountryCode = "CountryCode";
const String keyMobileNumber = "MobileNumber";
const String keyUserNameForOTP = "UserName";
const String keyUser = "user";
const String keyShouldGetSendOtp = "SendOtp";
const String keyPage = "Page";
const String keyLengthCapiTtal = "Length";
const String keyItemId = "ItemId";
const String keyType = "Type";
const String keyDateFrom = "DateFrom";
const String keyDateTo = "DateTo";
const String keyKeyword = "Keyword";
const String keyCategoryId = "CategoryId";
const String keyCategoryName = "CategoryName";
const String keyId = "id";
const String keyCartIds = "cart_ids";
const String keyCartQuantities = "cart_quantities";
const String keyCartVariant = "variant";
const String keyUserId = "user_id";
const String keyQuantity = "quantity";
const String keyCostMatrix = "cost_matrix";
const String keyAddress = "address";
const String keyCity = "city";
const String keyCountry = "country";

const String keyDivision = "division";
const String keyDistrict = "district";
const String keySubDistrict = "sub_district";
const String keyLocalArea = "local_area";

const String keyPostalCode = "postal_code";
const String keyLatitude = "latitude";
const String keyLongitude = "longitude";
const String keyAddressId = "address_id";
const String keyOwnerId = "owner_id";
const String keyCityName = "city_name";
const String keyPaymentType = "payment_type";
const String keyPaymentMethod = "payment_method";
const String keyPaymentCardType = "payment_card";
const String keyPaymentOption = "payment_option";

const String keyAmount = "amount";
const String keyPaymentDetails = "payment_details";
const String keyOrderId = "order_id";
const String keyCouponCode = "coupon_code";
const String keyApplWalletBalance = "apply_wallet_balance";
const String keyOptionKey = "option_key";
const String keyPaymentScreen = "payment_screen";
const String keyConversationId = "conversation_id";
const String keyTitle = "title";
const String keyProductId = "product_id";
const String keyReason = "reason";
const String keyRating = "rating";
const String keyComment = "comment";
const String keyImage = "image";
const String keyFilename = "filename";

// Argumnets
const String strSelectedFilter = "selected_filter";
const String keyBrandName = "brand_name";
const String keyMessengerName = "messenger_name";
const String keyMessengerTitle = "messenger_title";
const String keyMessengerImage = "messenger_image";

// Regular Expression
const String regularExpressionEmail = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String regularExpressionPhone = "(\\+[0-9]+[\\- \\.]*)?(\\([0-9]+\\)[\\- \\.]*)?" + "([0-9][0-9\\- \\.]+[0-9])";

// Asset Resources
const String assetImgProfile = 'assets/default_avatar.png';
const String assetIcDelete = 'images/ic_delete.png';
const String assetPlaceHolder = 'assets/placeholder.jpeg';
const String assetEzCartLogo = 'assets/ez_cart_logo.png';
const String assetBD = 'assets/bd.png';
const String assetEzCartSplash = 'assets/ezcart_cartoon_splash.png';
const String assetEzCartCartoon = 'assets/ezcart_cartoon.png';

// Common String
const String strAddAddress = "Add";
const String strEditAddress = "Edit";
const int typeAsCustomer = 2;
const int typeAsSeller = 1;
const String isBaseCategory = "isBaseCategory";
const String isTopCategory = "isTopCategory";
const String hasBottomnav = "hasBottomnav";
const String cartPayment = "cart_payment";
const String walletPayment = "wallet_payment";

const String bkashScreen = "Bkash";
const String nagadScreen = "Nagad";
const String paypalScreen = "Paypal";
const String razorPayScreen = "RazorPay";
const String payStackScreen = "PayStack";
const String sslCommerceScreen = "SSLcommerze";
const String stripeScreen = "Stripe";
const String iyzicoScreen = "Iyzico";
const String cardOnDeliveryScreen = "Card On Delivery";
