# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
    puts 'Destroying tables...'
    Cat.destroy_all

    puts 'Resetting id sequences...'
    %w(cats).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    puts "Creating cats..."
    cats = Cat.create([
        {birth_date: Date.parse("21-3-2015"), color: "Black", name: "Bella",  sex: "F", description: "A black cat"},
        {birth_date: Date.parse("12-2-2014"), color: "Ginger", name: "Harris", sex: "M"},
        {birth_date: Date.parse("1-1-2017"), color: "White", name: "Jimmy",  sex: "M", description: "Very freindly" },
        { birth_date: Date.parse("22-6-2020"), color: "Brown", name: "Carrol", sex: "F"},
        {birth_date: Date.parse("15-8-2019"), color: "Mixed", name: "Tabby",  sex: "F"}
    ])
end