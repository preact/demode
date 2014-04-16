Demode Gem
===
Allow your app to easily display fake, consistant data from your models when in demo mode.

Randomness idea and person names inspired by the [faker gem](https://github.com/btelles/faker). Random company names from [online-generator.com](http://online-generator.com/name-generator/company-name-generator.php).

The whole point of this gem is to be able to generate valid-looking demoable data from your dev or prod database. It uses the Id of the model to ensure that every time you generate a fake name, it's the same fake name for the same model. This ensures that things are consistant across page loads and deploys, it also improves the face-validity of the data by making sure that the name matches the email, for instance.

The class on which you're faking fields should respond to an :id call, so it should work seamlessly with ActiveModel, Mongoid, or other ORMs. You can also optionally specify the id field to use, if :id isn't appropriate for your use case.

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

  config.check_enabled = Rails.env.development?

  config.replacements = [
    [ Person, :name, :name ],
    [ Person, :email, :email ],
    [ Account, :name, :company_name ]
  ]

end
```

You should provide an array of Model/Class, method to replace, random generation method for each method on each class that you'd like to mask.

License
---

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2013 Christopher Gooley & Eric Garcia, Preact / Less Neglect, Inc. See LICENSE.txt for further details.
