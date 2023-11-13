namespace :backfill do
    desc 'Backfill existing categories descriptions'
    task  categories_descriptions: :environment do
       Category.find_each do |category|
        updated_description = "Updated Description for #{category.name}"
        category.update(description: updated_description)
        end
    end
end