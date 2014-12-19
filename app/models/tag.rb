class Tag < ActiveRecord::Base
  has_many :entry_tags
  has_many :entries, through: :entry_tags

  def self.make_tags(entry_id, tag_string)
    canonical_ary = tag_string.split(',').map! { |t| t.strip }
    canonical_ary.each do |tn|
      EntryTag.create(tag_id: Tag.find_or_create_by(tag_name: tn).id, entry_id: entry_id)
    end
  end
end
