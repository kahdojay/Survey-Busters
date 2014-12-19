class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :entry_tags
  has_many :tags, through: :entry_tags
  validates :title, presence: true
  validates :post, presence: true

  def show_tags
    tag_array = self.tags.map do |t|
      t.tag_name
    end
    tag_array.join(', ')
  end

  def update_tags(id, tag_info)
    input_tags = tag_info.split(',').map { |t| t.strip }
    input_tags.each do |tn|
      EntryTag.create(tag_id: Tag.find_or_create_by(tag_name: tn).id, entry_id: id)
    end
  end

  def self.get_by_tag(t_id)
    entry_tag_list = EntryTag.where(tag_id: t_id)
    entry_id_list = entry_tag_list.map { |et| et.entry_id }
    entries = []
    entry_id_list.each do |entry_id|
      entries << Entry.find(entry_id)
    end
    entries
  end

  def delete!
    entry_tag = EntryTag.find_by(entry_id: self.id)
    self.destroy
    entry_tag.destroy
  end

  def update_with_tags(params)
    self.update(params[:entry])
    self.tags.clear
    self.update_tags(id, params[:tag][:tag_names])
  end
end
