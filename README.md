# Need-O-Tron Daily

A script to send a daily email about the previous day's traffic to GOV.UK.
This used to be part of need-o-tron but didn't really need to be included
there, so I've pulled it out on its own.

## Usage

Use ```bundle install``` to install dependencies.

Run the script with ```bundle exec ruby send_email.rb```

The script depends on a set of environment variables:

* ENV['GOOGLE_OAUTH_TOKEN']   # The OAuth token to access Google Analytics
* ENV['GOOGLE_OAUTH_SECRET']  # The OAuth secret to access Google Analytics
* ENV['ANALYTICS_ACCOUNT_ID'] # The Google Analytics account ID
* ENV['SES_ACCESS_KEY_ID']    # Access Key ID for Amazon SES (for outbound email)
* ENV['SES_SECRET_KEY']       # Access Secret for Amazon SES (for outbound email)
* ENV['RECIPIENT_ADDRESS']    # Email address to send the report to

The recipient address will have to have been authorised via Amazon SES.

To run locally you can create a file called config.rb to set these values. Don't
commit it to this repository.

## Credits

The original need-o-tron daily was created by [Richard Pope](https://github.com/memespring) and [James Stewart](https://github.com/jystewart) some time ago.
