require 'hipchat-api'

hipchat_api = HipChat::API.new('ea2131d1ce53f7d0d143e55fb5b171')
a = hipchat_api.rooms_show("WDI San Francisco, June")  