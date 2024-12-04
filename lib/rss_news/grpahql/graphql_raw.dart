class GraphQLRaw {
  static const getFeeds = r'''query GetFeeds {
  getFeeds {
    weight
    feed_url
    _id
    language
    category
    source
  }
}
''';

  static const getFeedsByCategory =
      r'''query GetFeedsByCategory($category: String) {
    getFeeds(filter: {
      category: $category,
    }) {
      weight
      feed_url
      _id
      language
      category
      source
    }
  }

''';
  static const createDevice =
      r'''mutation createDevice($id:String!,$name:String!,$gid:ID!,$pid:ID!){ 
  createDevice( deviceID: $id 
  deviceName: $name
  group_id: $gid
  Profile_id: $pid
) {
	_id
  deviceID
  deviceName
  group_id
  Profile_id
}
}

''';
  static const updateDevice = r'''mutation updateDevice($id:ID!,$name:String! ){
  updateDevice(id:$id,deviceName:$name){
    deviceName
  }
}
''';
  static const getDeviceById = r'''
  query getDeviceById($id:ID!) {
	getDeviceById(id: $id){
   _id
deviceID
deviceName
	}
}
  ''';
  static const pushLog = r'''
mutation createWebsiteUsageLogOrList ($domain: String,
$page_url: String,
$device_id: ID,
$category: String,) {

 createWebsiteUsageLogOrList(
  domain: $domain,
  page_url: $page_url
  device_id:$device_id
  category: $category
){
  Timestamp
}
}
  ''';
  static const childsActivities = r'''
query childsActivities($deviceId: String ) {
  getAllWebsiteUsageLogs(deviceID: $deviceId) {
  Timestamp
  page_url
    Device_id{
      deviceName
    }
    }
}
 ''';
  static const createSession = r'''
mutation createSession($ class:String!,$subject: String!,
$chapter: String!,
$topic: String!,
$subtopic: String!,
$duration: Int!){
  createSession(class:$class,subject:$subject,chapter:$chapter,topic:$topic,subtopic:$subtopic,
  duration:$duration){
    _id
  }
}

 ''';
  static const getBooks = r''' 
  query getBooks {
  getBooks {
    id
    class
    subject
    board
  }
}
  ''';
}
