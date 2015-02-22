README
======

Purpose
-------
The original goal was to develop a scalable business app targeting startup entrepreneurs that would be a fast, user friendly, accessible, and reliable idea comparison tool.
Top ideas would be reviewed by guru's who would rank them against predetermined criteria including determining the extent of startup entrepreneurship evidence available and their social rating, and then prioritised them for the purpose of investment consideration.
The results were intended to be displayed using trusted Google Trend API as one-stop-shop to power resourcing, relocation, and other investment decisions by angel investors and venture capitalists. Use of a structured and dynamic stack would enable adaptability to other exciting API's to source and compare against further secondary data.

Brief summary of the Stages is described below
  - Stage 1 users are invited to review ideas and pick their favourite ideas from a list (of top trending Twitter Hashtags and associated Countries) shared by lean entrepreneurs. Once they click the "Filter" button after entering text in the search field or ticking checkbox selections, their favourite ideas will appear in a filtered list.
  - Stage 2: To proceed Stage 2 and view more details the user must click the "Proceed to Detail" button.
  - Stages 3 & 4: These stages are shown when the user clicks the "Proceed to Compare Trending Keywords" and "Proceed to Compare Trending Locations" respectively. The filtered idea's keywords and locations will be compared with the latest Twitter keywords trends and trending locations using 'WhatstheTrend' API. Google Visualisations API will display the metrics for further investment consideration. The purpose of this site is to accelerate MVP robustness with repeatable validation against the latest trends for lean entrepreneurs, angel investors, and venture capitalists

The actual outcome produced is described in the below implementation "Walk-through" section.


Technologies Used:
-------
* Git
* Ruby on Rails
* JavaScript
* jQuery
* PostgreSQL
* WhatTheTrend API
* Devise
* Google Visualisations API
* Bootstrap


Walk-through
-------

* **Stage 1**
  - Click "Show Instructions" button (green).
  - Click "Hide" button (grey) to hide the instructions again.
  - Click the Create "New Idea" button (green)
  - Sign Up (if necessary)
  - Install [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en) from the Chrome Web Store to view the JSON files in a Chrome web browser in a more readable format
  - Go to [http://api.whatthetrend.com/api/v2/trends.json](http://api.whatthetrend.com/api/v2/trends.json). This JSON file from trends.format of the [WhatTheTrend API](http://api.whatthetrend.com/) lists the current trending terms on Twitter with descriptions. The "trends" key contains an array [] of multiple hashes {}, where each of the hashes contain a sub-key called "query", which contains a Twitter Hashtag as its value. Enter any of these values (i.e. #MyFakeTwitterHashtag) in the "Name" value that you enter when creating a New Idea.
  - Go to [http://api.whatthetrend.com/api/v2/trends/locations/top.json?place_type_code=12](http://api.whatthetrend.com/api/v2/trends/locations/top.json?place_type_code=12). This JSON file from trends/locations/top of the [WhatTheTrend API](http://api.whatthetrend.com/) is a list of the #1 trending terms on Twitter by location type. The "trends" key contains an array [] of multiple hashes {}, where each of the hashes contain a sub-key called "place_name", which contains a Location name as its value. Enter any of these values (i.e. United States) in the "Country" value that you enter when creating a New Idea.
  - Click "Show" or "Edit" to perform the associated action against a listed idea.
  - Click "Back" to return to the main Stage 1 page.
  - Under the heading "Listing Ideas" click "Next" or "Previous" to view more of the ideas created. The "New Idea" that was created will be added to the Last Page. The number shown in the "User" column against the "New Idea" that was created will correspond to your User ID that was generated using Devise.
  - Instead of individually checking the "Worthy?" checkbox against certain ideas, we will simply click to check the "Select All" checkbox so that all the checkboxes on the last page become checked (if the "Select All" checkbox does not check all the checkboxes, then simply remain on the last page and individually check all the "Worthy?" row checkboxes). Ensure that you check the "Worthy?" checkbox of the Idea that you added.
  - Without entering any value for "Search", simply click the "Filter Ideas" button
  - Click the "Proceed to Detail" button (green)
* **Stage 2**
  - Stage 2 should appear with the filtered list of Detailed Ideas shown (representative of your favourite ideas) and now displaying the Author, URL, and Country associated 
  - Click the "Proceed to Compare Trending Twitter Keywords" button (green)
* **Stage 3**
  - Stage 3 should appear, which presents a heading "Results of Comparison", which is a section that has compared all the "Name" column values (Twitter Hashtags) against the "query" sub-key of the trends.format JSON file (current trending terms on Twitter) by WhatTheTrend API. It states the quantity of matches between the "Name" column of the filtered ideas and the "query" sub-keys of each trending term on Twitter and uses Google Visualisations to display the proportion of your idea selections that are in the top Twitter trends.
  - Click the "Proceed to Compare with Trending Locations" button (green)
* **Stage 4**
  - Stage 4 should appear, which also presents a heading "Results of Comparison", which is a section that has compared all the "Country" column value Country names against the "place_name" sub-key of the trends/locations/top JSON file (#1 trending terms on Twitter by location type) by WhatTheTrend API. It states the quantity of matches between the "Country" column of the filtered ideas and the "place_name" sub-keys of each trending term on Twitter and uses Google Visualisations to display the proportion of your idea selections that are in the top locations globally.
  - Click "Finish and Compare Other Ideas" to finish the walk-through
  - Try entering the Hashtag value in the field next to the label called "Search" and press the "Filter Ideas" button (blue). This will filter the ideas list to only include matches. The matching text will be highlighted in yellow.

Note: The app uses HTTParty to parse values of different JSON files associated with the sub-key "query" and another that contains the sub-key "place_name" [here](
https://github.com/ltfschoen/ideas_app/blob/master/app/controllers/ideas_controller.rb#L173) in the code, and compares them against each of the "Names" in the list called "Listing Ideas"


Play with the App
----------
 - Clone or fork the repo 
   ```
     git clone https://github.com/ltfschoen/ideas_app.git
   ```
 - Install Gemfile Dependencies 
   ```
     bundle install
   ```
 - Run PostgreSQL (Seed and Migrate the DB)
   ```
     rake db:setup
   ```
 - Run the WEBrick Server
   ```
     rails s
   ```
 - Open 'localhost:3000' in your browser

Production
----------
http://trendmyhunch.herokuapp.com/
