# testOLX

Test for OLX

It is a simple app, it connect with the OLX API, and it shows the list of items from your search.

It has a repository layer, it conect with the API and create an array of items. It use a Item model, with a few keys from the API.
The request is connected by Alamofire, wich is added by Cocoapods. And the request is made with the GlobalSettings wich keeps the strings with the URL, the URI and the location Parameter

The item model is created by the ItemFactory, it is a parser.
It layer suppot errors in the json. It ignore the items without title, description, id or price.


In the presentation layer, it has the HomeViewController embed in a NavigationController, and when the search is performed, push a ListViewController, it is a TableViewController, it has customCell (ItemTableViewCell) and it shows the items from API.

The ItemTableViewCell shows the title, the price and the description from each Item. And when is touched, it shows an alert with the ID's item.

The ItemFactory catch the exceptions with invalid information in the json. The AppDebug class log those exceptions. And it was added an UnitTestingClass for this ItemFactory, it consider a few cases with invalid information and with right information, and test the result.

For this test, I considered title, description, id, price, displayPrice like Required Keys of all item, items without those keys will not be show it.
