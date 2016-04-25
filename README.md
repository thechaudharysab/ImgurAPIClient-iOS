# ImgurAPIClient
<h2>This project includes:</h2><br>
<li> Display the <a href="http://api.imgur.com/endpoints/gallery#gallery" target="_blank">Gallery</a> images in a grid view;
<li> Display the image description over the image, bottom-aligned or top-aligned;
<li> Cache images in memory and / or on disk using <a href="https://github.com/rs/SDWebImage" target="_blank">SDWebImage</a>
<li> Allow selecting the gallery section: hot, top, user;
<li> Allow including / excluding viral images from the result set;
<li> Allow specifying the window and sort parameters;
<li> When clicking an image in the gallery - shows its details: big image, title, description, upvotes, downvotes and score.
<h2>How to Implement</h2>
Copy the `ImgurAPIClient.h` & `ImgurAPIClient.m` from the project.<br>
Create your `ClientID` and `ClientIDSecret` by <a href="https://imgur.com/account/settings/apps" target="_blank">adding a new application here</a>.
<br>In your `ViewController.h` import `#import "ImgurAPIClient.h"` and add `<apiClientDelegate>` <br>
In your `viewDidLoad` make `ImgurAPIClient *iac = [[ImgurAPIClient alloc] initWithClientId:@"CLIENT_ID" clientSecret:@"CLIENT_ID_SECRET"];` and after that `add iac.delegate = self;`
<br><br><b>To send a call</b> there are two types of Route as per <a href="http://api.imgur.com/endpoints/gallery#gallery" target="_blank">Gallery</a> defined here:<br>
For Sort Route: `[iac gallerySection:(NSString *) sort:(NSString *) page:(NSString *) showViral:(NSString *)];`
For Window Route: `[iac gallerySectionWindow:(NSString *) sort:(NSString *) page:(NSString *) window:(NSString *) showViral:(NSString *)];`
<br><br><b>To get the fetched data</b> you have to implement this delegate method:<br>
`-(void)finalImageURLs:(NSMutableArray*)array titleIs:(NSMutableArray*)title descriptionIs:(NSMutableArray*)desc upVote:(NSMutableArray*)ups downVote:(NSMutableArray*)downs scoreIs:(NSMutableArray*)score;`
The array will contain the URL of images other than that everything is clear from the funcion.
