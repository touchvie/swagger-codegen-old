//
// DefaultAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



open class DefaultAPI: APIBase {
    /**
     * enum for parameter imageSize
     */
    public enum imageSize_getCardVersion: String { 
        case RAWS_ENUMS = "'{raw=s, enum=S}'"
        case RAWM_ENUMM = "'{raw=m, enum=M}'"
        case RAWL_ENUML = "'{raw=l, enum=L}'"
    }

    /**
     Full card detail
     
     - parameter cardId: (path) Provided card ID (value of the &#39;card_id&#39; field) 
     - parameter version: (path) Provided card version (value of the &#39;version&#39; field) 
     - parameter relations: (query) Indicates if the received scene cards should contain the scene hierarchy (true) or be a flat list of the main scene items (false) (optional, default to false)
     - parameter imageSize: (query) Size of the images returned in the response (optional, default to m)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getCardVersion(cardId: String, version: String, relations: Bool? = nil, imageSize: imageSize_getCardVersion? = nil, completion: @escaping ((_ data: Card?,_ error: Error?) -> Void)) {
        getCardVersionWithRequestBuilder(cardId: cardId, version: version, relations: relations, imageSize: imageSize).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Full card detail
     - GET /cards/{cardId}/versions/{version}
     - Retrieves a full card detail, and optionally its relations to other cards
     - examples: [{contentType=application/json, example={
  "card_id" : "1f3c65b4-78fa-11e5-b7c2-0684985cbbe3",
  "version" : "09s6kqDVvt5Qj-307YB1n+Emi",
  "locale" : "es_ES",
  "title" : "Oyster Bay",
  "subtitle" : "39 Chestnut Hill Drive, Oyster Bay, Nueva York, Estados Unidos",
  "type" : "location",
  "image" : {
    "thumb" : "https://card.touchvie.com/1f3c65b4-78fa-11e5-b7c2-0684985cbbe3/1f3c65b4-78fa-11e5-b7c2-0684985cbbe3_0_thumb_m.jpg",
    "full" : "https://card.touchvie.com/1f3c65b4-78fa-11e5-b7c2-0684985cbbe3/1f3c65b4-78fa-11e5-b7c2-0684985cbbe3_0_full_m.jpg",
    "anchor_x" : 50,
    "anchor_y" : 50,
    "source" : {
      "name" : "activerain.com",
      "url" : "http://activerain.com/image_store/uploads/7/5/1/6/7/ar127500677076157.JPG",
      "disclaimer" : null,
      "image" : null
    }
  },
  "info" : [ {
    "type" : "text",
    "content_type" : "description",
    "data" : [ {
      "text" : "Oyster Bay es un pueblo ubicado en el condado de Nassau en el estado estadounidense de Nueva York. En el año 2000 tenía una población de 293.925 habitantes y una densidad poblacional de 1,087.3 personas por km². Oyster Bay es uno de los tres pueblos del condado, junto con North Hempstead y Hempstead.",
      "source" : {
        "name" : "Wikipedia",
        "url" : "https://es.wikipedia.org/wiki/Oyster_Bay_(Nueva_York)",
        "disclaimer" : null,
        "image" : "https://cdn.touchvie.com/img/sources/ico_wikipedia.png"
      }
    } ]
  }, {
    "type" : "map",
    "content_type" : "location",
    "data" : [ {
      "zoom" : 13,
      "latitude" : 40.84906,
      "longitude" : -73.56316
    } ]
  } ]
}}]
     
     - parameter cardId: (path) Provided card ID (value of the &#39;card_id&#39; field) 
     - parameter version: (path) Provided card version (value of the &#39;version&#39; field) 
     - parameter relations: (query) Indicates if the received scene cards should contain the scene hierarchy (true) or be a flat list of the main scene items (false) (optional, default to false)
     - parameter imageSize: (query) Size of the images returned in the response (optional, default to m)

     - returns: RequestBuilder<Card> 
     */
    open class func getCardVersionWithRequestBuilder(cardId: String, version: String, relations: Bool? = nil, imageSize: imageSize_getCardVersion? = nil) -> RequestBuilder<Card> {
        var path = "/cards/{cardId}/versions/{version}"
        path = path.replacingOccurrences(of: "{cardId}", with: "\(cardId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{version}", with: "\(version)", options: .literal, range: nil)
        let URLString = iOSSwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "relations": relations, 
            "image_size": imageSize?.rawValue
        ])
        

        let requestBuilder: RequestBuilder<Card>.Type = iOSSwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Channel sync availability
     
     - parameter channelIdList: (path) List of client channel IDs as a comma separated list 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getReadyChannels(channelIdList: [String], completion: @escaping ((_ data: [ChannelStatus]?,_ error: Error?) -> Void)) {
        getReadyChannelsWithRequestBuilder(channelIdList: channelIdList).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Channel sync availability
     - GET /channels/{channelIdList}/ready
     - Checks if a list of client channel identifiers are currently broadcasting synchronizable content
     - examples: [{contentType=application/json, example=[ {
  "channel_id" : "1",
  "ready" : true
}, {
  "channel_id" : "12",
  "ready" : false
} ]}]
     
     - parameter channelIdList: (path) List of client channel IDs as a comma separated list 

     - returns: RequestBuilder<[ChannelStatus]> 
     */
    open class func getReadyChannelsWithRequestBuilder(channelIdList: [String]) -> RequestBuilder<[ChannelStatus]> {
        var path = "/channels/{channelIdList}/ready"
        path = path.replacingOccurrences(of: "{channelIdList}", with: "\(channelIdList)", options: .literal, range: nil)
        let URLString = iOSSwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<[ChannelStatus]>.Type = iOSSwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Movie sync availability
     
     - parameter clientMovieIdList: (path) List of client movie IDs, provided as a comma separated list 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getReadyMovies(clientMovieIdList: [String], completion: @escaping ((_ data: [MovieStatus]?,_ error: Error?) -> Void)) {
        getReadyMoviesWithRequestBuilder(clientMovieIdList: clientMovieIdList).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Movie sync availability
     - GET /movies/{clientMovieIdList}/ready
     - Checks whether a list of client movie identifiers (Video On Demand) are available to be synchronized using the Dive API
     - examples: [{contentType=application/json, example=[ {
  "movie_id" : "57393675",
  "ready" : true
}, {
  "movie_id" : "80443833",
  "ready" : false
} ]}]
     
     - parameter clientMovieIdList: (path) List of client movie IDs, provided as a comma separated list 

     - returns: RequestBuilder<[MovieStatus]> 
     */
    open class func getReadyMoviesWithRequestBuilder(clientMovieIdList: [String]) -> RequestBuilder<[MovieStatus]> {
        var path = "/movies/{clientMovieIdList}/ready"
        path = path.replacingOccurrences(of: "{clientMovieIdList}", with: "\(clientMovieIdList)", options: .literal, range: nil)
        let URLString = iOSSwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<[MovieStatus]>.Type = iOSSwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter imageSize
     */
    public enum imageSize_getStaticChannelScene: String { 
        case RAWS_ENUMS = "'{raw=s, enum=S}'"
        case RAWM_ENUMM = "'{raw=m, enum=M}'"
        case RAWL_ENUML = "'{raw=l, enum=L}'"
    }

    /**
     One-shot channel scene
     
     - parameter channelId: (path) Client channel ID 
     - parameter relations: (query) Indicates if the received scene cards should contain the scene hierarchy (true) or be a flat list of the main scene items (false) (optional, default to false)
     - parameter imageSize: (query) Size of the images returned in the response (optional, default to m)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getStaticChannelScene(channelId: String, relations: Bool? = nil, imageSize: imageSize_getStaticChannelScene? = nil, completion: @escaping ((_ data: [Card]?,_ error: Error?) -> Void)) {
        getStaticChannelSceneWithRequestBuilder(channelId: channelId, relations: relations, imageSize: imageSize).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     One-shot channel scene
     - GET /channels/{channelId}/static
     - Retrieves the list of cards related to the content currently being broadcasted in the provided channel
     - examples: [{contentType=application/json, example=[ {
  "card_id" : "39f8b960-2eea-11e6-97ac-0684985cbbe3",
  "version" : "09s6kqDVvt5Qj-307YB1n+Emi",
  "type" : "character",
  "locale" : "en_US",
  "title" : "Lucienne's friend",
  "subtitle" : null,
  "image" : {
    "thumb" : "https://card.touchvie.com/39f8b960-2eea-11e6-97ac-0684985cbbe/39f8b960-2eea-11e6-97ac-0684985cbbe_thumb.jpg",
    "full" : "https://card.touchvie.com/39f8b960-2eea-11e6-97ac-0684985cbbe/39f8b960-2eea-11e6-97ac-0684985cbbe_full.jpg",
    "anchor_x" : 50,
    "anchor_y" : 50,
    "source" : {
      "name" : "TMDB",
      "url" : "https://www.tmdb.com/actor/245354534",
      "disclaimer" : "TMDB All rights reserved",
      "image" : "https://cdn.touchvie.com/img/sources/ico_tmdb.png"
    }
  },
  "relations" : [ {
    "type" : "single",
    "content_type" : "trivia",
    "data" : [ {
      "card_id" : "39f8b960-2eea-11e6-97ac-0684985cbbe3",
      "version" : "09s6kqDVvt5Qj-307YB1n+Emi",
      "type" : "trivia",
      "locale" : "en_US",
      "title" : "Did you know..?",
      "subtitle" : null,
      "image" : null
    } ]
  }, {
    "type" : "duple",
    "content_type" : "played_by",
    "data" : [ {
      "rel_type" : "played_by",
      "from" : {
        "card_id" : "26faf509-7422-318e-b9b7-f787474b2a90",
        "version" : "09s6kqDVvt5Qj-307YB1n+Emi",
        "type" : "movie",
        "locale" : "en_US",
        "title" : "Vicky Cristina Barcelona",
        "subtitle" : null,
        "image" : {
          "thumb" : "https://dev-img.dive.tv/26faf509-7422-318e-b9b7-f787474b2a90/26faf509-7422-318e-b9b7-f787474b2a90_0_es_ES_thumb_m.jpg",
          "full" : "https://dev-img.dive.tv/26faf509-7422-318e-b9b7-f787474b2a90/26faf509-7422-318e-b9b7-f787474b2a90_0_es_ES_full_m.jpg",
          "anchor_x" : 50,
          "anchor_y" : 50,
          "source" : null
        }
      },
      "to" : {
        "card_id" : "39f8b960-2eea-11e6-97ac-0684985cbbe3",
        "version" : "09s6kqDVvt5Qj-307YB1n+Emi",
        "type" : "person",
        "locale" : "en_US",
        "title" : "Robert DeNiro",
        "subtitle" : null,
        "image" : {
          "thumb" : "https://card.touchvie.com/39f8b960-2eea-11e6-97ac-0684985cbbe/39f8b960-2eea-11e6-97ac-0684985cbbe_thumb.jpg",
          "full" : "https://card.touchvie.com/39f8b960-2eea-11e6-97ac-0684985cbbe/39f8b960-2eea-11e6-97ac-0684985cbbe_full.jpg",
          "anchor_x" : 50,
          "anchor_y" : 50,
          "source" : {
            "name" : "TMDB",
            "url" : "https://www.tmdb.com/actor/245354534",
            "disclaimer" : "TMDB All rights reserved",
            "image" : "https://cdn.touchvie.com/img/sources/ico_tmdb.png"
          }
        }
      }
    } ]
  } ]
} ]}]
     
     - parameter channelId: (path) Client channel ID 
     - parameter relations: (query) Indicates if the received scene cards should contain the scene hierarchy (true) or be a flat list of the main scene items (false) (optional, default to false)
     - parameter imageSize: (query) Size of the images returned in the response (optional, default to m)

     - returns: RequestBuilder<[Card]> 
     */
    open class func getStaticChannelSceneWithRequestBuilder(channelId: String, relations: Bool? = nil, imageSize: imageSize_getStaticChannelScene? = nil) -> RequestBuilder<[Card]> {
        var path = "/channels/{channelId}/static"
        path = path.replacingOccurrences(of: "{channelId}", with: "\(channelId)", options: .literal, range: nil)
        let URLString = iOSSwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "relations": relations, 
            "image_size": imageSize?.rawValue
        ])
        

        let requestBuilder: RequestBuilder<[Card]>.Type = iOSSwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter imageSize
     */
    public enum imageSize_getStaticMovieScene: String { 
        case RAWS_ENUMS = "'{raw=s, enum=S}'"
        case RAWM_ENUMM = "'{raw=m, enum=M}'"
        case RAWL_ENUML = "'{raw=l, enum=L}'"
    }

    /**
     One-shot movie scene
     
     - parameter clientMovieId: (path) Client movie ID being played 
     - parameter timestamp: (path) Current movie timestamp in seconds 
     - parameter relations: (query) Indicates if the received scene cards should contain the scene hierarchy (true) or be a flat list of the main scene items (false) (optional, default to false)
     - parameter imageSize: (query) Size of the images returned in the response (optional, default to m)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getStaticMovieScene(clientMovieId: String, timestamp: Float, relations: Bool? = nil, imageSize: imageSize_getStaticMovieScene? = nil, completion: @escaping ((_ data: [Card]?,_ error: Error?) -> Void)) {
        getStaticMovieSceneWithRequestBuilder(clientMovieId: clientMovieId, timestamp: timestamp, relations: relations, imageSize: imageSize).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     One-shot movie scene
     - GET /movies/{clientMovieId}/static/{timestamp}
     - Retrieves the current list of cards related to the given movie scene
     - examples: [{contentType=application/json, example=[ {
  "card_id" : "39f8b960-2eea-11e6-97ac-0684985cbbe3",
  "version" : "09s6kqDVvt5Qj-307YB1n+Emi",
  "type" : "character",
  "locale" : "en_US",
  "title" : "Lucienne's friend",
  "subtitle" : null,
  "image" : {
    "thumb" : "https://card.touchvie.com/39f8b960-2eea-11e6-97ac-0684985cbbe/39f8b960-2eea-11e6-97ac-0684985cbbe_thumb.jpg",
    "full" : "https://card.touchvie.com/39f8b960-2eea-11e6-97ac-0684985cbbe/39f8b960-2eea-11e6-97ac-0684985cbbe_full.jpg",
    "anchor_x" : 50,
    "anchor_y" : 50,
    "source" : {
      "name" : "TMDB",
      "url" : "https://www.tmdb.com/actor/245354534",
      "disclaimer" : "TMDB All rights reserved",
      "image" : "https://cdn.touchvie.com/img/sources/ico_tmdb.png"
    }
  },
  "relations" : [ {
    "type" : "single",
    "content_type" : "trivia",
    "data" : [ {
      "card_id" : "39f8b960-2eea-11e6-97ac-0684985cbbe3",
      "version" : "09s6kqDVvt5Qj-307YB1n+Emi",
      "type" : "trivia",
      "locale" : "en_US",
      "title" : "Did you know..?",
      "subtitle" : null,
      "image" : null
    } ]
  }, {
    "type" : "duple",
    "content_type" : "played_by",
    "data" : [ {
      "rel_type" : "played_by",
      "from" : {
        "card_id" : "26faf509-7422-318e-b9b7-f787474b2a90",
        "version" : "09s6kqDVvt5Qj-307YB1n+Emi",
        "type" : "movie",
        "locale" : "en_US",
        "title" : "Vicky Cristina Barcelona",
        "subtitle" : null,
        "image" : {
          "thumb" : "https://dev-img.dive.tv/26faf509-7422-318e-b9b7-f787474b2a90/26faf509-7422-318e-b9b7-f787474b2a90_0_es_ES_thumb_m.jpg",
          "full" : "https://dev-img.dive.tv/26faf509-7422-318e-b9b7-f787474b2a90/26faf509-7422-318e-b9b7-f787474b2a90_0_es_ES_full_m.jpg",
          "anchor_x" : 50,
          "anchor_y" : 50,
          "source" : null
        }
      },
      "to" : {
        "card_id" : "39f8b960-2eea-11e6-97ac-0684985cbbe3",
        "version" : "09s6kqDVvt5Qj-307YB1n+Emi",
        "type" : "person",
        "locale" : "en_US",
        "title" : "Robert DeNiro",
        "subtitle" : null,
        "image" : {
          "thumb" : "https://card.touchvie.com/39f8b960-2eea-11e6-97ac-0684985cbbe/39f8b960-2eea-11e6-97ac-0684985cbbe_thumb.jpg",
          "full" : "https://card.touchvie.com/39f8b960-2eea-11e6-97ac-0684985cbbe/39f8b960-2eea-11e6-97ac-0684985cbbe_full.jpg",
          "anchor_x" : 50,
          "anchor_y" : 50,
          "source" : {
            "name" : "TMDB",
            "url" : "https://www.tmdb.com/actor/245354534",
            "disclaimer" : "TMDB All rights reserved",
            "image" : "https://cdn.touchvie.com/img/sources/ico_tmdb.png"
          }
        }
      }
    } ]
  } ]
} ]}]
     
     - parameter clientMovieId: (path) Client movie ID being played 
     - parameter timestamp: (path) Current movie timestamp in seconds 
     - parameter relations: (query) Indicates if the received scene cards should contain the scene hierarchy (true) or be a flat list of the main scene items (false) (optional, default to false)
     - parameter imageSize: (query) Size of the images returned in the response (optional, default to m)

     - returns: RequestBuilder<[Card]> 
     */
    open class func getStaticMovieSceneWithRequestBuilder(clientMovieId: String, timestamp: Float, relations: Bool? = nil, imageSize: imageSize_getStaticMovieScene? = nil) -> RequestBuilder<[Card]> {
        var path = "/movies/{clientMovieId}/static/{timestamp}"
        path = path.replacingOccurrences(of: "{clientMovieId}", with: "\(clientMovieId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{timestamp}", with: "\(timestamp)", options: .literal, range: nil)
        let URLString = iOSSwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "relations": relations, 
            "image_size": imageSize?.rawValue
        ])
        

        let requestBuilder: RequestBuilder<[Card]>.Type = iOSSwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter grantType
     */
    public enum grantType_postToken: String { 
        case RAWDEVICE_CREDENTIALS_ENUMDEVICE_CREDENTIALS = "'{raw=device_credentials, enum=DeviceCredentials}'"
        case RAWREFRESH_TOKEN_ENUMREFRESH_TOKEN = "'{raw=refresh_token, enum=RefreshToken}'"
    }

    /**
     Token endpoint
     
     - parameter grantType: (query) Grant type used to obtain the token. 
     - parameter deviceId: (form) Device identifier, must uniquely identify the user or device accessing the API. Required only for \&quot;device_credentials\&quot; grant type (optional)
     - parameter refreshToken: (form) Refresh token, used to issue a new token without resending client credentials. Required only for \&quot;refresh_token\&quot; grant type (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func postToken(grantType: grantType_postToken, deviceId: String? = nil, refreshToken: String? = nil, completion: @escaping ((_ data: AccessToken?,_ error: Error?) -> Void)) {
        postTokenWithRequestBuilder(grantType: grantType, deviceId: deviceId, refreshToken: refreshToken).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Token endpoint
     - POST /token
     - The token endpoint is used to obtain access tokens which allow clients to make API requests
     - examples: [{contentType=application/json, example={
  "access_token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYXBpLXNlcnZlciIsIm9hdXRoLXNlcnZlciJdLCJkZXZpY2VfaWQiOiJ0ZXN0X2RldmljZSIsImdyYW50X3R5cGUiOiJkZXZpY2VfY3JlZGVudGlhbHMiLCJzY29wZSI6WyJ0ZXN0Il0sImV4cCI6MTQ2OTE3OTgxNSwiYXV0aG9yaXRpZXMiOlsiUk9MRV9ERVZJQ0UiXSwianRpIjoiYjlkMzk2ZDYtOTQzNi00OTgzLWFlZGUtZTRkZjEwMzUzNjVlIiwiY2xpZW50X2lkIjoidGVzdF9jbGllbnQifQ.lLWJcrX1JxVRaTNnzz3GqbYYkxFLpZBNS-if47aHuiU",
  "token_type" : "bearer",
  "refresh_token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYXBpLXNlcnZlciIsIm9hdXRoLXNlcnZlciJdLCJkZXZpY2VfaWQiOiJ0ZXN0X2RldmljZSIsImdyYW50X3R5cGUiOiJkZXZpY2VfY3JlZGVudGlhbHMiLCJzY29wZSI6WyJjYXJkcyJdLCJhdGkiOiJiOWQzOTZkNi05NDM2LTQ5ODMtYWVkZS1lNGRmMTAzNTM2NWUiLCJleHAiOjE0NjkxODc5MDQsImF1dGhvcml0aWVzIjpbIlJPTEVfREVWSUNFIl0sImp0aSI6ImQzYmM4MjRkLWI4MmEtNDBkYi04MWRkLTM3YzIyZTY3YTkzNyIsImNsaWVudF9pZCI6InRlc3RfY2xpZW50In0.t-eb0HLD_xHx89sY_-k7hZ8xAT5Ewtwd2EsJDf9pkI0",
  "expires_in" : 900,
  "scope" : "device"
}}]
     
     - parameter grantType: (query) Grant type used to obtain the token. 
     - parameter deviceId: (form) Device identifier, must uniquely identify the user or device accessing the API. Required only for \&quot;device_credentials\&quot; grant type (optional)
     - parameter refreshToken: (form) Refresh token, used to issue a new token without resending client credentials. Required only for \&quot;refresh_token\&quot; grant type (optional)

     - returns: RequestBuilder<AccessToken> 
     */
    open class func postTokenWithRequestBuilder(grantType: grantType_postToken, deviceId: String? = nil, refreshToken: String? = nil) -> RequestBuilder<AccessToken> {
        let path = "/token"
        let URLString = iOSSwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "device_id": deviceId,
            "refresh_token": refreshToken
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems(values:[
            "grant_type": grantType.rawValue
        ])
        

        let requestBuilder: RequestBuilder<AccessToken>.Type = iOSSwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}