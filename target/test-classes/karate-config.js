function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiURL: 'https://api.realworld.io/api/'
    
  }
  if (env == 'dev') {
    config.userName = 'karate8108@karate.com';
    config.userPasskey = 'karate12';
  } else if (env == 'e2e') {
    // customize
  }

  
  var accessToken =  karate.callSingle('classpath:helper/CreateToken.feature',config).authToken
  karate.configure('headers',{Authorization: 'Token '+accessToken})
  return config;
}