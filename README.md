# bitly-shortener

```bash
gem install bitly-shortener
```

OR in Gemfile:

```ruby
gem 'bitly-shortener'
```

### Getting Started

1. Generate your https://bit.ly access token from [here](https://bitly.is/accesstoken)
2. Set the token obtained in 1 above as your `BITLY_API_KEY`

### Usage
You can use this within your app or via the CLI.

Code:

```ruby
url = Bitly::Shortener::Request.new('https://www.wsj.com/articles/covid-upended-americans-finances-just-not-in-the-ways-we-expected-11609081200')
shortened_url = Bitly::Shortener::Shorten.new(url).shortened_url

pp shortened_url # => https://on.wsj.com/2MiuBuo
```

CLI:

```bash
$ bin/shorten -l https://www.wsj.com/articles/covid-upended-americans-finances-just-not-in-the-ways-we-expected-11609081200

https://on.wsj.com/2MiuBuo/app

$
```

