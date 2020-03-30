## Health Challenge Description

In this project you will find a Model View Presenter architecture, two different data models one for services parsing an general usage and the other for database storage. The local database is using Realm.io engine.

In order to use this project, please do a

```    
carthage update --platform ios    
```    

This will download the dependencies, which are:
 - Alamofire for networking comunication
 - Realm for local database 
 - and lottie for animations

Once the project is up an running you should see something like this:

| Splash Screen | HealthKit Screen |
| ------------- | ------------- |
|<img src="https://github.com/rafael-amezquita/HealthChallenge/blob/master/splash%20screen.png?raw=true" width=300>|<img src="https://github.com/rafael-amezquita/HealthChallenge/blob/master/healthkit%20screen.png?raw=true" width=300>|


| Goals Screen | Goal Details Screen |
| ------------- | ------------- |
|<img src="https://github.com/rafael-amezquita/HealthChallenge/blob/master/goals%20sceen.png?raw=true" width=300>|<img src="https://github.com/rafael-amezquita/HealthChallenge/blob/master/goal%20details.png?raw=true" width=300>|

and finally a view only visible on device at least you have a full medical record to simulate set for testing on simulator

| Steps Screen |
| ------------- |
|<img src="https://github.com/rafael-amezquita/HealthChallenge/blob/master/Steps%20Screen.jpeg?raw=true" width=300>|
