class Chouette::Variations < Chouette::TridentActiveRecord
  self.primary_key = "id"

  def self.to_csv
    attributes = {
        typev: 'Donnees', descriptionv: 'Changements'
    }

    CSV.generate(headers: true) do |csv|
      csv << attributes.values

      all.each do |variation|
        csv << attributes.keys.map{ |attr| variation.send(attr) }
      end
    end
  end

end
