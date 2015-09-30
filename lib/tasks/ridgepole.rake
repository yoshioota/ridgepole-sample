namespace :ridgepole do

  desc 'export'
  task :export do
    cmd = "bundle exec ridgepole -c config/database.yml -E #{Rails.env} --export -o db/Schemafile"
    puts cmd
    system cmd
  end

  desc 'dry-run'
  task :'dry-run' do
    cmd = "bundle exec ridgepole -c config/database.yml -E #{Rails.env} -f db/Schemafile --apply --dry-run"
    puts cmd
    system cmd
  end

  desc 'apply'
  task :apply do
    cmd = "bundle exec ridgepole -c config/database.yml -E #{Rails.env} -f db/Schemafile --apply"
    puts cmd
    system cmd
  end

  namespace :heroku do
    desc 'dry-run for Heroku'
    task :'dry-run' do
      cmd = "bundle exec ridgepole -c config/database.for.heroku.ridgepole.yml -E #{Rails.env} -f db/Schemafile --dry-run"
      puts cmd
      system cmd
    end

    desc 'apply for Heroku'
    task :apply do
      cmd = "bundle exec ridgepole -c config/database.for.heroku.ridgepole.yml -E #{Rails.env} -f db/Schemafile --apply"
      puts cmd
      system cmd
    end
  end
end
