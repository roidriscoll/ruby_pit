env = ENV["RACK_ENV"] || "development"
# we're telling datamapper to use a postgres database on localhost.
# The name will be "ruby_pit_test" or "ruby_pit_development"
# depending on the environment
# DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, "postgres://localhost/ruby_pit_#{env}")
# After declaring your models, you should finalise them.
DataMapper.finalize

# However, how database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!
# auto_upgrade makes non-destructive changes. It your tables don't exist, they will be created
# but if they do and you changed your schema (e.g. changed the type of one of the properties)
# they will not be upgraded because that'd lead to data loss.
# To force the creation of all tables as they are described in your models, even if this
# leads to data loss, use auto_migrate:
# DataMapper.auto_migrate!
# Finally, don't forget that before you do any of that stuff, you need to create a database first.