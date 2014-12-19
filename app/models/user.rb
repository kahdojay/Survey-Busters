class User < ActiveRecord::Base
  has_secure_password
  has_many :entries

  # def self.get_users_by_entry_id(e_id)
  #   entry_tag_objs = EntryTag.where(entry_id: e_id)
  #   user_ids = entry_tag_objs.map { |et| et.user_id }
  #   users = user_ids.map { |uid| User.where(id: uid) }
  # end
end
