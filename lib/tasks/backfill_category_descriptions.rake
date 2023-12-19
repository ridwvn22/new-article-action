namespace :backfill do
    desc 'Backfill existing categories descriptions'
    task  backfill_category_descriptions: :environment do
        descriptions = {
            "General" => "Explore a variety of general topics.",
            "Technology" => "Stay up-to-date with the latest in technology and innovation from around the world.",
            "Travel" => " Embark on journey of discovery.",
            "Food" => "Indulge in colinary adventure.",
            "Fashion" => "Dive into the world of fahsion.",
        }
       Category.where(descriptions: nill).each do |category|
        description = descriptions[category.name]

        category.update!(description: description)
        puts "Backfilled description for category '#{category.name}'"
        end
    end
end