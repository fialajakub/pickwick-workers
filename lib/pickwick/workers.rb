require 'sidekiq'
require 'faraday'
require 'zip'
require 'nokogiri'
require 'unicode_utils'
require 'multi_json'
require 'oj'

require 'pickwick/api'
require 'pickwick/workers/feeders/mpsv/parser'
require 'pickwick/workers/feeders/mpsv/processor'
require 'pickwick/workers/version'
