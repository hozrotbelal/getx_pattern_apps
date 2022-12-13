import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:ezcartapp/data/remote/response/address_response/address_response.dart';
import 'package:ezcartapp/data/remote/response/all_product/all_product_response.dart';
import 'package:ezcartapp/data/remote/response/auth_response/login_response/login_response.dart';
import 'package:ezcartapp/data/remote/response/auth_response/signup_response/signup_response.dart';
import 'package:ezcartapp/data/remote/response/auth_response/user_token_response/user_token_response.dart';
import 'package:ezcartapp/data/remote/response/base_response.dart';
import 'package:ezcartapp/data/remote/response/brand_response/brand_response.dart';
import 'package:ezcartapp/data/remote/response/cart_response/cart_response.dart';
import 'package:ezcartapp/data/remote/response/cart_response/cart_summary_response/cart_summary_response.dart';
import 'package:ezcartapp/data/remote/response/cart_response/cartlist_response/cartlist_response.dart';
import 'package:ezcartapp/data/remote/response/cash_on_delivery_response/cash_on_delivery_response.dart';
import 'package:ezcartapp/data/remote/response/category_response/category_response.dart';
import 'package:ezcartapp/data/remote/response/city_response/city_response.dart';
import 'package:ezcartapp/data/remote/response/clubpoint_response/clubpoint_balance_reponse/clubpoint_balance_response.dart';
import 'package:ezcartapp/data/remote/response/clubpoint_response/clubpoint_response.dart';
import 'package:ezcartapp/data/remote/response/common_response/common_response.dart';
import 'package:ezcartapp/data/remote/response/conversation_create_response/conversion_create_response.dart';
import 'package:ezcartapp/data/remote/response/conversation_response/conversation_response.dart';
import 'package:ezcartapp/data/remote/response/country_response/country_response.dart';
import 'package:ezcartapp/data/remote/response/districts_response/districts_response.dart';
import 'package:ezcartapp/data/remote/response/divisions_response/divisions_response.dart';
import 'package:ezcartapp/data/remote/response/feature_category_response/feature_category_response.dart';
import 'package:ezcartapp/data/remote/response/feature_product_response/feature_product_response.dart';
import 'package:ezcartapp/data/remote/response/flash_deal_response/flash_deal_response.dart';
import 'package:ezcartapp/data/remote/response/local_areas_response/local_areas_response.dart';
import 'package:ezcartapp/data/remote/response/message_response/message_response.dart';
import 'package:ezcartapp/data/remote/response/nagad_begin_response/nagad_begin_response.dart';
import 'package:ezcartapp/data/remote/response/order_create_response/order_create_response.dart';
import 'package:ezcartapp/data/remote/response/order_item_response/order_items_response.dart';
import 'package:ezcartapp/data/remote/response/order_mini_response/order_mini_response.dart';
import 'package:ezcartapp/data/remote/response/orderd_detail_response/orderd_details_response.dart';
import 'package:ezcartapp/data/remote/response/password_confirm_code/password_confirm_code_response.dart';
import 'package:ezcartapp/data/remote/response/payment_type_response/payment_type_response.dart';
import 'package:ezcartapp/data/remote/response/paypal_url_response/paypal_url_response.dart';
import 'package:ezcartapp/data/remote/response/policy_response/policy_response.dart';
import 'package:ezcartapp/data/remote/response/product/product_details_response/product_details_response.dart';
import 'package:ezcartapp/data/remote/response/product/product_mini_response/product_mini_response.dart';
import 'package:ezcartapp/data/remote/response/profile/profile_counters_response/profile_counters_response.dart';
import 'package:ezcartapp/data/remote/response/refund_request_response/refund_request_response.dart';
import 'package:ezcartapp/data/remote/response/review_response/review_response.dart';
import 'package:ezcartapp/data/remote/response/shipping_cost_response/shipping_cost_response.dart';
import 'package:ezcartapp/data/remote/response/shop_details_response/shop_details_response.dart';
import 'package:ezcartapp/data/remote/response/shop_response/shop_response.dart';
import 'package:ezcartapp/data/remote/response/sub_districts_response/sub_districts_response.dart';
import 'package:ezcartapp/data/remote/response/variant_response/variant_response.dart';
import 'package:ezcartapp/data/remote/response/wallet/wallet_balance_reponse/wallet_balance_response.dart';
import 'package:ezcartapp/data/remote/response/wallet/wallet_recharge_reponse/wallet_recharge_response.dart';
import 'package:ezcartapp/data/remote/response/wishlist_response/wishlists_check_response/wishlists_check_response.dart';
import 'package:ezcartapp/data/remote/response/wishlist_response/wishlists_response.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ezcartapp/constants.dart';
import 'package:ezcartapp/util/lib/network/api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RemoteService extends GetxService {
  RemoteService() {
    if (ApiUtil.client == null) {
      ApiUtil.client = dio.Dio(
        dio.BaseOptions(
          baseUrl: baseApiUrl,
          headers: {
            HttpHeaders.acceptHeader: responseOfJsonType,
          },
        ),
      );

      ApiUtil.client!.interceptors.add(
        PrettyDioLogger(
          requestHeader: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
        ),
      );
    }
  }
//

  // Authorization
  Future<LoginResponse> getLogin(String? email, String? password, {String purchaseCode = purchaseCode}) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyPhone, email);
    ApiUtil.appendParamIntoData(bodyData, keyPassword, password);
    ApiUtil.appendParamIntoData(bodyData, keyIdentityMatrix, purchaseCode);

    final response = await ApiUtil.postRequest(
      endPoint: loginUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return LoginResponse.fromJson(response.data);
  }

  Future<LoginResponse> getSocialLogin({
    required String? name,
    required String? email,
    required String? provider,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyEmail, email);
    ApiUtil.appendParamIntoData(bodyData, keyName, name);
    ApiUtil.appendParamIntoData(bodyData, keyProvider, provider);

    final response = await ApiUtil.postRequest(
      endPoint: socialLoginUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return LoginResponse.fromJson(response.data);
  }

  Future<CommonResponse> getLogout() async {
    final response = await ApiUtil.getRequest(
      endPoint: logoutUrl,
      shouldGetOtherHeaders: true,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<SignUpResponse> getSignUp({
    String? name,
    String? emailOrPhone,
    String? password,
    String? passowrdConfirmation,
    String? registerBy,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyName, name);
    ApiUtil.appendParamIntoData(bodyData, keyEmailorPhone, emailOrPhone);
    ApiUtil.appendParamIntoData(bodyData, keyPassword, password);
    ApiUtil.appendParamIntoData(bodyData, keyPasswordConfirmation, passowrdConfirmation);
    ApiUtil.appendParamIntoData(bodyData, keyRegisterBy, registerBy);

    final response = await ApiUtil.postRequest(
      endPoint: userSignUpUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return SignUpResponse.fromJson(response.data);
  }

  Future<CommonResponse> getResendCode({
    required int? userId,
    required String? verifyBy,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyRegisterBy, verifyBy);

    final response = await ApiUtil.postRequest(
      endPoint: resendCodeUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<CommonResponse> getConfirmCode({
    required int? userId,
    required String? verificationCode,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyVerificationCode, verificationCode);

    final response = await ApiUtil.postRequest(
      endPoint: confirmCodeUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<CommonResponse> getPasswordForget({
    required String? emailOrPhone,
    required String? sendCodeBy,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyEmailorPhone, emailOrPhone);
    ApiUtil.appendParamIntoData(bodyData, keySendCodeBy, sendCodeBy);

    final response = await ApiUtil.postRequest(
      endPoint: forgetPasswordUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<PasswordConfirmCodeResponse> getPasswordConfirmCode({
    // required int? userId,
    required String? verificationCode,
  }) async {
    final bodyData = HashMap<String, String>();
    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyVerificationCode, verificationCode);

    final response = await ApiUtil.postRequest(
      endPoint: passwordConfirmCodeUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return PasswordConfirmCodeResponse.fromJson(response.data);
  }

  Future<PasswordConfirmCodeResponse> getPasswordConfirm({
    required String? newPassword,
    required String? confirmPassword,
    required String? userId,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyPassword, newPassword);
    ApiUtil.appendParamIntoData(bodyData, keyConfirmationPassword, confirmPassword);
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId);

    final response = await ApiUtil.postRequest(
      endPoint: confirmResetPasswordUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return PasswordConfirmCodeResponse.fromJson(response.data);
  }

  Future<CommonResponse> getPasswordResendCode({
    required String? emailOrPhone,
    required String? verifyBy,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyEmailorPhone, emailOrPhone);
    ApiUtil.appendParamIntoData(bodyData, keyVerifyBy, verifyBy);

    final response = await ApiUtil.postRequest(
      endPoint: passwordResendCodeUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<UserTokenResponse> getUserByToken({
    required String? accessToken,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyAccessToken, accessToken);

    final response = await ApiUtil.postRequest(
      endPoint: getUserByTokenUrl,
      data: bodyData,
      shouldGetOtherHeaders: false,
    );

    return UserTokenResponse.fromJson(response.data);
  }

  Future<ProfileCountersResponse> getProfileCountersResponse({
    required int? userId,
  }) async {
    final response = await ApiUtil.getRequest(
      endPoint: getProfileCounterUrl + "$userId",
      shouldGetOtherHeaders: true,
    );

    return ProfileCountersResponse.fromJson(response.data);
  }

  Future<CommonResponse> getProfileUpdateResponse({
    required int? userId,
    required String name,
    required String phone,
    required String currentPassword,
    required String newPassword,
    required String confirmationPassword,
    String? email,
    String? dob,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyName, name);
    ApiUtil.appendParamIntoData(bodyData, keyPhone, phone);
    ApiUtil.appendParamIntoData(bodyData, keyEmail, email);
    ApiUtil.appendParamIntoData(bodyData, keyCurrentPassword, currentPassword);
    ApiUtil.appendParamIntoData(bodyData, keyNewPassword, newPassword);
    ApiUtil.appendParamIntoData(bodyData, keyConfirmationPassword, confirmationPassword);
    ApiUtil.appendParamIntoData(bodyData, keyDob, dob);

    final response = await ApiUtil.postRequest(
      endPoint: profileUpdateUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<CommonResponse> getProfileImageUpdateResponse({
    required int? userId,
    required String image,
    required String filename,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyImage, image);
    ApiUtil.appendParamIntoData(bodyData, keyFilename, filename);

    final response = await ApiUtil.postRequest(
      endPoint: profileUpdateImageUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );

    return CommonResponse.fromJson(response.data);
  }

  // Sliders
  Future<BaseResponse> getSliders() async {
    final response = await ApiUtil.getRequest(
      endPoint: slidersUrl,
      shouldGetOtherHeaders: false,
    );

    return BaseResponse.fromJson(response.data);
  }

  // Feature Product
  Future<FeatureProductResponse> getFeaturedProducts() async {
    final response = await ApiUtil.getRequest(
      endPoint: getFeaturedProductsUrl,
      shouldGetOtherHeaders: false,
    );
    return FeatureProductResponse.fromJson(response.data);
  }

  Future<ProductMiniResponse> getBestSellingProducts() async {
    final response = await ApiUtil.getRequest(
      endPoint: getBestSellerProductsUrl,
      shouldGetOtherHeaders: false,
    );
    return ProductMiniResponse.fromJson(response.data);
  }

  Future<ProductMiniResponse> getTodaysDealProducts() async {
    final response = await ApiUtil.getRequest(
      endPoint: getTodaysDealProductsUrl,
      shouldGetOtherHeaders: false,
    );
    return ProductMiniResponse.fromJson(response.data);
  }

  Future<ProductMiniResponse> getFlashDealProducts({int id = 0}) async {
    final response = await ApiUtil.postRequest(
      endPoint: getFlashDealProductsUrl + "/" + id.toString(),
      shouldGetOtherHeaders: false,
      data: {},
    );
    return ProductMiniResponse.fromJson(response.data);
  }

  Future<ProductMiniResponse> getShopProducts({int id = 0, String name = "", int page = 1}) async {
    final response = await ApiUtil.getRequest(
      endPoint: getSellerProductsUrl + id.toString() + "?page=$page&name=$name",
      shouldGetOtherHeaders: false,
    );
    return ProductMiniResponse.fromJson(response.data);
  }

  Future<FlashDealResponse> getFlashDeal() async {
    final response = await ApiUtil.postRequest(
      endPoint: getFlashDealUrl,
      shouldGetOtherHeaders: false,
      data: {},
    );
    return FlashDealResponse.fromJson(response.data);
  }

  Future<ProductMiniResponse> getBrandProducts({int id = 0, String name = "", int page = 1}) async {
    final response = await ApiUtil.getRequest(
      endPoint: getBrandProductsUrl + id.toString() + "?page=$page&name=$name",
      shouldGetOtherHeaders: false,
    );
    return ProductMiniResponse.fromJson(response.data);
  }

  Future<ProductMiniResponse> getFilteredProducts({name = "", sortKey = "", page = 1, brands = "", categories = "", min = "", max = ""}) async {
    var url = getSearchProductsUrl + "?page=$page&name=$name&sort_key=$sortKey&brands=$brands&categories=$categories&min=$min&max=$max";

    final response = await ApiUtil.getRequest(
      endPoint: url,
      shouldGetOtherHeaders: false,
    );
    return ProductMiniResponse.fromJson(response.data);
  }

  Future<ProductDetailsResponse> getProductDetails({int id = 0}) async {
    var url = getProductsDetailsUrl + id.toString();

    final response = await ApiUtil.getRequest(
      endPoint: url,
      shouldGetOtherHeaders: false,
    );
    return ProductDetailsResponse.fromJson(response.data);
  }

  Future<ProductMiniResponse> getRelatedProducts({int id = 0}) async {
    final response = await ApiUtil.getRequest(
      endPoint: getRelatedProductsUrl + id.toString(),
      shouldGetOtherHeaders: false,
    );
    return ProductMiniResponse.fromJson(response.data);
  }

  Future<ProductMiniResponse> getTopFromThisSellerProducts({int id = 0}) async {
    final response = await ApiUtil.getRequest(
      endPoint: getTopFromSellerProductsUrl + id.toString(),
      shouldGetOtherHeaders: false,
    );
    return ProductMiniResponse.fromJson(response.data);
  }

  Future<VariantResponse> getVariantWiseInfo({int id = 0, color = '', variants = ''}) async {
    var url = getVariantProductsUrl + "price?id=${id.toString()}" + "&color=$color&variants=$variants";

    final response = await ApiUtil.getRequest(
      endPoint: url,
      shouldGetOtherHeaders: false,
    );
    return VariantResponse.fromJson(response.data);
  }

  // Feature Category
  Future<FeatureCategoryResponse> getFeaturedCategory() async {
    final response = await ApiUtil.getRequest(
      endPoint: getFeatureCategoriesUrl,
      shouldGetOtherHeaders: false,
    );

    return FeatureCategoryResponse.fromJson(response.data);
  }

  // Top Category
  Future<CategoryResponse> getTopCategory() async {
    final response = await ApiUtil.getRequest(
      endPoint: getTopCategoriesUrl,
      shouldGetOtherHeaders: false,
    );

    return CategoryResponse.fromJson(response.data);
  }

  //  Category
  Future<CategoryResponse> getCategory() async {
    final response = await ApiUtil.getRequest(
      endPoint: getCategoriesUrl,
      shouldGetOtherHeaders: false,
    );

    return CategoryResponse.fromJson(response.data);
  }

  Future<CategoryResponse> getCategoryProduct({parentId = 0}) async {
    final response = await ApiUtil.getRequest(
      endPoint: getCategoriesProductUrl + "$parentId",
      shouldGetOtherHeaders: false,
    );

    return CategoryResponse.fromJson(response.data);
  }

// All Product
  Future<AllProductResponse> getAllProducts() async {
    var url = getAllProductsUrl,
        response = await ApiUtil.getRequest(
          endPoint: url,
          shouldGetOtherHeaders: false,
        );

    return AllProductResponse.fromJson(response.data);
  }

  //  Category Product
  Future<FeatureProductResponse> getCategoryProducts({int id = 0, name = "", page = 1}) async {
    var url = getCategoryProductsUrl + "$id" + "?page=$page&name=$name",
        response = await ApiUtil.getRequest(
          endPoint: url,
          shouldGetOtherHeaders: false,
        );

    return FeatureProductResponse.fromJson(response.data);
  }

  //  Brand Product
  Future<BrandResponse> getFilterPageBrands() async {
    var response = await ApiUtil.getRequest(
      endPoint: filterBrandUrl,
      shouldGetOtherHeaders: false,
    );

    return BrandResponse.fromJson(response.data);
  }

  Future<BrandResponse> getBrands({name = "", page = 1}) async {
    var url = brandUrl + "?page=$page&name=$name",
        response = await ApiUtil.getRequest(
          endPoint: url,
          shouldGetOtherHeaders: false,
        );

    return BrandResponse.fromJson(response.data);
  }

  Future<BrandResponse> getFilterPageCategories() async {
    var response = await ApiUtil.getRequest(
      endPoint: filterCategoriesUrl,
      shouldGetOtherHeaders: false,
    );

    return BrandResponse.fromJson(response.data);
  }

// Shop product
  Future<ShopResponse> getShops({name = "", page = 1}) async {
    var url = shopsUrl + "?page=$page&name=$name",
        response = await ApiUtil.getRequest(
          endPoint: url,
          shouldGetOtherHeaders: false,
        );

    return ShopResponse.fromJson(response.data);
  }

  Future<ShopDetailsResponse> getShopInfo({id = 0}) async {
    var response = await ApiUtil.getRequest(
      endPoint: shopsDetailsUrl + "$id",
      shouldGetOtherHeaders: false,
    );

    return ShopDetailsResponse.fromJson(response.data);
  }

// Top Or New Or Featured
  Future<ShopDetailsResponse> getTopOrNewOrFeaturedFromThisSellerProducts({
    String? url,
    int id = 0,
  }) async {
    var response = await ApiUtil.getRequest(
      endPoint: url! + "$id",
      shouldGetOtherHeaders: false,
    );

    return ShopDetailsResponse.fromJson(response.data);
  }

//  Wishlist
  Future<WishlistsResponse> getUserWishlist(int userId) async {
    final response = await ApiUtil.postRequest(
      endPoint: getWishlistsUrl + "$userId",
      shouldGetOtherHeaders: true,
    );

    return WishlistsResponse.fromJson(response.data);
  }

  // Delete Wishlist
  Future<CommonResponse> deleteFromWishlist({
    int wishlistId = 0,
  }) async {
    final response = await ApiUtil.deleteRequest(
      endPoint: getWishlistsUrl + "$wishlistId",
      shouldGetOtherHeaders: true,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<WishlistsCheckResponse> isProductInUserWishList({
    int productId = 0,
    int userId = 0,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: getWishlistsCheckProductUrl + "product_id=$productId&user_id=$userId",
      shouldGetOtherHeaders: true,
      data: {},
    );

    return WishlistsCheckResponse.fromJson(response.data);
  }

  Future<WishlistsCheckResponse> addWishList({
    int productId = 0,
    int userId = 0,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: getAddWishlistsUrl + "product_id=$productId&user_id=$userId",
      shouldGetOtherHeaders: true,
      data: {},
    );

    return WishlistsCheckResponse.fromJson(response.data);
  }

  Future<WishlistsCheckResponse> removeWishList({
    int productId = 0,
    int userId = 0,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: getRemoveWishlistsUrl + "?product_id=$productId&user_id=$userId",
      shouldGetOtherHeaders: true,
      data: {},
    );

    return WishlistsCheckResponse.fromJson(response.data);
  }

// Cart List
  Future<CartListResponse> getCartResponseList({
    int userId = 0,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: getCartListUrl + "$userId",
      data: {},
      shouldGetOtherHeaders: true,
    );

    return CartListResponse.fromJson(response.data);
  }

  Future<CommonResponse> getCartDeleteResponse({
    int cartId = 0,
  }) async {
    final response = await ApiUtil.deleteRequest(
      endPoint: getCartListUrl + "$cartId",
      shouldGetOtherHeaders: true,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<CommonResponse> getCartProcessResponse({
    String? cartIds,
    String? cartQuantities,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyCartIds, cartIds);
    ApiUtil.appendParamIntoData(bodyData, keyCartQuantities, cartQuantities);

    final response = await ApiUtil.postRequest(
      endPoint: getCartProcessUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<CommonResponse> getCartAddResponse({
    required int? id,
    required String? variant,
    required int? userId,
    required int? quantity,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyId, id.toString());
    ApiUtil.appendParamIntoData(bodyData, keyCartVariant, variant);
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyQuantity, quantity.toString());
    ApiUtil.appendParamIntoData(bodyData, keyCostMatrix, purchaseCode);

    final response = await ApiUtil.postRequest(
      endPoint: getAddCartUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<CartSummaryResponse> getCartSummaryResponse({
    required int? ownerId,
    required int? userId,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: getCartSummaryUrl + "$userId",
      data: {},
      shouldGetOtherHeaders: true,
    );

    return CartSummaryResponse.fromJson(response.data);
  }

// Coupon
  Future<CommonResponse> getCouponApplyResponse({
    required int? ownerId,
    required int? userId,
    required String? couponCode,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyOwnerId, ownerId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyCouponCode, couponCode);
    final response = await ApiUtil.postRequest(
      endPoint: couponApplyUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<CommonResponse> getCouponRemoveResponse({
    required int? ownerId,
    required int? userId,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyOwnerId, ownerId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    final response = await ApiUtil.postRequest(
      endPoint: couponRemoveUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );

    return CommonResponse.fromJson(response.data);
  }

// End Cart API

// Wallet
  Future<CommonResponse> getWalletApplyResponse({
    required String? url,
    required int? userId,
    String? walletBalance,
    bool isAddWallet = true,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    if (isAddWallet) {
      ApiUtil.appendParamIntoData(bodyData, keyApplWalletBalance, walletBalance.toString());
    }
    final response = await ApiUtil.postRequest(
      endPoint: url!,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return CommonResponse.fromJson(response.data);
  }

// Review
  Future<ReviewResponse> getReviewResponse({
    required int? productId,
    int page = 1,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: reviewsProductUrl + "$productId?page=$page",
      shouldGetOtherHeaders: true,
      data: {},
    );

    return ReviewResponse.fromJson(response.data);
  }

  Future<CommonResponse> getReviewSubmitResponse({
    required int? productId,
    required int? userId,
    required int? rating,
    required String? comment,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyProductId, productId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyRating, rating.toString());
    ApiUtil.appendParamIntoData(bodyData, keyComment, comment);

    final response = await ApiUtil.postRequest(
      endPoint: reviewsSubmitUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );

    return CommonResponse.fromJson(response.data);
  }

  // Address
  Future<AddressResponse> getAddressList({
    required int? userId,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: getAddressUrl + "$userId",
      shouldGetOtherHeaders: true,
      data: {},
    );

    return AddressResponse.fromJson(response.data);
  }

  Future<CommonResponse> getAddressAddResponse({
    required String url,
    required int? userId,
    int? id,
    required String? address,
    required String? country,
    required String? division,
    required String? district,
    required String? subDistrict,
    String? localArea,
    required String? postalCode,
    required String? phone,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyAddress, address);
    ApiUtil.appendParamIntoData(bodyData, keyCountry, country);
    ApiUtil.appendParamIntoData(bodyData, keyDivision, division);
    ApiUtil.appendParamIntoData(bodyData, keyDistrict, district);
    ApiUtil.appendParamIntoData(bodyData, keySubDistrict, subDistrict);
    ApiUtil.appendParamIntoData(bodyData, keyLocalArea, localArea);
    ApiUtil.appendParamIntoData(bodyData, keyPostalCode, postalCode);
    ApiUtil.appendParamIntoData(bodyData, keyPhone, phone);
    if (id != null && id > 0) {
      ApiUtil.appendParamIntoData(bodyData, keyId, id.toString());
    }

    final response = await ApiUtil.postRequest(
      endPoint: url,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return CommonResponse.fromJson(response.data);
  }

  Future<CommonResponse> getAddressMakeDefaultResponse({
    required int? userId,
    required int? id,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyId, id.toString());

    final response = await ApiUtil.postRequest(
      endPoint: makeDefaultAddressUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return CommonResponse.fromJson(response.data);
  }

  Future<CommonResponse> getAddressDeleteResponse({
    required int? id,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: deleteAddressUrl + "$id",
      shouldGetOtherHeaders: true,
      data: {},
    );

    return CommonResponse.fromJson(response.data);
  }

  Future<CityResponse> getCityList() async {
    final response = await ApiUtil.getRequest(
      endPoint: citiesUrl,
      shouldGetOtherHeaders: true,
    );

    return CityResponse.fromJson(response.data);
  }

  Future<CountryResponse> getCountryList() async {
    final response = await ApiUtil.getRequest(
      endPoint: countriesUrl,
      shouldGetOtherHeaders: true,
    );

    return CountryResponse.fromJson(response.data);
  }

  Future<DivisionsResponse> getDivisionsList() async {
    final response = await ApiUtil.getRequest(
      endPoint: divisionsUrl,
      shouldGetOtherHeaders: true,
    );

    return DivisionsResponse.fromJson(response.data);
  }

  Future<DistrictsResponse> getDistrictsList(int divId) async {
    final response = await ApiUtil.getRequest(
      endPoint: districtsUrl + "/$divId",
      shouldGetOtherHeaders: true,
    );

    return DistrictsResponse.fromJson(response.data);
  }

  Future<SubDistrictsResponse> getSubDistrictsList(int districtId) async {
    final response = await ApiUtil.getRequest(
      endPoint: subDistrictsUrl + "/$districtId",
      shouldGetOtherHeaders: true,
    );

    return SubDistrictsResponse.fromJson(response.data);
  }

  Future<LocalAreasResponse> getLocalAreasList(int subDistrictId) async {
    final response = await ApiUtil.getRequest(
      endPoint: localAreasUrl + "/$subDistrictId",
      shouldGetOtherHeaders: true,
    );

    return LocalAreasResponse.fromJson(response.data);
  }

  Future<CommonResponse> getAddressUpdateInCartResponse({
    required int? userId,
    required int? addressId,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyAddressId, addressId.toString());

    final response = await ApiUtil.postRequest(
      endPoint: updateAddressInCartUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return CommonResponse.fromJson(response.data);
  }

  Future<ShippingCostResponse> getShippingCostResponse({
    required int? addressId,
    required int? userId,
    //x  String? cityName,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyAddressId, addressId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    // ApiUtil.appendParamIntoData(bodyData, keyCityName, cityName);

    final response = await ApiUtil.postRequest(
      endPoint: shippingCostUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return ShippingCostResponse.fromJson(response.data);
  }

  Future<PaymentTypeResponse> getPaymentResponseList({
    String? mode = "",
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: paymentTypeUrl + "?mode=$mode",
      shouldGetOtherHeaders: true,
    );
    return PaymentTypeResponse.fromJson(response.data);
  }

  Future<OrderCreateResponse> getOrderCreateResponse({
    required int? ownerId,
    required int? userId,
    required String? paymentMethod,
    String? paymentCard,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyOwnerId, ownerId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyPaymentOption, paymentMethod);
    if (paymentMethod == "card_on_delivery") {
      ApiUtil.appendParamIntoData(bodyData, keyPaymentCardType, paymentCard);
    }

    final response = await ApiUtil.postRequest(
      endPoint: orderCreateUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return OrderCreateResponse.fromJson(response.data);
  }

  Future<PaypalUrlResponse> getPaypalUrlResponse({
    required String paymentType,
    required int orderId,
    required int userId,
    required double amount,
  }) async {
    final response = await ApiUtil.getRequest(
      endPoint: paypalPaymentUrl + "url?payment_type=$paymentType&order_id=$orderId&amount=$amount&user_id=$userId",
      shouldGetOtherHeaders: true,
    );
    return PaypalUrlResponse.fromJson(response.data);
  }

  Future<OrderCreateResponse> getOrderCreateResponseFromWallet({
    required int? ownerId,
    required int? userId,
    required double? amount,
    required String? paymentMethod,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyOwnerId, ownerId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyPaymentType, paymentMethod);
    ApiUtil.appendParamIntoData(bodyData, keyAmount, amount.toString());

    final response = await ApiUtil.postRequest(
      endPoint: paymentPayWalletUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return OrderCreateResponse.fromJson(response.data);
  }

  Future<OrderCreateResponse> getOrderCreateResponseFromCod({
    required int? ownerId,
    required int? userId,
    required String? paymentMethod,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyOwnerId, ownerId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyPaymentType, paymentMethod);

    final response = await ApiUtil.postRequest(
      endPoint: paymentCashOnDeliveryUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return OrderCreateResponse.fromJson(response.data);
  }

//PaystackPaymentProcess or RazorpayPaymentProcess Or BkashPaymentProcess or NagadPaymentProcess
  Future<CommonResponse> getBkashNagadRazorpayPaystackPaymentProcessResponse({
    required String? url,
    required int? orderId,
    required int? userId,
    required String? paymentMethod,
    required double? amount,
    required String? paymentDetails,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyOrderId, orderId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyPaymentType, paymentMethod);
    ApiUtil.appendParamIntoData(bodyData, keyAmount, amount.toString());
    ApiUtil.appendParamIntoData(bodyData, keyPaymentDetails, paymentDetails);

    final response = await ApiUtil.postRequest(
      endPoint: url!,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return CommonResponse.fromJson(response.data);
  }

  Future<NagadBeginResponse> getBkashBeginResponse({
    required int? orderId,
    required int? userId,
    required String? paymentType,
    required double? amount,
  }) async {
    final response = await ApiUtil.getRequest(
      endPoint: bkashBeginUrl + "begin?$keyPaymentType=$paymentType&order_id=$orderId&amount=$amount&user_id=$userId",
      shouldGetOtherHeaders: true,
    );
    return NagadBeginResponse.fromJson(response.data);
  }

  Future<NagadBeginResponse> getBkashPaymentProcessResponse({
    required int? orderId,
    required int? userId,
    required String? paymentType,
    required double? amount,
    required String? paymentDetails,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyOrderId, orderId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyPaymentType, paymentType);
    ApiUtil.appendParamIntoData(bodyData, keyAmount, amount.toString());
    ApiUtil.appendParamIntoData(bodyData, keyPaymentDetails, paymentDetails);

    final response = await ApiUtil.postRequest(
      endPoint: bkashProcessUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return NagadBeginResponse.fromJson(response.data);
  }

// Sslcommerz Or Nagad Begin
  Future<NagadBeginResponse> getSslcommerzOrNagadBeginResponse({
    required String? url,
    required int? orderId,
    required int? userId,
    required String? paymentType,
    required double? amount,
  }) async {
    final response = await ApiUtil.getRequest(
      endPoint: url! + "begin?$keyPaymentType=$paymentType&order_id=$orderId&amount=$amount&user_id=$userId",
      shouldGetOtherHeaders: true,
    );
    return NagadBeginResponse.fromJson(response.data);
  }

// Chat
  Future<ConversationResponse> getConversationResponse({
    required int userId,
    required int page,
  }) async {
    final response = await ApiUtil.getRequest(
      endPoint: chatConversationsUrl + "$userId?page=$page",
      shouldGetOtherHeaders: true,
    );
    return ConversationResponse.fromJson(response.data);
  }

  Future<MessageResponse> getMessageResponse({
    required int conversationId,
    int page = 1,
  }) async {
    final response = await ApiUtil.getRequest(
      endPoint: chatMessagesUrl + "$conversationId?page=$page",
      shouldGetOtherHeaders: true,
    );
    return MessageResponse.fromJson(response.data);
  }

  Future<MessageResponse> getInserMessageResponse({
    required int? userId,
    required int? conversationId,
    required String? message,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyMessage, message);
    ApiUtil.appendParamIntoData(bodyData, keyConversationId, conversationId.toString());

    final response = await ApiUtil.postRequest(
      endPoint: chatInsertMessagesUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return MessageResponse.fromJson(response.data);
  }

  Future<MessageResponse> getNewMessageResponse({
    required int conversationId,
    required int lastMessageId,
  }) async {
    final response = await ApiUtil.getRequest(
      endPoint: chatGetNewMessagesUrl + "$conversationId/$lastMessageId",
      shouldGetOtherHeaders: true,
    );
    return MessageResponse.fromJson(response.data);
  }

  Future<ConversionCreateResponse> getCreateConversationResponse({
    required int? userId,
    required int? productId,
    required String? title,
    required String? message,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyTitle, title);

    ApiUtil.appendParamIntoData(bodyData, keyMessage, message);
    ApiUtil.appendParamIntoData(bodyData, keyProductId, productId.toString());

    final response = await ApiUtil.postRequest(
      endPoint: chatCreateConversationUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return ConversionCreateResponse.fromJson(response.data);
  }

// Wallet
  Future<WalletBalanceResponse> getBalance({
    required int userId,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: walletBalanceUrl + "$userId",
      shouldGetOtherHeaders: true,
      data: {},
    );
    return WalletBalanceResponse.fromJson(response.data);
  }

  Future<WalletRechargeResponse> getRechargeList({required int userId, int page = 1}) async {
    final response = await ApiUtil.postRequest(
      endPoint: walletHistoryUrl + "$userId?page=$page",
      shouldGetOtherHeaders: true,
      data: {},
    );
    return WalletRechargeResponse.fromJson(response.data);
  }

  Future<ClubpointResponse> getClubPointListResponse({
    required int userId,
    int page = 1,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: clubPointListUrl + "$userId" + "?page=$page",
      shouldGetOtherHeaders: true,
    );
    return ClubpointResponse.fromJson(response.data);
  }

  Future<ClubpointBalanceResponse> getClubPointBalance({
    required int userId,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: clubpointBalanceUrl + "$userId",
      shouldGetOtherHeaders: true,
      data: {},
    );
    return ClubpointBalanceResponse.fromJson(response.data);
  }

  Future<CommonResponse> getClubpointToWalletResponse({
    required int userId,
    required int id,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyId, id.toString());

    final response = await ApiUtil.postRequest(
      endPoint: clubPointConvertIntoWalletUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return CommonResponse.fromJson(response.data);
  }

  Future<RefundRequestResponse> getRefundRequestListResponse({required int userId, int page = 1}) async {
    final response = await ApiUtil.postRequest(endPoint: refunRequestListUrl + "$userId?page=$page", shouldGetOtherHeaders: true, data: {});
    return RefundRequestResponse.fromJson(response.data);
  }

  Future<CommonResponse> getRefundRequestSendResponse({
    required int? userId,
    required int? id,
    required String? reason,
  }) async {
    final bodyData = HashMap<String, String>();

    // Required fields
    ApiUtil.appendParamIntoData(bodyData, keyUserId, userId.toString());
    ApiUtil.appendParamIntoData(bodyData, keyReason, reason);
    ApiUtil.appendParamIntoData(bodyData, keyId, id.toString());

    final response = await ApiUtil.postRequest(
      endPoint: refunRequestSendUrl,
      data: bodyData,
      shouldGetOtherHeaders: true,
    );
    return CommonResponse.fromJson(response.data);
  }

  Future<OrderMiniResponse> getOrderList({
    required int userId,
    String paymentStatus = "",
    String deliveryStatus = "",
    int page = 1,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: purchaseHistoryUrl + "$userId" + "?page=$page&payment_status=$paymentStatus&delivery_status=$deliveryStatus",
      shouldGetOtherHeaders: true,
    );
    return OrderMiniResponse.fromJson(response.data);
  }

  Future<OrderDetailResponse> getOrderDetails({
    required int id,
  }) async {
    final response = await ApiUtil.postRequest(endPoint: purchaseHistoryDetailsUrl + "$id", shouldGetOtherHeaders: true, data: {});
    return OrderDetailResponse.fromJson(response.data);
  }

  Future<OrderItemsResponse> getOrderItems({
    int id = 0,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: purchaseHistoryItemsUrl + "$id",
      shouldGetOtherHeaders: true,
    );
    return OrderItemsResponse.fromJson(response.data);
  }

  Future<PolicyResponse> getPrivacyPolicy({
    int id = 0,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: allPrivacyPolicyUrl,
      shouldGetOtherHeaders: true,
      data: {},
    );
    return PolicyResponse.fromJson(response.data);
  }

  Future<CardOnDeliveryResponse> paymentsCardOnDelivery() async {
    final response = await ApiUtil.postRequest(
      endPoint: paymentsCardOnDeliveryUrl,
      shouldGetOtherHeaders: true,
      data: {},
    );
    return CardOnDeliveryResponse.fromJson(response.data);
  }
}
