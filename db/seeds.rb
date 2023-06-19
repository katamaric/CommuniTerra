require 'csv'

db_path = Rails.root.join("db")

CSV.foreach(db_path.join('plants.csv'), :quote_char => "|", col_sep: ';', headers: true) do |row|
  Plant.create(description: row[0], common_name: row[1], latin_name: row[2], specie: row[3], vegetation: row[4], foliage: row[5], mature_height: row[6], mature_width: row[7], maintenance_level: row[8], maintenance_description: row[9], water_requirement_level: row[10], water_requirement_description: row[11], cold_resistance_level: row[12], cold_resistance_description: row[13], density: row[14], exposure_level: row[15], exposure_description: row[16], flowering: row[17], planting: row[18], harvest: row[19], pruning: row[20])
end

Delivery.create!([
  { delivery_provider: "Colissimo", delivery_price: 2.44, delivery_type: "standard" },
  { delivery_provider: "UPS", delivery_price: 3.20, delivery_type: "standard" },
  { delivery_provider: "FedEx", delivery_price: 6.72, delivery_type: "express" },
  { delivery_provider: "Autre", delivery_price: 0.0, delivery_type: "standard" }
])
