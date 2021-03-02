# youtube_client_api

Package to access youtube live stream API in dart.

### Overview

The goal of this package is to make it easy to access 
[youtube live stream api](https://developers.google.com/youtube/v3/live/getting-started) 
in dart, flutter

To use this package: 
* Get api key from [youtube API V3](https://developers.google.com/youtube/v3/getting-started)
* Get access token from [google sign in package](https://pub.dev/packages/google_sign_in) 

### Getting Started
######LiveBroadcasts:
* [Get live broadcasts](https://developers.google.com/youtube/v3/live/docs/liveBroadcasts/list)

      YoutubeApi.getLiveBroadcastList({String accessToken, LiveQuery query})
      Required parameters (part, broadcastStatus, id, mine)
      Optional parameters: broadcastType, maxResults, onBehalfOfContentOwner, onBehalfOfContentOwnerChannel, pageToken
* [Insert broadcast](https://developers.google.com/youtube/v3/live/docs/liveBroadcasts/insert)
      
      YoutubeApi.insertLiveBroadcast({String accessToken,LiveQuery query,LiveBroadcast liveBroadcast})
      