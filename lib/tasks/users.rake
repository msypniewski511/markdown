namespace :users do
	desc 'Truncate all users'
	task truncate: :environment do
		puts 'invoked!'
	end
end
