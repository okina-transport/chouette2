class Chouette::CategoriesForLine < Chouette::TridentActiveRecord
  self.primary_key = "id"
  has_many :lines

  validates_presence_of :name

end
