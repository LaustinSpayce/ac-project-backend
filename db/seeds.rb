# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
APPLICATION_NAME = 'Google Sheets API Ruby Quickstart'.freeze
CREDENTIALS_PATH = 'credentials.json'.freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
TOKEN_PATH = 'token.yaml'.freeze
SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
  token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
  authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
  user_id = 'default'
  credentials = authorizer.get_credentials user_id
  if credentials.nil?
    url = authorizer.get_authorization_url base_url: OOB_URI
    puts 'Open the following URL in the browser and enter the ' \
           'resulting code after authorization:\n' + url
    code = gets
    credentials =
      authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: OOB_URI
      )
  end
  credentials
end

# Initialize the API
service = Google::Apis::SheetsV4::SheetsService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

spreadsheet_id = '1D6qJt4PCa0Zd4dPoYROxasE5na1ciykUD5qMD1L0YC8'
range = 'Bugs - North!A2:AA'
bug_response =
  service.get_spreadsheet_values(
    spreadsheet_id,
    range,
    value_render_option: 'FORMULA'
  )
puts 'No data found.' if bug_response.values.empty?

months = %w[
  January
  February
  March
  April
  May
  June
  July
  August
  September
  October
  November
  December
]

months.each { |month| Month.create(name: month) }

puts 'adding bugs'

bug_response.values.each do |bug|
  months = []

  (10..22).each { |num| months << (num - 9) if bug[num] == 'Yes' }
  # puts 'months'
  # puts months
  # puts 'adding bug'
  # puts bug[1]
  image_string = bug[2]
  image_string['=IMAGE("'] = ''
  image_string['")'] = ''
  # puts 'AAAAAA IMAGE AAAAA'
  # puts image_string
  # puts 'AAAAAAAAAAAAAAAAAA'
  Bug.create(
    name: bug[1],
    image: image_string,
    sell: bug[4],
    where: bug[5],
    weather: bug[6],
    rarity: bug[7],
    start_time: bug[8],
    end_time: bug[9],
    internal_id: bug[26],
    month_ids: months
  )
end

puts 'bugs added'

puts 'adding user'
# create our first user
User.create(email: "stuart.myers@gmail.com", password: "password123")
# Automatically make a first island record. Fill it in.
first_island = Island.first
first_island.island_name = "KampongUBK"
first_island.player_name = "Laustin"
first_island.save
puts 'user and island added'
