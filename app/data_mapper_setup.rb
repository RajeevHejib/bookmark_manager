require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/link'
require_relative 'models/tag'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
# class Join
#
#   attr_reader :link, :tab
#
#   def set_relationship
#     link = Link.create(:url =>  params[:url], :title => params[:title])
#     tag = Tag.create(:tag => params[:tag])
#     link.tags << tag
#     link.save
#     LinkTag.create(:link => link, :tag => tag)
#
#   end
# end
#
# # LinkTag.create(:link => link, :tag => tag)
