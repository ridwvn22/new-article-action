Options

* Install ruby --version
 sqlite3 --version
 gem install rails
rails new blog
cd blog
bin/rails server
rails generate migration add_description_to_categories
rake db:migrate
rails backfill:categories_descriptions
rake db:migrate



1. you must first validate that each article you created belongs to a category.
2. Go to your Ruby rails server and create a description(model) for each category, do this by generating a migration: [rails generate migration add_description_to_categories] and then: [rake db:migrate to migrate the database]. In adition, you need to validate the added column(description) into your Category.rb. Next, add your 'description' to category_params in your category controller. Lastly, create an index.html.erb into views > categories that includes and if else statement that gives the users optional description for each category. DON'T forget to link your path, otherwsie you'll come across an error.
3. At this point you have created your description column, but it's null and there is no output. In order to update your description, you need add a rake task to backfill the data to your category description. In your rails console do, [rails backfill:categories_descriptions]. This should give you a new class migrate: BackfillCategoryDescriptions. Next, create a new file in lib > tasks called Backfill_category_description.rake and you should rake task that goes through each category and updates the description.
4. Now you need to create a way for signed in users to create a category; make sure include view and form as partials. I put in the same authentication from articles.controller.rb so the same users can have access. In your Categories.controller.rb, you should already have a def new; add a def create that is able to recognize if the user is new. If they are a previous user per the authentication, they should be able to create new category ; else they will be rendered back to new. In your form.html.erb, your form should be connected to your category model and the new category path from your rails routes.
Next, you need to be able to allow users to read a category by going to localhost:3000/categories/:id. You can do this by adjusting def index in your categories.controller.rb and adding a index.html.erb to your views > categories. This will tell rails that if a category.description is present add the description to the category, else let the user know there is no description available. DON'T forget to link the index to your category.name and path.
Next, you want the signed in users to be able to edit a category. You can do this by modifying your def show in categories.controller.rb and then create a show.html.erb to tell rails to display an edit button in each category that has button and is connected to edit_category_path from our rails routes.
Next, you want the signed in users to be able to delete a category. You can do this by adding onto your show.html.erb. Add a link(button) for delete that links category and uses the method of delete and an alert that confirms if they'd like to proceed with deleting.
Next, you need to display the number of articles within each category, next to the category name in the category index page. You can do this simply by adding categories.articles.count to your index.html.erb and then close the tag and follow it with 'articles' so the readers know what the count means.
Lastly, style your blog: 