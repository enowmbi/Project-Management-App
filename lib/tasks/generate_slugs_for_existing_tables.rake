desc "Generate slugs for existing table entries."
namespace :slug do 
  task generate: :environment do |model|
    models = [User,Task,Project,Team]
    models.each do |model|
      puts "Generating slugs for #{model.table_name}, please wait!"
      model.find_each(&:save)
      puts "Done with #{model.table_name}"
    end
  end
end
