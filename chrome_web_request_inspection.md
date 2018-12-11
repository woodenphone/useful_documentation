# Chrome web request inspection
Figuring out how a website did what it does through Chrome.
(For doing things like emulating logins.)

# For analysis of HTTP requests
(Chrome has an option to output curl equivalents of a request it sent.)
(This is assuming you already have Google Chrome installed and know the basics of using it.)

Open chrome.

Open the developer tools.
Menu > More Tools > Developer Tools
(or Ctrl+Shift+I)

Select the 'Network' tab at the top of the panel that opens.

Check the 'Preserve Log' checkbox.
(This stops Chrome from throwing away the information we want to inspect as it loads newer things.)

I recommend ensuring that the 'All' option is selected in the selector thing at the top.
This should make sure that it knows to show all HTTP events, instead of just one type.
To make Chrome only show one type of HTTP event (chosen by URL? I don't know the specifics at this time.), you may select a different option instead of 'All'.

Open the website of interest.
Observe how as you perform actions such as loading a page new HTTP events show up at the bottom of the list in the 'Network' tab.
Observe how the 'Waterfall' column and the matching section above the event list graphically display when in time the action happened.


Perform actions of interest
(Such as submitting a form. E.G. Logging in to a website.)

Look in the list of HTTP actions for the one corresponding to your action.
The name column and the timeing of when the event occured may help find what you're interested in.
This is largely a process of manual guessing and trial-and-error.
You can get more information about an event by clicking on its line.
(You should expect to see: Headers, Preview, Response, Timing)
Not all of the headers/information relating to an event is shown.

To capture more of the useful information about a GET/POST request,
right click the event in the list, select Copy > Copy cURL (bash)
Paste this information into a new text file.
To convert this single-line bash curl command into something more manageable and readbale, use regex find-and-replace in your editor of choice to split up the command.

## Regex to convert from one-liner into seperate lines for easier reading
### Convert bash style curl.
Seperate arguments into seperate lines.
(Add backslash at end of each line to make the result still a working bash command.)
search: "' -"
replace: "'\n -"

### Split url parameters:
(This may break the command by adding the newlines.)
search: "&"
replace: "&\n"

## Common pitfalls / Troubleshooting:
Problem: The information vanishes as I browse.
Solution: Ensure the 'Preserve log' checkbox is checked at the top of the developer tools panel.

Problem: My emulated requests aren't working.
Solutions:
You might need to grab a token value out of the page that sent the request.
You may be missing required headers.
You may be using the wrong request type (GET/POST).
You may not be keeping and sending cookies that the site expects.
You may not have encoded/decoded/etc the parameters/keys/values suitably, for example URLEncode problems where you have %FF instead of some character, or the inverse.

