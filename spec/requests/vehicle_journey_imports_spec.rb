# -*- coding: utf-8 -*-
require 'spec_helper'

describe "VehicleJourneyImports" do
  login_user
  
  let!(:route) { create :route }

  let(:valid_file_path) {
    csv_file = update_csv_file_with_factory_data("vehicle_journey_imports_valid.csv")
    File.path(csv_file)
  }

  let(:invalid_file_path) {
    csv_file = update_csv_file_with_factory_data("vehicle_journey_imports_with_vjas_invalid.csv")
    File.path(csv_file)
  }

  def update_csv_file_with_factory_data(filename)
    csv_file = CSV.open("/tmp/#{filename}", "wb") do |csv|
      counter = 0
      CSV.foreach( Rails.root.join("spec", "fixtures", "#{filename}").to_s ) do |row|
        if counter == 0
          csv << row
        else
          csv << ( row[0] = route.stop_points[counter - 1].id; row)          
        end
        counter += 1
      end

    end

    File.open("/tmp/#{filename}")
  end
  
  describe "new" do      
    it "should create stop areas and return to stop areas index page" do
      visit new_referential_line_route_vehicle_journey_import_path(referential, route.line, route)
      attach_file('Fichier', valid_file_path)
      click_button "Lancer l'import"
      expect(page).to have_content(I18n.t("vehicle_journey_imports.new.success"))
      expect(page).to have_content("Séquence d'arrêts #{route.name}")
    end

    it "should return error messages when file is invalid" do
      visit new_referential_line_route_vehicle_journey_import_path(referential, route.line, route)
      attach_file('Fichier', invalid_file_path)
      click_button "Lancer l'import"
      expect(page).to have_content(I18n.t("vehicle_journey_imports.errors.import_aborted"))
    end
    
    it "should return error message when file missing on upload" do
      visit new_referential_line_route_vehicle_journey_import_path(referential, route.line, route)
      click_button "Lancer l'import"
      expect(page).to have_content(I18n.t("vehicle_journey_imports.errors.import_aborted"))     
    end    
  end
  
end
