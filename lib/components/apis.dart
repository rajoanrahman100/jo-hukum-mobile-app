
///base url
const baseUrl="https://api-login.jo-hukum.com/api/";
const analyticsUrl="https://api-analytics.jo-hukum.com/";

///auth apis
const signIn=baseUrl+"auth/login";
const resetPass=baseUrl+"/users/reset-password/";
const forgetPass=baseUrl+"/users/reset-forgotten-password/";
const requestOtp=baseUrl+"otp/generate";
const verifyOtp=baseUrl+"otp/verify";
const socialLogIn=baseUrl+"auth/social-login";
const sendInfo=baseUrl+"users";
const categoryApi="https://api-backend.jo-hukum.com/consumers_api/categories";
const elasticSearch="https://search-es.jo-hukum.com/slug/_search";
const individualBusiness="https://api-backend.jo-hukum.com/consumers_api/business_data/";
const allDivisions="https://api-backend.jo-hukum.com/api/businesses/locations?location_type=7";
const allCity="https://api-backend.jo-hukum.com/api/businesses/locations?location_type=2&parent=";
const allThana="https://api-backend.jo-hukum.com/api/businesses/locations?location_type=4&parent=";
const paymentMethod="https://api-backend.jo-hukum.com/api/businesses/payment_methods?search=";
const postReview="https://api-backend.jo-hukum.com/consumers_api/business_data/";
const keyword="https://api-backend.jo-hukum.com/api/businesses/categories";
const businessType="https://api-backend.jo-hukum.com/consumers_api/business_types";
const addBusiness="https://api-backend.jo-hukum.com/consumers_api/business_data";
const uploadImagesAPi="https://api-backend.jo-hukum.com/consumers_api/uploads/photos";

///Business Analytics APi
const visitorsApi=analyticsUrl+"page-analytics?url=http://nuxtjh.local/single/";
const ctaClickApi=analyticsUrl+"business-cta-analytics/";
const browseByDeviceApi=analyticsUrl+"page-analytics/browsed-by-devices?url=http://nuxtjh.local/single/";
const regionsVisitApi=analyticsUrl+"page-analytics/visited-from-states?url=http://nuxtjh.local/single/";
const searchLineChartApi=analyticsUrl+"page-analytics/visited-in-month?url=https://jh-nuxt-edwa.jo-hukum.com/single/";
const stayingTimeApi=analyticsUrl+"page-analytics/avg-visit-duration?url=https://jh-nuxt-edwa.jo-hukum.com/single/";
const reviewCountApi="https://api-backend.jo-hukum.com/consumers_api/business_data/";
const singleBusinessApi="https://api-backend.jo-hukum.com/consumers_api/business_data/";
const myBusinessApi="https://api-backend.jo-hukum.com/consumers_api/business_data/my_businesses";
const updateBusinessApi="https://api-backend.jo-hukum.com/consumers_api/business_data/";

///Session IP
const sessionIP="https://api-analytics.jo-hukum.com/sessions";