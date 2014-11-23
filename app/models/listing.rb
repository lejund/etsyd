class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x>" }, :default_url => "default.gif"
        validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
	else
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x>" }, :default_url => "default.gif", 
    					:storage => :dropbox,
    					:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    					:path => ":style/:id_:filename"  					  					
	validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
	end

	validates :name, :desciption, :price, presence: true
	validates :price, numericality: { greater_than: 0}
	validates_attachment_presence :image



end
