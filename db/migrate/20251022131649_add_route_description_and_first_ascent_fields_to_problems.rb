class AddRouteDescriptionAndFirstAscentFieldsToProblems < ActiveRecord::Migration[8.0]
  def change
    add_column :problems, :route_description, :string
    add_column :problems, :first_ascentionist, :string
    add_column :problems, :first_ascent_date, :date
  end
end
