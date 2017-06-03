# WatSwift
Waterloo OpenData Client in Swift. WatSwift supports all OpenData endpoints, and processes all returned data in JSON.

## Getting Started

### Installation
WatSwift can be installed by simply dragging the WatSwift Xcode Project (`.xcodeproj`) into your own project, and adding the `WatSwift` framework as an embedded framework.

### Usage

Before you begin to use `WatSwift`, set your API key:
```swift
WatSwift.apiKey = "------YOUR API KEY--------"
```

The rest is fairly self explanatory. Each endpoint is categorized by their own struct in `WatSwift`. For example, if you wanted to access the current week's menu:
```swift
WatSwift.FoodServices.menu { response in
  // metadata returned by the API, wrapped in a Metadata struct
  let metadata = response.metadata
  // Data returned by the API in JSON format.
  let data: JSON = response.data
  // ...
}
```

If you wanted to get the atms around the campus:
```swift
WatSwift.PointsOfInterest.campusPoi(ofType: .atms) { response in
  // ...
}
```

### JSON Handling

To make accessing data returned by the OpenData API simple, WatSwift provides a JSON wrapper which allows the you to interact with similarly to a dictionary. Unlike a regular Dictionary, you do not need to lots of option chaining, allowing your code to be much cleaner and easier to read.

Here's an example of how you would access the name of the first food service outlet:
```swift
if let outletName = response.data["outlets"][0]["outlet_name"].string {
  // outletName
}
```

The JSON wrapper is courtesy of [mattdonnelly's Swifter: a Twitter Framework written in Swift.](https://github.com/mattdonnelly/Swifter).

## Obtaining an API Key
You need a valid API key to access the uWaterloo OpenData API; you can [get one here](https://api.uwaterloo.ca).

## Official API + Documentation
The Official API Documentation can be found on [Waterloo's API Documentation Repo ](https://github.com/uWaterloo/api-documentation).

## License
WatSwift is licensed under the MIT License. See the LICENSE file for more information.

Waterloo OpenData is licensed under [ODL (Open Data License) Agreement](https://uwaterloo.ca/open-data/university-waterloo-open-data-license-agreement-v1)
