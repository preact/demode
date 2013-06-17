Demode Gem
===
Allow your app to easily display fake, consistant data from your models when in demo mode.

Installation
---

In your Gemfile:

```ruby
gem 'demode'
```

Configuration
---

Configure Demode to define which fields on your models should be replaced with fake data. This probably should go in `demode.rb` in your initializers folder.

```ruby
Demode.configure do |config|
  
end
```

Copyright (c) 2013 Christopher Gooley & Eric Garcia, Preact / Less Neglect, Inc. See LICENSE.txt for further details.
