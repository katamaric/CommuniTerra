require "administrate/base_dashboard"

class PlantDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    allotments: Field::HasMany,
    cold_resistance_description: Field::Text,
    cold_resistance_level: Field::Text,
    common_name: Field::Text,
    density: Field::Text,
    description: Field::Text,
    exposure_description: Field::Text,
    exposure_level: Field::Text,
    flowering: Field::Text,
    foliage: Field::Text,
    harvest: Field::Text,
    latin_name: Field::Text,
    maintenance_description: Field::Text,
    maintenance_level: Field::Text,
    mature_height: Field::Text,
    mature_width: Field::Text,
    owned_plants: Field::HasMany,
    owners: Field::HasMany,
    plant_sittings: Field::HasMany,
    planting: Field::Text,
    plants_to_keep: Field::HasMany,
    pruning: Field::Text,
    specie: Field::Text,
    vegetation: Field::Text,
    water_requirement_description: Field::Text,
    water_requirement_level: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    allotments
    cold_resistance_description
    cold_resistance_level
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    allotments
    cold_resistance_description
    cold_resistance_level
    common_name
    density
    description
    exposure_description
    exposure_level
    flowering
    foliage
    harvest
    latin_name
    maintenance_description
    maintenance_level
    mature_height
    mature_width
    owned_plants
    owners
    plant_sittings
    planting
    plants_to_keep
    pruning
    specie
    vegetation
    water_requirement_description
    water_requirement_level
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    allotments
    cold_resistance_description
    cold_resistance_level
    common_name
    density
    description
    exposure_description
    exposure_level
    flowering
    foliage
    harvest
    latin_name
    maintenance_description
    maintenance_level
    mature_height
    mature_width
    owned_plants
    owners
    plant_sittings
    planting
    plants_to_keep
    pruning
    specie
    vegetation
    water_requirement_description
    water_requirement_level
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how plants are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(plant)
  #   "Plant ##{plant.id}"
  # end
end
