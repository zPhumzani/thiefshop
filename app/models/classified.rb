class Classified < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

	def slug_candidates
		[
			:title,
			[:title, :location],
			[:title, :location, :created_at]
		]
	end
	attr_accessor :file
	belongs_to :category
	belongs_to :user
	has_many :taggings
	has_many :tags, through: :taggings
	validates :title, presence: true
	validates :price, presence: true, numericality: {greater_than: 0.05}
	validates :location, presence: true
	validates :description, presence: true
	validates :user_id, presence: true
	validates :file, presence: true

	def initialize(params={}) 
		@file = params.delete(:file)
		super
		if @file
			self.filename = sanitize_filename(@file.original_filename)
			self.content_type = @file.content_type
			self.file_contents = @file.read
		end
	end

	def all_tags=(name)
		self.tags = name.split(", ").map do |name|
			Tag.where(name: name.strip.downcase).first_or_create!
		end
	end

	def all_tags
		self.tags.map(&:name).join(", ")
	end

	def self.tagged_with(name)
		Tag.includes(:taggings).find_by_name!(name).classifieds
	end

	private
	  def sanitize_filename(filename)
	  	return File.basename(filename)
	  end
end
