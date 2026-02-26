//
//  GraphQLClient.swift
//  GraphQLMiniProject
//
//  Created by Sinuar on 21/01/26.
//

// Network/GraphQLClient.swift
import Foundation
import Apollo

final class GraphQLClient {
    static let shared = GraphQLClient()
    
    let apollo: ApolloClient
    
    private init() {
        // Create the network transport
        let networkTransport = Self.makeNetworkTransport()
        
        // Create cache
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        
        // Initialize Apollo Client
        self.apollo = ApolloClient(
            networkTransport: networkTransport,
            store: store
        )
    }
    
    private static func makeNetworkTransport() -> NetworkTransport {
        let url = URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!
        
        // Create URL session configuration
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 30
        sessionConfiguration.timeoutIntervalForResource = 30
        
        // Create the interceptor provider
        let client = URLSessionClient(sessionConfiguration: sessionConfiguration)
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let provider = DefaultInterceptorProvider(
            client: client,
            store: store
        )
        
        // Create request chain transport
        return RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url,
            additionalHeaders: [:]
        )
    }
}

// Async/await convenience extension
extension ApolloClient {
    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default
    ) async throws -> Query.Data {
        try await withCheckedThrowingContinuation { continuation in
            self.fetch(
                query: query,
                cachePolicy: cachePolicy,
                contextIdentifier: nil,
                queue: .main
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data {
                        continuation.resume(returning: data)
                    } else if let errors = graphQLResult.errors {
                        continuation.resume(throwing: GraphQLError.graphQL(errors))
                    } else {
                        continuation.resume(throwing: GraphQLError.noData)
                    }
                case .failure(let error):
                    continuation.resume(throwing: GraphQLError.network(error))
                }
            }
        }
    }
    
    func perform<Mutation: GraphQLMutation>(
        mutation: Mutation
    ) async throws -> Mutation.Data {
        try await withCheckedThrowingContinuation { continuation in
            self.perform(
                mutation: mutation,
                publishResultToStore: true,
                queue: .main
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data {
                        continuation.resume(returning: data)
                    } else if let errors = graphQLResult.errors {
                        continuation.resume(throwing: GraphQLError.graphQL(errors))
                    } else {
                        continuation.resume(throwing: GraphQLError.noData)
                    }
                case .failure(let error):
                    continuation.resume(throwing: GraphQLError.network(error))
                }
            }
        }
    }
}

enum GraphQLError: Error, LocalizedError {
    case noData
    case network(Error)
    case graphQL([Error])
    
    var errorDescription: String? {
        switch self {
        case .noData:
            return "No data received from the server"
        case .network(let error):
            return "Network error: \(error.localizedDescription)"
        case .graphQL(let errors):
            let messages = errors.map { $0.localizedDescription }.joined(separator: ", ")
            return "GraphQL errors: \(messages)"
        }
    }
}
