# reddit_clone
week 6 reddit clone (pair work)

## Description

Build a Reddit clone (bookmarks and voting in Rails using Forms and relationships). You'll be working in pairs on this. Pick one person to host the repo on Github, and add the other person as contributor so they have a 'commit bit'.

## Deliverables

 Each of you should leave a comment for me on this issue with:

 A github repo with your rails app
 A link to a live Heroku instance

## Requirements

 Users can sign up/recover passwords/etc. (hint: use Devise)
 Links belong to the user who submitted them.
 Each link should have many votes associated with it.
 Clicking on up-vote for link should contribute to a positive score.
 The front page should order by the score of an item (sum of it's votes).
 links on the homepage should be paginated. (hint: use Kaminari)
 Other users should be able to comment on links. Comments do not need to be nested (that's a bonus item).
 Make it look nice, Bootstrap, hand-rolled, etc.
 Visitors can browse links and see comments, but they cannot create anything.
 Fill your database in production (on Heroku) with many content. Consider working with the whole class to ask your peers to submit links and comment on each others apps. This will also help you find and discover bugs.

## Bonuses

 Add some error tracking (e.g. Rollbar or HoneyBadger) and/or performance monitoring (e.g. New Relic)
 Down-votes to reduce the score of an item
 Nest/thread comments like on Reddit.
 Up/down-vote for comments.
 Categories (sub-reddits), the front page should still show everything.
