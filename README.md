# Flutter Pinelab Peripheral App Service

Flutter pinelab peripheralapp service. This application is used to run background task in pinelab device.

Using the android implementation of pinelabs device rather than the hybrid application approach. It's an honest attempt to provide a simple and easy to use interface to access the pinelabs peripheral services API.

## Pinelabs Peripheral App Request and Response

### startScan
As stated by pinelabs. 
> This API should be called when the scanner needs to be turned on and listened to indefinitely. Although the pinelabs devices needs to be connected to charing base via bluetooth connection, via functions provided by the Master application of the pinelabs device.

On successful scan this api returns a json response as :
{
    "OperationType": 3004,
    "ResponseCode" : 10,
    "ResponseMessage" : "Data Scanned Success",
    "ScannedData": "12334",
}


### stopScan
As stated by pinelabs. 
> This API should be called when the scanner needs to be turned off. Although the pinelabs devices needs to be connected to charing base via bluetooth connection, via functions provided by the Master application of the pinelabs device.

NOTE:
The Scanner must be turned off when done, to avoid interruptions in other methods.

On success this api returns a json response as :
{
    "OperationType": 3007,
    "ResponseCode" : 12,
    "ResponseMessage" : "Scanner is Reset!!",
}


## Developed by:

![Mask type](https://wsrv.nl/?url=wsrv.nl/lichtenstein.jpg&w=200&h=200&fit=cover&mask=circle)