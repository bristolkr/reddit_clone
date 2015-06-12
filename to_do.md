# To Do Checklist

# Public Side
	## home#index
		* show 25 links per page, with pagination (kaminari)
		* login/signup prompt
		* search
			* Links:
				* sort: highest-upvoted first (total of upvotes minus downvotes) (all)
				* show comments (all)
				* new/edit/delete posts (users)
				* new/edit/delete comments (users)
				* upvote (users) 
				* downvote (optional)
				* share link (optional)
				* thumbnail (optional)

		## Sign In / Sign Up (devise)
			* generate form
			* style to complement home#index

		## post#show (what is seen once a link is clicked--this stuff is also what the user will generate when they create post)
				* show.html.erb
				* link text is required, user-generated
				* link body is required but can vary in length (i.e., a link can either be to an offsite url or to a blog-style post)
				* link url is optional
				* link photo is optional (look into limiting size of uploads)
				* show all comments
				* nest comments, thread-style (optional)

		


# Private Side (what do you have to log in to see?)
	## user#show
		* show.user.erb
		* most recent posts
		* most recent comments
		* most recent upvotes/downvotes
		* style to complement home#index
		* profile (optional)
			* gravatar
			* bio
			* member since

	### post#new
		* new.html.erb -> _form.html.erb
		* _form.html.erb (see post#show for what the form fields should collect)

	### post#edit
		* edit.html.erb
			
	### comment#new
		* new.html.erb -> _form.html.erb
		* _form.html.erb 
		* comment user is required
		* comment body is required
		* comment url is optional
		* comment photo is optional (look into limiting size of uploads)


	### comment#edit
		* edit.html.erb

## Sessions are handled as part of Devise -- need to make sure the view is generated
## Need to look at mailers (Mandrill?) for email authentication, password retrieval
## Can also look at Heroku add-ons

# Optional

## HoneyBadger for error checking
## New Relic for performance monitoring
## categories / subreddits (i.e., a homepage for kitties or bunnies or puppies)
