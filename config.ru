require 'sinatra'
require File.expand_path("./lib/application")

set :run, false

run Application
