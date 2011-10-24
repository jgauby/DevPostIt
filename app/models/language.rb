class Language < ActiveRecord::Base
  belongs_to :post_it
  
  serialize :identifiers, Hash
end
