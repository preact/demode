Demode Gem
===
Allow your app to easily display fake, consistant data from your models when in demo mode.

Randomness inspired by the faker gem (https://github.com/btelles/faker). 

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

You should provide an array of Class, method to replace, random generation method for each method on each class that you'd like to mask.

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
