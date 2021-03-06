// Models.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

protocol JSONEncodable {
    func encodeToJSON() -> Any
}

public enum ErrorResponse : Error {
    case Error(Int, Data?, Error)
}

open class Response<T> {
    open let statusCode: Int
    open let header: [String: String]
    open let body: T?

    public init(statusCode: Int, header: [String: String], body: T?) {
        self.statusCode = statusCode
        self.header = header
        self.body = body
    }

    public convenience init(response: HTTPURLResponse, body: T?) {
        let rawHeader = response.allHeaderFields
        var header = [String:String]()
        for (key, value) in rawHeader {
            header[key as! String] = value as? String
        }
        self.init(statusCode: response.statusCode, header: header, body: body)
    }
}

private var once = Int()
class Decoders {
    static fileprivate var decoders = Dictionary<String, ((AnyObject) -> AnyObject)>()

    static func addDecoder<T>(clazz: T.Type, decoder: @escaping ((AnyObject) -> T)) {
        let key = "\(T.self)"
        decoders[key] = { decoder($0) as AnyObject }
    }

    static func decode<T>(clazz: T.Type, discriminator: String, source: AnyObject) -> T {
        let key = discriminator;
        if let decoder = decoders[key] {
            return decoder(source) as! T
        } else {
            fatalError("Source \(source) is not convertible to type \(clazz): Maybe swagger file is insufficient")
        }
    }

    static func decode<T>(clazz: [T].Type, source: AnyObject) -> [T] {
        let array = source as! [AnyObject]
        return array.map { Decoders.decode(clazz: T.self, source: $0) }
    }

    static func decode<T, Key: Hashable>(clazz: [Key:T].Type, source: AnyObject) -> [Key:T] {
        let sourceDictionary = source as! [Key: AnyObject]
        var dictionary = [Key:T]()
        for (key, value) in sourceDictionary {
            dictionary[key] = Decoders.decode(clazz: T.self, source: value)
        }
        return dictionary
    }

    static func decode<T>(clazz: T.Type, source: AnyObject) -> T {
        initialize()
        if T.self is Int32.Type && source is NSNumber {
            return source.int32Value as! T;
        }
        if T.self is Int64.Type && source is NSNumber {
            return source.int64Value as! T;
        }
        if T.self is UUID.Type && source is String {
            return UUID(uuidString: source as! String) as! T
        }
        if source is T {
            return source as! T
        }
        if T.self is Data.Type && source is String {
            return Data(base64Encoded: source as! String) as! T
        }

        let key = "\(T.self)"
        if let decoder = decoders[key] {
           return decoder(source) as! T
        } else {
            fatalError("Source \(source) is not convertible to type \(clazz): Maybe swagger file is insufficient")
        }
    }

    static func decodeOptional<T>(clazz: T.Type, source: AnyObject?) -> T? {
        if source is NSNull {
            return nil
        }
        return source.map { (source: AnyObject) -> T in
            Decoders.decode(clazz: clazz, source: source)
        }
    }

    static func decodeOptional<T>(clazz: [T].Type, source: AnyObject?) -> [T]? {
        if source is NSNull {
            return nil
        }
        return source.map { (someSource: AnyObject) -> [T] in
            Decoders.decode(clazz: clazz, source: someSource)
        }
    }

    static func decodeOptional<T, Key: Hashable>(clazz: [Key:T].Type, source: AnyObject?) -> [Key:T]? {
        if source is NSNull {
            return nil
        }
        return source.map { (someSource: AnyObject) -> [Key:T] in
            Decoders.decode(clazz: clazz, source: someSource)
        }
    }

    private static var __once: () = {
        let formatters = [
            "yyyy-MM-dd",
            "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
            "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
            "yyyy-MM-dd'T'HH:mm:ss'Z'",
            "yyyy-MM-dd'T'HH:mm:ss.SSS",
            "yyyy-MM-dd HH:mm:ss"
        ].map { (format: String) -> DateFormatter in
            let formatter = DateFormatter()
            formatter.dateFormat = format
            return formatter
        }
        // Decoder for Date
        Decoders.addDecoder(clazz: Date.self) { (source: AnyObject) -> Date in
           if let sourceString = source as? String {
                for formatter in formatters {
                    if let date = formatter.date(from: sourceString) {
                        return date
                    }
                }
            }
            if let sourceInt = source as? Int64 {
                // treat as a java date
                return Date(timeIntervalSince1970: Double(sourceInt / 1000) )
            }
            fatalError("formatter failed to parse \(source)")
        } 

        // Decoder for [AccessToken]
        Decoders.addDecoder(clazz: [AccessToken].self) { (source: AnyObject) -> [AccessToken] in
            return Decoders.decode(clazz: [AccessToken].self, source: source)
        }
        // Decoder for AccessToken
        Decoders.addDecoder(clazz: AccessToken.self) { (source: AnyObject) -> AccessToken in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = AccessToken()
            instance.accessToken = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["access_token"] as AnyObject?)
            if let tokenType = sourceDictionary["token_type"] as? String { 
                instance.tokenType = AccessToken.TokenType(rawValue: (tokenType))
            }
            
            instance.refreshToken = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["refresh_token"] as AnyObject?)
            instance.expiresIn = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["expires_in"] as AnyObject?)
            if let scope = sourceDictionary["scope"] as? String { 
                instance.scope = AccessToken.Scope(rawValue: (scope))
            }
            
            return instance
        }


        // Decoder for [AuthError]
        Decoders.addDecoder(clazz: [AuthError].self) { (source: AnyObject) -> [AuthError] in
            return Decoders.decode(clazz: [AuthError].self, source: source)
        }
        // Decoder for AuthError
        Decoders.addDecoder(clazz: AuthError.self) { (source: AnyObject) -> AuthError in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = AuthError()
            instance.error = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["error"] as AnyObject?)
            instance.errorDescription = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["error_description"] as AnyObject?)
            return instance
        }


        // Decoder for [AwardData]
        Decoders.addDecoder(clazz: [AwardData].self) { (source: AnyObject) -> [AwardData] in
            return Decoders.decode(clazz: [AwardData].self, source: source)
        }
        // Decoder for AwardData
        Decoders.addDecoder(clazz: AwardData.self) { (source: AnyObject) -> AwardData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = AwardData()
            instance.title = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["title"] as AnyObject?)
            instance.value = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["value"] as AnyObject?)
            return instance
        }


        // Decoder for [Awards]
        Decoders.addDecoder(clazz: [Awards].self) { (source: AnyObject) -> [Awards] in
            return Decoders.decode(clazz: [Awards].self, source: source)
        }
        // Decoder for Awards
        Decoders.addDecoder(clazz: Awards.self) { (source: AnyObject) -> Awards in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Awards()
            if let typeOfContainer = sourceDictionary["typeOfContainer"] as? String { 
                instance.typeOfContainer = Awards.TypeOfContainer(rawValue: (typeOfContainer))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Awards.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [AwardsData]
        Decoders.addDecoder(clazz: [AwardsData].self) { (source: AnyObject) -> [AwardsData] in
            return Decoders.decode(clazz: [AwardsData].self, source: source)
        }
        // Decoder for AwardsData
        Decoders.addDecoder(clazz: AwardsData.self) { (source: AnyObject) -> AwardsData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = AwardsData()
            instance.title = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["title"] as AnyObject?)
            instance.nominee = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["nominee"] as AnyObject?)
            instance.winner = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["winner"] as AnyObject?)
            return instance
        }


        // Decoder for [Card]
        Decoders.addDecoder(clazz: [Card].self) { (source: AnyObject) -> [Card] in
            return Decoders.decode(clazz: [Card].self, source: source)
        }
        // Decoder for Card
        Decoders.addDecoder(clazz: Card.self) { (source: AnyObject) -> Card in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Card()
            instance.cardId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["card_id"] as AnyObject?)
            instance.version = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["version"] as AnyObject?)
            if let typeOfCard = sourceDictionary["typeOfCard"] as? String { 
                instance.typeOfCard = Card.TypeOfCard(rawValue: (typeOfCard))
            }
            
            instance.locale = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["locale"] as AnyObject?)
            instance.title = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["title"] as AnyObject?)
            instance.subtitle = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["subtitle"] as AnyObject?)
            instance.image = Decoders.decodeOptional(clazz: ImageData.self, source: sourceDictionary["image"] as AnyObject?)
            instance.info = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["info"] as AnyObject?)
            instance.relations = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["relations"] as AnyObject?)
            return instance
        }


        // Decoder for [CardContainer]
        Decoders.addDecoder(clazz: [CardContainer].self) { (source: AnyObject) -> [CardContainer] in
            return Decoders.decode(clazz: [CardContainer].self, source: source)
        }
        // Decoder for CardContainer
        Decoders.addDecoder(clazz: CardContainer.self) { (source: AnyObject) -> CardContainer in
            let sourceDictionary = source as! [AnyHashable: Any]
            // Check discriminator to support inheritance
            if let discriminator = sourceDictionary["type"] as? String, discriminator != "CardContainer"{
                return Decoders.decode(clazz: CardContainer.self, discriminator: discriminator, source: source)
            }

            let instance = CardContainer()
            if let typeOfContainer = sourceDictionary["typeOfContainer"] as? String { 
                instance.typeOfContainer = CardContainer.TypeOfContainer(rawValue: (typeOfContainer))
            }
            
            return instance
        }


        // Decoder for [Catalog]
        Decoders.addDecoder(clazz: [Catalog].self) { (source: AnyObject) -> [Catalog] in
            return Decoders.decode(clazz: [Catalog].self, source: source)
        }
        // Decoder for Catalog
        Decoders.addDecoder(clazz: Catalog.self) { (source: AnyObject) -> Catalog in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Catalog()
            if let typeOfContainer = sourceDictionary["typeOfContainer"] as? String { 
                instance.typeOfContainer = Catalog.TypeOfContainer(rawValue: (typeOfContainer))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Catalog.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [CatalogData]
        Decoders.addDecoder(clazz: [CatalogData].self) { (source: AnyObject) -> [CatalogData] in
            return Decoders.decode(clazz: [CatalogData].self, source: source)
        }
        // Decoder for CatalogData
        Decoders.addDecoder(clazz: CatalogData.self) { (source: AnyObject) -> CatalogData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = CatalogData()
            instance.backgroundImage = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["background_image"] as AnyObject?)
            instance.director = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["director"] as AnyObject?)
            instance.genres = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["genres"] as AnyObject?)
            instance.originalTitle = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["original_title"] as AnyObject?)
            instance.runtime = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["runtime"] as AnyObject?)
            instance.year = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["year"] as AnyObject?)
            instance.chapterIndex = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["chapter_index"] as AnyObject?)
            instance.seasonIndex = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["season_index"] as AnyObject?)
            instance.sync = Decoders.decodeOptional(clazz: CatalogSync.self, source: sourceDictionary["sync"] as AnyObject?)
            return instance
        }


        // Decoder for [CatalogSync]
        Decoders.addDecoder(clazz: [CatalogSync].self) { (source: AnyObject) -> [CatalogSync] in
            return Decoders.decode(clazz: [CatalogSync].self, source: source)
        }
        // Decoder for CatalogSync
        Decoders.addDecoder(clazz: CatalogSync.self) { (source: AnyObject) -> CatalogSync in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = CatalogSync()
            instance.isSynchronizable = Decoders.decodeOptional(clazz: Bool.self, source: sourceDictionary["is_synchronizable"] as AnyObject?)
            return instance
        }


        // Decoder for [ChannelStatus]
        Decoders.addDecoder(clazz: [ChannelStatus].self) { (source: AnyObject) -> [ChannelStatus] in
            return Decoders.decode(clazz: [ChannelStatus].self, source: source)
        }
        // Decoder for ChannelStatus
        Decoders.addDecoder(clazz: ChannelStatus.self) { (source: AnyObject) -> ChannelStatus in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = ChannelStatus()
            instance.channelId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["channel_id"] as AnyObject?)
            instance.ready = Decoders.decodeOptional(clazz: Bool.self, source: sourceDictionary["ready"] as AnyObject?)
            return instance
        }


        // Decoder for [Duple]
        Decoders.addDecoder(clazz: [Duple].self) { (source: AnyObject) -> [Duple] in
            return Decoders.decode(clazz: [Duple].self, source: source)
        }
        // Decoder for Duple
        Decoders.addDecoder(clazz: Duple.self) { (source: AnyObject) -> Duple in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Duple()
            if let typeOfRelation = sourceDictionary["typeOfRelation"] as? String { 
                instance.typeOfRelation = Duple.TypeOfRelation(rawValue: (typeOfRelation))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Duple.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [DupleData]
        Decoders.addDecoder(clazz: [DupleData].self) { (source: AnyObject) -> [DupleData] in
            return Decoders.decode(clazz: [DupleData].self, source: source)
        }
        // Decoder for DupleData
        Decoders.addDecoder(clazz: DupleData.self) { (source: AnyObject) -> DupleData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = DupleData()
            instance.relType = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["rel_type"] as AnyObject?)
            instance.from = Decoders.decodeOptional(clazz: Card.self, source: sourceDictionary["from"] as AnyObject?)
            instance.to = Decoders.decodeOptional(clazz: Card.self, source: sourceDictionary["to"] as AnyObject?)
            return instance
        }


        // Decoder for [Image]
        Decoders.addDecoder(clazz: [Image].self) { (source: AnyObject) -> [Image] in
            return Decoders.decode(clazz: [Image].self, source: source)
        }
        // Decoder for Image
        Decoders.addDecoder(clazz: Image.self) { (source: AnyObject) -> Image in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Image()
            if let typeOfContainer = sourceDictionary["typeOfContainer"] as? String { 
                instance.typeOfContainer = Image.TypeOfContainer(rawValue: (typeOfContainer))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Image.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [ImageData]
        Decoders.addDecoder(clazz: [ImageData].self) { (source: AnyObject) -> [ImageData] in
            return Decoders.decode(clazz: [ImageData].self, source: source)
        }
        // Decoder for ImageData
        Decoders.addDecoder(clazz: ImageData.self) { (source: AnyObject) -> ImageData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = ImageData()
            instance.thumb = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["thumb"] as AnyObject?)
            instance.full = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["full"] as AnyObject?)
            instance.anchorX = Decoders.decodeOptional(clazz: Double.self, source: sourceDictionary["anchor_x"] as AnyObject?)
            instance.anchorY = Decoders.decodeOptional(clazz: Double.self, source: sourceDictionary["anchor_y"] as AnyObject?)
            instance.source = Decoders.decodeOptional(clazz: SourceData.self, source: sourceDictionary["source"] as AnyObject?)
            return instance
        }


        // Decoder for [Link]
        Decoders.addDecoder(clazz: [Link].self) { (source: AnyObject) -> [Link] in
            return Decoders.decode(clazz: [Link].self, source: source)
        }
        // Decoder for Link
        Decoders.addDecoder(clazz: Link.self) { (source: AnyObject) -> Link in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Link()
            if let typeOfContainer = sourceDictionary["typeOfContainer"] as? String { 
                instance.typeOfContainer = Link.TypeOfContainer(rawValue: (typeOfContainer))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Link.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [LinkData]
        Decoders.addDecoder(clazz: [LinkData].self) { (source: AnyObject) -> [LinkData] in
            return Decoders.decode(clazz: [LinkData].self, source: source)
        }
        // Decoder for LinkData
        Decoders.addDecoder(clazz: LinkData.self) { (source: AnyObject) -> LinkData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = LinkData()
            instance.url = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["url"] as AnyObject?)
            instance.source = Decoders.decodeOptional(clazz: SourceData.self, source: sourceDictionary["source"] as AnyObject?)
            return instance
        }


        // Decoder for [Listing]
        Decoders.addDecoder(clazz: [Listing].self) { (source: AnyObject) -> [Listing] in
            return Decoders.decode(clazz: [Listing].self, source: source)
        }
        // Decoder for Listing
        Decoders.addDecoder(clazz: Listing.self) { (source: AnyObject) -> Listing in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Listing()
            if let typeOfContainer = sourceDictionary["typeOfContainer"] as? String { 
                instance.typeOfContainer = Listing.TypeOfContainer(rawValue: (typeOfContainer))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Listing.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [ListingData]
        Decoders.addDecoder(clazz: [ListingData].self) { (source: AnyObject) -> [ListingData] in
            return Decoders.decode(clazz: [ListingData].self, source: source)
        }
        // Decoder for ListingData
        Decoders.addDecoder(clazz: ListingData.self) { (source: AnyObject) -> ListingData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = ListingData()
            instance.text = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["text"] as AnyObject?)
            instance.value = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["value"] as AnyObject?)
            return instance
        }


        // Decoder for [Map]
        Decoders.addDecoder(clazz: [Map].self) { (source: AnyObject) -> [Map] in
            return Decoders.decode(clazz: [Map].self, source: source)
        }
        // Decoder for Map
        Decoders.addDecoder(clazz: Map.self) { (source: AnyObject) -> Map in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Map()
            if let typeOfContainer = sourceDictionary["typeOfContainer"] as? String { 
                instance.typeOfContainer = Map.TypeOfContainer(rawValue: (typeOfContainer))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Map.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [MapData]
        Decoders.addDecoder(clazz: [MapData].self) { (source: AnyObject) -> [MapData] in
            return Decoders.decode(clazz: [MapData].self, source: source)
        }
        // Decoder for MapData
        Decoders.addDecoder(clazz: MapData.self) { (source: AnyObject) -> MapData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = MapData()
            instance.latitude = Decoders.decodeOptional(clazz: Float.self, source: sourceDictionary["latitude"] as AnyObject?)
            instance.longitude = Decoders.decodeOptional(clazz: Float.self, source: sourceDictionary["longitude"] as AnyObject?)
            instance.zoom = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["zoom"] as AnyObject?)
            return instance
        }


        // Decoder for [MovieStatus]
        Decoders.addDecoder(clazz: [MovieStatus].self) { (source: AnyObject) -> [MovieStatus] in
            return Decoders.decode(clazz: [MovieStatus].self, source: source)
        }
        // Decoder for MovieStatus
        Decoders.addDecoder(clazz: MovieStatus.self) { (source: AnyObject) -> MovieStatus in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = MovieStatus()
            instance.movieId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["movie_id"] as AnyObject?)
            instance.ready = Decoders.decodeOptional(clazz: Bool.self, source: sourceDictionary["ready"] as AnyObject?)
            return instance
        }


        // Decoder for [Rating]
        Decoders.addDecoder(clazz: [Rating].self) { (source: AnyObject) -> [Rating] in
            return Decoders.decode(clazz: [Rating].self, source: source)
        }
        // Decoder for Rating
        Decoders.addDecoder(clazz: Rating.self) { (source: AnyObject) -> Rating in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Rating()
            if let typeOfContainer = sourceDictionary["typeOfContainer"] as? String { 
                instance.typeOfContainer = Rating.TypeOfContainer(rawValue: (typeOfContainer))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Rating.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [RatingData]
        Decoders.addDecoder(clazz: [RatingData].self) { (source: AnyObject) -> [RatingData] in
            return Decoders.decode(clazz: [RatingData].self, source: source)
        }
        // Decoder for RatingData
        Decoders.addDecoder(clazz: RatingData.self) { (source: AnyObject) -> RatingData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = RatingData()
            instance.value = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["value"] as AnyObject?)
            instance.source = Decoders.decodeOptional(clazz: SourceData.self, source: sourceDictionary["source"] as AnyObject?)
            return instance
        }


        // Decoder for [RelationModule]
        Decoders.addDecoder(clazz: [RelationModule].self) { (source: AnyObject) -> [RelationModule] in
            return Decoders.decode(clazz: [RelationModule].self, source: source)
        }
        // Decoder for RelationModule
        Decoders.addDecoder(clazz: RelationModule.self) { (source: AnyObject) -> RelationModule in
            let sourceDictionary = source as! [AnyHashable: Any]
            // Check discriminator to support inheritance
            if let discriminator = sourceDictionary["type"] as? String, discriminator != "RelationModule"{
                return Decoders.decode(clazz: RelationModule.self, discriminator: discriminator, source: source)
            }

            let instance = RelationModule()
            if let typeOfRelation = sourceDictionary["typeOfRelation"] as? String { 
                instance.typeOfRelation = RelationModule.TypeOfRelation(rawValue: (typeOfRelation))
            }
            
            return instance
        }


        // Decoder for [Seasons]
        Decoders.addDecoder(clazz: [Seasons].self) { (source: AnyObject) -> [Seasons] in
            return Decoders.decode(clazz: [Seasons].self, source: source)
        }
        // Decoder for Seasons
        Decoders.addDecoder(clazz: Seasons.self) { (source: AnyObject) -> Seasons in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Seasons()
            if let typeOfContainer = sourceDictionary["typeOfContainer"] as? String { 
                instance.typeOfContainer = Seasons.TypeOfContainer(rawValue: (typeOfContainer))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Seasons.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [SeasonsChapters]
        Decoders.addDecoder(clazz: [SeasonsChapters].self) { (source: AnyObject) -> [SeasonsChapters] in
            return Decoders.decode(clazz: [SeasonsChapters].self, source: source)
        }
        // Decoder for SeasonsChapters
        Decoders.addDecoder(clazz: SeasonsChapters.self) { (source: AnyObject) -> SeasonsChapters in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = SeasonsChapters()
            instance.chapterIndex = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["chapter_index"] as AnyObject?)
            instance.cardId = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["card_id"] as AnyObject?)
            return instance
        }


        // Decoder for [SeasonsData]
        Decoders.addDecoder(clazz: [SeasonsData].self) { (source: AnyObject) -> [SeasonsData] in
            return Decoders.decode(clazz: [SeasonsData].self, source: source)
        }
        // Decoder for SeasonsData
        Decoders.addDecoder(clazz: SeasonsData.self) { (source: AnyObject) -> SeasonsData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = SeasonsData()
            instance.seasonIndex = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["season_index"] as AnyObject?)
            instance.creators = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["creators"] as AnyObject?)
            instance.image = Decoders.decodeOptional(clazz: ImageData.self, source: sourceDictionary["image"] as AnyObject?)
            instance.year = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["year"] as AnyObject?)
            instance.chapters = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["chapters"] as AnyObject?)
            return instance
        }


        // Decoder for [Single]
        Decoders.addDecoder(clazz: [Single].self) { (source: AnyObject) -> [Single] in
            return Decoders.decode(clazz: [Single].self, source: source)
        }
        // Decoder for Single
        Decoders.addDecoder(clazz: Single.self) { (source: AnyObject) -> Single in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Single()
            if let typeOfRelation = sourceDictionary["typeOfRelation"] as? String { 
                instance.typeOfRelation = Single.TypeOfRelation(rawValue: (typeOfRelation))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Single.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [SourceData]
        Decoders.addDecoder(clazz: [SourceData].self) { (source: AnyObject) -> [SourceData] in
            return Decoders.decode(clazz: [SourceData].self, source: source)
        }
        // Decoder for SourceData
        Decoders.addDecoder(clazz: SourceData.self) { (source: AnyObject) -> SourceData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = SourceData()
            instance.name = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["name"] as AnyObject?)
            instance.url = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["url"] as AnyObject?)
            instance.disclaimer = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["disclaimer"] as AnyObject?)
            instance.image = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["image"] as AnyObject?)
            return instance
        }


        // Decoder for [Text]
        Decoders.addDecoder(clazz: [Text].self) { (source: AnyObject) -> [Text] in
            return Decoders.decode(clazz: [Text].self, source: source)
        }
        // Decoder for Text
        Decoders.addDecoder(clazz: Text.self) { (source: AnyObject) -> Text in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Text()
            if let typeOfContainer = sourceDictionary["typeOfContainer"] as? String { 
                instance.typeOfContainer = Text.TypeOfContainer(rawValue: (typeOfContainer))
            }
            
            if let contentType = sourceDictionary["content_type"] as? String { 
                instance.contentType = Text.ContentType(rawValue: (contentType))
            }
            
            instance.data = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["data"] as AnyObject?)
            return instance
        }


        // Decoder for [TextData]
        Decoders.addDecoder(clazz: [TextData].self) { (source: AnyObject) -> [TextData] in
            return Decoders.decode(clazz: [TextData].self, source: source)
        }
        // Decoder for TextData
        Decoders.addDecoder(clazz: TextData.self) { (source: AnyObject) -> TextData in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = TextData()
            instance.text = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["text"] as AnyObject?)
            instance.source = Decoders.decodeOptional(clazz: SourceData.self, source: sourceDictionary["source"] as AnyObject?)
            return instance
        }
    }()

    static fileprivate func initialize() {
        _ = Decoders.__once
    }
}
