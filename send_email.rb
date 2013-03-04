#!/usr/bin/env ruby

require 'action_mailer'
require 'aws/ses'

require_relative 'lib/analytics_interface'
require_relative 'lib/report_mailer'

view_path = File.expand_path('views', File.dirname(__FILE__))

ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => ENV['SES_ACCESS_KEY_ID'],
  :secret_access_key => ENV['SES_SECRET_KEY']
ActionMailer::Base.delivery_method = :ses
ActionMailer::Base.view_paths = view_path

interface = AnalyticsInterface.new(ENV['ANALYTICS_ACCOUNT_ID'], ENV['GOOGLE_OAUTH_TOKEN'], ENV['GOOGLE_OAUTH_SECRET'])
daily = interface.daily_stats
weekly = interface.weekly_stats
details = interface.main_visits_data
ReportMailer.daily_analytics(ENV['RECIPIENT_ADDRESS'], daily, weekly, details).deliver
