# Chrome web request inspection
Figuring out how a website did what it does through Chrome.

# For analysis of HTTP requests
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




Common pitfalls / Troubleshooting:
Problem: The information vanishes as I browse.
Solution: Ensure the 'Preserve log' checkbox is checked at the top of the developer tools panel.




(Chrome has an option to output curl equivalents of a request it sent.)
# Regex to convert from one-liner into seperate lines for easier reading
Convert bash style curl.
Seperate arguments into seperate lines
search:
replace:

Split url parameters:
search:
replace: