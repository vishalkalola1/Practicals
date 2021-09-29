// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ArtistsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Artists($search: String!, $first: Int!, $after: String) {
      search {
        __typename
        artists(query: $search, first: $first, after: $after) {
          __typename
          nodes {
            __typename
            ...ArtistBasicFragment
          }
          pageInfo {
            __typename
            hasNextPage
            hasPreviousPage
            startCursor
            endCursor
          }
          totalCount
        }
      }
    }
    """

  public let operationName: String = "Artists"

  public var queryDocument: String { return operationDefinition.appending("\n" + ArtistBasicFragment.fragmentDefinition) }

  public var search: String
  public var first: Int
  public var after: String?

  public init(search: String, first: Int, after: String? = nil) {
    self.search = search
    self.first = first
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["search": search, "first": first, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("search", type: .object(Search.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.flatMap { (value: Search) -> ResultMap in value.resultMap }])
    }

    /// Search for MusicBrainz entities using Lucene query syntax.
    public var search: Search? {
      get {
        return (resultMap["search"] as? ResultMap).flatMap { Search(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SearchQuery"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("artists", arguments: ["query": GraphQLVariable("search"), "first": GraphQLVariable("first"), "after": GraphQLVariable("after")], type: .object(Artist.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(artists: Artist? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchQuery", "artists": artists.flatMap { (value: Artist) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Search for artist entities matching the given query.
      public var artists: Artist? {
        get {
          return (resultMap["artists"] as? ResultMap).flatMap { Artist(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "artists")
        }
      }

      public struct Artist: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ArtistConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
            GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
            GraphQLField("totalCount", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil, pageInfo: PageInfo, totalCount: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "ArtistConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap, "totalCount": totalCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes in the connection (without going through the
        /// `edges` field).
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        /// A count of the total number of items in this connection,
        /// ignoring pagination.
        public var totalCount: Int? {
          get {
            return resultMap["totalCount"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Artist"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("disambiguation", type: .scalar(String.self)),
              GraphQLField("area", type: .object(Area.selections)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("recordings", arguments: ["first": 15, "after": nil], type: .object(Recording.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil, disambiguation: String? = nil, area: Area? = nil, type: String? = nil, recordings: Recording? = nil) {
            self.init(unsafeResultMap: ["__typename": "Artist", "id": id, "name": name, "disambiguation": disambiguation, "area": area.flatMap { (value: Area) -> ResultMap in value.resultMap }, "type": type, "recordings": recordings.flatMap { (value: Recording) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The official name of the entity.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// A comment used to help distinguish identically named entitites.
          public var disambiguation: String? {
            get {
              return resultMap["disambiguation"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "disambiguation")
            }
          }

          /// The area with which an artist is primarily identified. It
          /// is often, but not always, its birth/formation country.
          public var area: Area? {
            get {
              return (resultMap["area"] as? ResultMap).flatMap { Area(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "area")
            }
          }

          /// Whether an artist is a person, a group, or something else.
          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          /// A list of recordings linked to this entity.
          public var recordings: Recording? {
            get {
              return (resultMap["recordings"] as? ResultMap).flatMap { Recording(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "recordings")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var artistBasicFragment: ArtistBasicFragment {
              get {
                return ArtistBasicFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }

          public struct Area: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Area"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Area", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of an object
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The official name of the entity.
            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct Recording: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["RecordingConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("nodes", type: .list(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(nodes: [Node?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "RecordingConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of nodes in the connection (without going through the
            /// `edges` field).
            public var nodes: [Node?]? {
              get {
                return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Recording"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("title", type: .scalar(String.self)),
                  GraphQLField("length", type: .scalar(String.self)),
                  GraphQLField("video", type: .scalar(Bool.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, title: String? = nil, length: String? = nil, video: Bool? = nil) {
                self.init(unsafeResultMap: ["__typename": "Recording", "id": id, "title": title, "length": length, "video": video])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The ID of an object
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The official title of the entity.
              public var title: String? {
                get {
                  return resultMap["title"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "title")
                }
              }

              /// An approximation to the length of the recording, calculated
              /// from the lengths of the tracks using it.
              public var length: String? {
                get {
                  return resultMap["length"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "length")
                }
              }

              /// Whether this is a video recording.
              public var video: Bool? {
                get {
                  return resultMap["video"] as? Bool
                }
                set {
                  resultMap.updateValue(newValue, forKey: "video")
                }
              }
            }
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PageInfo"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("startCursor", type: .scalar(String.self)),
              GraphQLField("endCursor", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil, endCursor: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor, "endCursor": endCursor])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return resultMap["hasNextPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }

          /// When paginating backwards, are there more items?
          public var hasPreviousPage: Bool {
            get {
              return resultMap["hasPreviousPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasPreviousPage")
            }
          }

          /// When paginating backwards, the cursor to continue.
          public var startCursor: String? {
            get {
              return resultMap["startCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "startCursor")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }
        }
      }
    }
  }
}

public final class ArtistQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Artist($id: ID!) {
      node(id: $id) {
        __typename
        ...ArtistDetailsFragment
      }
    }
    """

  public let operationName: String = "Artist"

  public var queryDocument: String { return operationDefinition.appending("\n" + ArtistDetailsFragment.fragmentDefinition) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("node", arguments: ["id": GraphQLVariable("id")], type: .object(Node.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(node: Node? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
    }

    /// Fetches an object given its ID
    public var node: Node? {
      get {
        return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "node")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Area", "Artist", "Recording", "Release", "Disc", "Label", "Collection", "Event", "Instrument", "Place", "ReleaseGroup", "Series", "Work", "URL"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["Artist": AsArtist.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeArea() -> Node {
        return Node(unsafeResultMap: ["__typename": "Area"])
      }

      public static func makeRecording() -> Node {
        return Node(unsafeResultMap: ["__typename": "Recording"])
      }

      public static func makeRelease() -> Node {
        return Node(unsafeResultMap: ["__typename": "Release"])
      }

      public static func makeDisc() -> Node {
        return Node(unsafeResultMap: ["__typename": "Disc"])
      }

      public static func makeLabel() -> Node {
        return Node(unsafeResultMap: ["__typename": "Label"])
      }

      public static func makeCollection() -> Node {
        return Node(unsafeResultMap: ["__typename": "Collection"])
      }

      public static func makeEvent() -> Node {
        return Node(unsafeResultMap: ["__typename": "Event"])
      }

      public static func makeInstrument() -> Node {
        return Node(unsafeResultMap: ["__typename": "Instrument"])
      }

      public static func makePlace() -> Node {
        return Node(unsafeResultMap: ["__typename": "Place"])
      }

      public static func makeReleaseGroup() -> Node {
        return Node(unsafeResultMap: ["__typename": "ReleaseGroup"])
      }

      public static func makeSeries() -> Node {
        return Node(unsafeResultMap: ["__typename": "Series"])
      }

      public static func makeWork() -> Node {
        return Node(unsafeResultMap: ["__typename": "Work"])
      }

      public static func makeURL() -> Node {
        return Node(unsafeResultMap: ["__typename": "URL"])
      }

      public static func makeArtist(id: GraphQLID, name: String? = nil, disambiguation: String? = nil, sortName: String? = nil, country: String? = nil, gender: String? = nil, type: String? = nil, lifeSpan: AsArtist.LifeSpan? = nil, tags: AsArtist.Tag? = nil, theAudioDb: AsArtist.TheAudioDb? = nil, area: AsArtist.Area? = nil, rating: AsArtist.Rating? = nil, recordings: AsArtist.Recording? = nil) -> Node {
        return Node(unsafeResultMap: ["__typename": "Artist", "id": id, "name": name, "disambiguation": disambiguation, "sortName": sortName, "country": country, "gender": gender, "type": type, "lifeSpan": lifeSpan.flatMap { (value: AsArtist.LifeSpan) -> ResultMap in value.resultMap }, "tags": tags.flatMap { (value: AsArtist.Tag) -> ResultMap in value.resultMap }, "theAudioDB": theAudioDb.flatMap { (value: AsArtist.TheAudioDb) -> ResultMap in value.resultMap }, "area": area.flatMap { (value: AsArtist.Area) -> ResultMap in value.resultMap }, "rating": rating.flatMap { (value: AsArtist.Rating) -> ResultMap in value.resultMap }, "recordings": recordings.flatMap { (value: AsArtist.Recording) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var artistDetailsFragment: ArtistDetailsFragment? {
          get {
            if !ArtistDetailsFragment.possibleTypes.contains(resultMap["__typename"]! as! String) { return nil }
            return ArtistDetailsFragment(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap += newValue.resultMap
          }
        }
      }

      public var asArtist: AsArtist? {
        get {
          if !AsArtist.possibleTypes.contains(__typename) { return nil }
          return AsArtist(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsArtist: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Artist"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("disambiguation", type: .scalar(String.self)),
            GraphQLField("sortName", type: .scalar(String.self)),
            GraphQLField("country", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("lifeSpan", type: .object(LifeSpan.selections)),
            GraphQLField("tags", type: .object(Tag.selections)),
            GraphQLField("theAudioDB", type: .object(TheAudioDb.selections)),
            GraphQLField("area", type: .object(Area.selections)),
            GraphQLField("rating", type: .object(Rating.selections)),
            GraphQLField("recordings", arguments: ["first": 15, "after": nil], type: .object(Recording.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, disambiguation: String? = nil, sortName: String? = nil, country: String? = nil, gender: String? = nil, type: String? = nil, lifeSpan: LifeSpan? = nil, tags: Tag? = nil, theAudioDb: TheAudioDb? = nil, area: Area? = nil, rating: Rating? = nil, recordings: Recording? = nil) {
          self.init(unsafeResultMap: ["__typename": "Artist", "id": id, "name": name, "disambiguation": disambiguation, "sortName": sortName, "country": country, "gender": gender, "type": type, "lifeSpan": lifeSpan.flatMap { (value: LifeSpan) -> ResultMap in value.resultMap }, "tags": tags.flatMap { (value: Tag) -> ResultMap in value.resultMap }, "theAudioDB": theAudioDb.flatMap { (value: TheAudioDb) -> ResultMap in value.resultMap }, "area": area.flatMap { (value: Area) -> ResultMap in value.resultMap }, "rating": rating.flatMap { (value: Rating) -> ResultMap in value.resultMap }, "recordings": recordings.flatMap { (value: Recording) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of an object
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The official name of the entity.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// A comment used to help distinguish identically named entitites.
        public var disambiguation: String? {
          get {
            return resultMap["disambiguation"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "disambiguation")
          }
        }

        /// The string to use for the purpose of ordering by name (for
        /// example, by moving articles like ‘the’ to the end or a person’s last name to
        /// the front).
        public var sortName: String? {
          get {
            return resultMap["sortName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sortName")
          }
        }

        /// The country with which an artist is primarily identified. It
        /// is often, but not always, its birth/formation country.
        public var country: String? {
          get {
            return resultMap["country"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "country")
          }
        }

        /// Whether a person or character identifies as male, female, or
        /// neither. Groups do not have genders.
        public var gender: String? {
          get {
            return resultMap["gender"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        /// Whether an artist is a person, a group, or something else.
        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// The begin and end dates of the entity’s existence. Its exact
        /// meaning depends on the type of entity.
        public var lifeSpan: LifeSpan? {
          get {
            return (resultMap["lifeSpan"] as? ResultMap).flatMap { LifeSpan(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "lifeSpan")
          }
        }

        /// A list of tags linked to this entity.
        public var tags: Tag? {
          get {
            return (resultMap["tags"] as? ResultMap).flatMap { Tag(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "tags")
          }
        }

        /// Data about the artist from [TheAudioDB](http://www.theaudiodb.com/), a good
        /// source of biographical information and images.
        /// This field is provided by TheAudioDB extension.
        public var theAudioDb: TheAudioDb? {
          get {
            return (resultMap["theAudioDB"] as? ResultMap).flatMap { TheAudioDb(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "theAudioDB")
          }
        }

        /// The area with which an artist is primarily identified. It
        /// is often, but not always, its birth/formation country.
        public var area: Area? {
          get {
            return (resultMap["area"] as? ResultMap).flatMap { Area(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "area")
          }
        }

        /// The rating users have given to this entity.
        public var rating: Rating? {
          get {
            return (resultMap["rating"] as? ResultMap).flatMap { Rating(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "rating")
          }
        }

        /// A list of recordings linked to this entity.
        public var recordings: Recording? {
          get {
            return (resultMap["recordings"] as? ResultMap).flatMap { Recording(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "recordings")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var artistDetailsFragment: ArtistDetailsFragment {
            get {
              return ArtistDetailsFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }

        public struct LifeSpan: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["LifeSpan"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("begin", type: .scalar(String.self)),
              GraphQLField("end", type: .scalar(String.self)),
              GraphQLField("ended", type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(begin: String? = nil, end: String? = nil, ended: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "LifeSpan", "begin": begin, "end": end, "ended": ended])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The start date of the entity’s life span.
          public var begin: String? {
            get {
              return resultMap["begin"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "begin")
            }
          }

          /// The end date of the entity’s life span.
          public var end: String? {
            get {
              return resultMap["end"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "end")
            }
          }

          /// Whether or not the entity’s life span has ended.
          public var ended: Bool? {
            get {
              return resultMap["ended"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "ended")
            }
          }
        }

        public struct Tag: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TagConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("nodes", type: .list(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "TagConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of nodes in the connection (without going through the
          /// `edges` field).
          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Tag"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("count", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, count: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "Tag", "name": name, "count": count])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The tag label.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// How many times this tag has been applied to the entity.
            public var count: Int? {
              get {
                return resultMap["count"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "count")
              }
            }
          }
        }

        public struct TheAudioDb: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TheAudioDBArtist"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("banner", type: .scalar(String.self)),
              GraphQLField("logo", type: .scalar(String.self)),
              GraphQLField("memberCount", type: .scalar(Int.self)),
              GraphQLField("genre", type: .scalar(String.self)),
              GraphQLField("mood", type: .scalar(String.self)),
              GraphQLField("style", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(banner: String? = nil, logo: String? = nil, memberCount: Int? = nil, genre: String? = nil, mood: String? = nil, style: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "TheAudioDBArtist", "banner": banner, "logo": logo, "memberCount": memberCount, "genre": genre, "mood": mood, "style": style])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A 1000x185 JPG banner image containing the artist and their logo or name.
          public var banner: String? {
            get {
              return resultMap["banner"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "banner")
            }
          }

          /// A 400x155 PNG image containing the artist’s logo or name, with a transparent
          /// background.
          public var logo: String? {
            get {
              return resultMap["logo"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "logo")
            }
          }

          /// The number of members in the musical group, if applicable.
          public var memberCount: Int? {
            get {
              return resultMap["memberCount"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "memberCount")
            }
          }

          /// The primary musical genre of the artist (e.g. “Alternative Rock”).
          public var genre: String? {
            get {
              return resultMap["genre"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "genre")
            }
          }

          /// The primary musical mood of the artist (e.g. “Sad”).
          public var mood: String? {
            get {
              return resultMap["mood"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mood")
            }
          }

          /// The primary musical style of the artist (e.g. “Rock/Pop”).
          public var style: String? {
            get {
              return resultMap["style"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "style")
            }
          }
        }

        public struct Area: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Area"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Area", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of an object
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The official name of the entity.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct Rating: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Rating"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .scalar(Double.self)),
              GraphQLField("voteCount", type: .nonNull(.scalar(Int.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(value: Double? = nil, voteCount: Int) {
            self.init(unsafeResultMap: ["__typename": "Rating", "value": value, "voteCount": voteCount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The average rating value based on the aggregated votes.
          public var value: Double? {
            get {
              return resultMap["value"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          /// The number of votes that have contributed to the rating.
          public var voteCount: Int {
            get {
              return resultMap["voteCount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "voteCount")
            }
          }
        }

        public struct Recording: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["RecordingConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("nodes", type: .list(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nodes: [Node?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "RecordingConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of nodes in the connection (without going through the
          /// `edges` field).
          public var nodes: [Node?]? {
            get {
              return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Recording"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("title", type: .scalar(String.self)),
                GraphQLField("length", type: .scalar(String.self)),
                GraphQLField("video", type: .scalar(Bool.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, title: String? = nil, length: String? = nil, video: Bool? = nil) {
              self.init(unsafeResultMap: ["__typename": "Recording", "id": id, "title": title, "length": length, "video": video])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of an object
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The official title of the entity.
            public var title: String? {
              get {
                return resultMap["title"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            /// An approximation to the length of the recording, calculated
            /// from the lengths of the tracks using it.
            public var length: String? {
              get {
                return resultMap["length"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "length")
              }
            }

            /// Whether this is a video recording.
            public var video: Bool? {
              get {
                return resultMap["video"] as? Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "video")
              }
            }
          }
        }
      }
    }
  }
}

public struct ArtistBasicFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ArtistBasicFragment on Artist {
      __typename
      id
      name
      disambiguation
      area {
        __typename
        id
        name
      }
      type
      recordings(first: 15, after: null) {
        __typename
        nodes {
          __typename
          id
          title
          length
          video
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Artist"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("disambiguation", type: .scalar(String.self)),
      GraphQLField("area", type: .object(Area.selections)),
      GraphQLField("type", type: .scalar(String.self)),
      GraphQLField("recordings", arguments: ["first": 15, "after": nil], type: .object(Recording.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String? = nil, disambiguation: String? = nil, area: Area? = nil, type: String? = nil, recordings: Recording? = nil) {
    self.init(unsafeResultMap: ["__typename": "Artist", "id": id, "name": name, "disambiguation": disambiguation, "area": area.flatMap { (value: Area) -> ResultMap in value.resultMap }, "type": type, "recordings": recordings.flatMap { (value: Recording) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of an object
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The official name of the entity.
  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// A comment used to help distinguish identically named entitites.
  public var disambiguation: String? {
    get {
      return resultMap["disambiguation"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "disambiguation")
    }
  }

  /// The area with which an artist is primarily identified. It
  /// is often, but not always, its birth/formation country.
  public var area: Area? {
    get {
      return (resultMap["area"] as? ResultMap).flatMap { Area(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "area")
    }
  }

  /// Whether an artist is a person, a group, or something else.
  public var type: String? {
    get {
      return resultMap["type"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  /// A list of recordings linked to this entity.
  public var recordings: Recording? {
    get {
      return (resultMap["recordings"] as? ResultMap).flatMap { Recording(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "recordings")
    }
  }

  public struct Area: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Area"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Area", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The ID of an object
    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    /// The official name of the entity.
    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }

  public struct Recording: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RecordingConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(nodes: [Node?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RecordingConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of nodes in the connection (without going through the
    /// `edges` field).
    public var nodes: [Node?]? {
      get {
        return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Recording"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("length", type: .scalar(String.self)),
          GraphQLField("video", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, length: String? = nil, video: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Recording", "id": id, "title": title, "length": length, "video": video])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of an object
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The official title of the entity.
      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An approximation to the length of the recording, calculated
      /// from the lengths of the tracks using it.
      public var length: String? {
        get {
          return resultMap["length"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "length")
        }
      }

      /// Whether this is a video recording.
      public var video: Bool? {
        get {
          return resultMap["video"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "video")
        }
      }
    }
  }
}

public struct ArtistDetailsFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ArtistDetailsFragment on Artist {
      __typename
      id
      name
      disambiguation
      sortName
      country
      gender
      type
      lifeSpan {
        __typename
        begin
        end
        ended
      }
      tags {
        __typename
        nodes {
          __typename
          name
          count
        }
      }
      theAudioDB {
        __typename
        banner
        logo
        memberCount
        genre
        mood
        style
      }
      area {
        __typename
        id
        name
      }
      rating {
        __typename
        value
        voteCount
      }
      recordings(first: 15, after: null) {
        __typename
        nodes {
          __typename
          id
          title
          length
          video
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Artist"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("disambiguation", type: .scalar(String.self)),
      GraphQLField("sortName", type: .scalar(String.self)),
      GraphQLField("country", type: .scalar(String.self)),
      GraphQLField("gender", type: .scalar(String.self)),
      GraphQLField("type", type: .scalar(String.self)),
      GraphQLField("lifeSpan", type: .object(LifeSpan.selections)),
      GraphQLField("tags", type: .object(Tag.selections)),
      GraphQLField("theAudioDB", type: .object(TheAudioDb.selections)),
      GraphQLField("area", type: .object(Area.selections)),
      GraphQLField("rating", type: .object(Rating.selections)),
      GraphQLField("recordings", arguments: ["first": 15, "after": nil], type: .object(Recording.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String? = nil, disambiguation: String? = nil, sortName: String? = nil, country: String? = nil, gender: String? = nil, type: String? = nil, lifeSpan: LifeSpan? = nil, tags: Tag? = nil, theAudioDb: TheAudioDb? = nil, area: Area? = nil, rating: Rating? = nil, recordings: Recording? = nil) {
    self.init(unsafeResultMap: ["__typename": "Artist", "id": id, "name": name, "disambiguation": disambiguation, "sortName": sortName, "country": country, "gender": gender, "type": type, "lifeSpan": lifeSpan.flatMap { (value: LifeSpan) -> ResultMap in value.resultMap }, "tags": tags.flatMap { (value: Tag) -> ResultMap in value.resultMap }, "theAudioDB": theAudioDb.flatMap { (value: TheAudioDb) -> ResultMap in value.resultMap }, "area": area.flatMap { (value: Area) -> ResultMap in value.resultMap }, "rating": rating.flatMap { (value: Rating) -> ResultMap in value.resultMap }, "recordings": recordings.flatMap { (value: Recording) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of an object
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The official name of the entity.
  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// A comment used to help distinguish identically named entitites.
  public var disambiguation: String? {
    get {
      return resultMap["disambiguation"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "disambiguation")
    }
  }

  /// The string to use for the purpose of ordering by name (for
  /// example, by moving articles like ‘the’ to the end or a person’s last name to
  /// the front).
  public var sortName: String? {
    get {
      return resultMap["sortName"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "sortName")
    }
  }

  /// The country with which an artist is primarily identified. It
  /// is often, but not always, its birth/formation country.
  public var country: String? {
    get {
      return resultMap["country"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "country")
    }
  }

  /// Whether a person or character identifies as male, female, or
  /// neither. Groups do not have genders.
  public var gender: String? {
    get {
      return resultMap["gender"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "gender")
    }
  }

  /// Whether an artist is a person, a group, or something else.
  public var type: String? {
    get {
      return resultMap["type"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  /// The begin and end dates of the entity’s existence. Its exact
  /// meaning depends on the type of entity.
  public var lifeSpan: LifeSpan? {
    get {
      return (resultMap["lifeSpan"] as? ResultMap).flatMap { LifeSpan(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "lifeSpan")
    }
  }

  /// A list of tags linked to this entity.
  public var tags: Tag? {
    get {
      return (resultMap["tags"] as? ResultMap).flatMap { Tag(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "tags")
    }
  }

  /// Data about the artist from [TheAudioDB](http://www.theaudiodb.com/), a good
  /// source of biographical information and images.
  /// This field is provided by TheAudioDB extension.
  public var theAudioDb: TheAudioDb? {
    get {
      return (resultMap["theAudioDB"] as? ResultMap).flatMap { TheAudioDb(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "theAudioDB")
    }
  }

  /// The area with which an artist is primarily identified. It
  /// is often, but not always, its birth/formation country.
  public var area: Area? {
    get {
      return (resultMap["area"] as? ResultMap).flatMap { Area(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "area")
    }
  }

  /// The rating users have given to this entity.
  public var rating: Rating? {
    get {
      return (resultMap["rating"] as? ResultMap).flatMap { Rating(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "rating")
    }
  }

  /// A list of recordings linked to this entity.
  public var recordings: Recording? {
    get {
      return (resultMap["recordings"] as? ResultMap).flatMap { Recording(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "recordings")
    }
  }

  public struct LifeSpan: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["LifeSpan"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("begin", type: .scalar(String.self)),
        GraphQLField("end", type: .scalar(String.self)),
        GraphQLField("ended", type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(begin: String? = nil, end: String? = nil, ended: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "LifeSpan", "begin": begin, "end": end, "ended": ended])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The start date of the entity’s life span.
    public var begin: String? {
      get {
        return resultMap["begin"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "begin")
      }
    }

    /// The end date of the entity’s life span.
    public var end: String? {
      get {
        return resultMap["end"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "end")
      }
    }

    /// Whether or not the entity’s life span has ended.
    public var ended: Bool? {
      get {
        return resultMap["ended"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "ended")
      }
    }
  }

  public struct Tag: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["TagConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(nodes: [Node?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "TagConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of nodes in the connection (without going through the
    /// `edges` field).
    public var nodes: [Node?]? {
      get {
        return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Tag"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("count", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, count: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Tag", "name": name, "count": count])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The tag label.
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// How many times this tag has been applied to the entity.
      public var count: Int? {
        get {
          return resultMap["count"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "count")
        }
      }
    }
  }

  public struct TheAudioDb: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["TheAudioDBArtist"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("banner", type: .scalar(String.self)),
        GraphQLField("logo", type: .scalar(String.self)),
        GraphQLField("memberCount", type: .scalar(Int.self)),
        GraphQLField("genre", type: .scalar(String.self)),
        GraphQLField("mood", type: .scalar(String.self)),
        GraphQLField("style", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(banner: String? = nil, logo: String? = nil, memberCount: Int? = nil, genre: String? = nil, mood: String? = nil, style: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "TheAudioDBArtist", "banner": banner, "logo": logo, "memberCount": memberCount, "genre": genre, "mood": mood, "style": style])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A 1000x185 JPG banner image containing the artist and their logo or name.
    public var banner: String? {
      get {
        return resultMap["banner"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "banner")
      }
    }

    /// A 400x155 PNG image containing the artist’s logo or name, with a transparent
    /// background.
    public var logo: String? {
      get {
        return resultMap["logo"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "logo")
      }
    }

    /// The number of members in the musical group, if applicable.
    public var memberCount: Int? {
      get {
        return resultMap["memberCount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "memberCount")
      }
    }

    /// The primary musical genre of the artist (e.g. “Alternative Rock”).
    public var genre: String? {
      get {
        return resultMap["genre"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "genre")
      }
    }

    /// The primary musical mood of the artist (e.g. “Sad”).
    public var mood: String? {
      get {
        return resultMap["mood"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "mood")
      }
    }

    /// The primary musical style of the artist (e.g. “Rock/Pop”).
    public var style: String? {
      get {
        return resultMap["style"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "style")
      }
    }
  }

  public struct Area: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Area"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Area", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The ID of an object
    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    /// The official name of the entity.
    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }

  public struct Rating: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Rating"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("value", type: .scalar(Double.self)),
        GraphQLField("voteCount", type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(value: Double? = nil, voteCount: Int) {
      self.init(unsafeResultMap: ["__typename": "Rating", "value": value, "voteCount": voteCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The average rating value based on the aggregated votes.
    public var value: Double? {
      get {
        return resultMap["value"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "value")
      }
    }

    /// The number of votes that have contributed to the rating.
    public var voteCount: Int {
      get {
        return resultMap["voteCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "voteCount")
      }
    }
  }

  public struct Recording: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RecordingConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(nodes: [Node?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RecordingConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of nodes in the connection (without going through the
    /// `edges` field).
    public var nodes: [Node?]? {
      get {
        return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Recording"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("length", type: .scalar(String.self)),
          GraphQLField("video", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, length: String? = nil, video: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Recording", "id": id, "title": title, "length": length, "video": video])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of an object
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The official title of the entity.
      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An approximation to the length of the recording, calculated
      /// from the lengths of the tracks using it.
      public var length: String? {
        get {
          return resultMap["length"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "length")
        }
      }

      /// Whether this is a video recording.
      public var video: Bool? {
        get {
          return resultMap["video"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "video")
        }
      }
    }
  }
}
