import 'package:flutter_browser/rss_news/constants/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  late GraphQLClient client;
  GraphQLService(String apiLink) {
    final Link link = HttpLink(apiLink);
    client = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: store),
    );
  }

  Future<QueryResult> performQuery(String query,
      {required Map<String, dynamic> variables}) async {
    final QueryOptions options = QueryOptions(
        document: gql(query),
        variables: variables,
        fetchPolicy: FetchPolicy.networkOnly);
    final QueryResult result = await client.query(options);

    return result;
  }

  Future<QueryResult> performMutation(String mutation,
      {required Map<String, dynamic> variables}) async {
    final MutationOptions options =
        MutationOptions(document: gql(mutation), variables: variables);
    final QueryResult result = await client.mutate(options);

    return result;
  }
}
