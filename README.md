# README

Create a JavaScript Snippet
Blocmetrics users must be able to track events using JavaScript snippets. There's only one function your snippet needs to support:

blocmetrics.report('event name here');
When a browser executes the blocmetrics.report function, make an Ajax request to the server-side API to create the event on your server.

In order to keep your Blocmetrics code from colliding with other JavaScript code, you should create a namespace for it. The simplest way to do this is to declare an empty object. Open one of your previous projects and add this to its application.js file:

app/assets/javascripts/application.js
  var blocmetrics = {};
Then create the report function as a property on that object:

app/assets/javascripts/application.js
var blocmetrics = {};
  blocmetrics.report = function(eventName){
    // your code here
  };
Inside the report function, use a POST request to create the event. Assume that jQuery is not present, and use the Ajax functions that are native to web browsers instead (the XMLHttpRequest API).

blocmetrics.report = function(eventName) {
   // #1
   var event = {event: { name: eventName }};
 
   // #2
   var request = new XMLHttpRequest();
   // #3
   request.open("POST", "http://localhost:3000/api/events", true);
   // #4
   request.setRequestHeader('Content-Type', 'application/json');
   // #5
   request.send(JSON.stringify(event));
}
At #1, we create an event JSON object to send to the Blocmetrics analytics service.

At #2, we initialize a new XMLHttpRequest() (AJAX request)

At #3, we set the HTTP method to POST, the url of our events endpoint, and allow the request to run asynchronously.

At #4, we set the request Content-Type header to 'application/json'. Without that, our API::EventsController would not know to process the request as JSON.

At #5, we finally send the request.
