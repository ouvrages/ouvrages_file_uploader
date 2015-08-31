# OuvragesFileUploader

Rails Engine to use jQuery File Upload with Paperclip

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ouvrages_file_uploader'
```

And then execute:


```
$ bundle
```

Or install it yourself as:

```
$ gem install ouvrages_file_uploader
```

You must already have jquery installed.

Then add this to your application.js:

```javascript
//= require uploaded_files
```

And this to your application.css:

```css
*= require uploaded_files
```

You need to copy migrations to your project:

```
$ rake ouvrages_file_uploader_engine:install:migrations
```

And then run:

```
$ rake db:migrate
```

## Usage

Let's consider, we have a resource Post.

You need to generate a migration for add an attachment:

```
$ rails generate migration add_image_to_posts image:attachment
$ rake db:migrate
```

And call in your model `accepts_uploaded_file_for(attribute)`:

```ruby
class Post < ActiveRecord::Base
	attr_accessible :image
	has_attached_file :image
	do_not_validate_attachment_file_type :image

	accepts_uploaded_file_for :image
end
```

Then in your view `app/views/posts/_form.html.erb`:

```erb
<%= file_upload(form, :image) %>
```

For extra information on how to deal with Paperclip, please refer [offical documentation](https://github.com/thoughtbot/paperclip).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
