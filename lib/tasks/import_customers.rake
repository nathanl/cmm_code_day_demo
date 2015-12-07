desc "Import customers from CSV - DESTROYS EXISTING"
task :import_customers, [:csv_filename] => :environment do |t, args|
  require "csv"

  args.with_defaults(csv_filename: "tmp/customers.csv")
  puts "importing from '#{args[:csv_filename]}'"
  unless File.exist?(args[:csv_filename])
    puts "File #{args[:csv_filename]} doesn't exist"
    exit 1
  end

  puts "OK to delete ALL existing company records? If so, enter 'y'; if not, enter anything else."
  if STDIN.gets.strip.downcase != "y"
    exit
  end

  Company.destroy_all
  puts "importing..."

  CSV.foreach(args[:csv_filename], headers: true) do |row|
    company = Company.create!(name: row.fetch("Company"))
    if row.fetch("Address1").present?
      company.addresses.create!(
        company: company,
        line_1: row.fetch("Address1"),
        line_2: row.fetch("Address2"),
        line_3: row.fetch("Address3"),
        city:   row.fetch("City"),
        state:  row.fetch("State"),
        zip:    row.fetch("Zip"),
      )
    end
    ["Phone1", "Phone2"].each do |phone_field|
      if row.fetch(phone_field).present?
        company.phone_numbers.create!(number_type: "phone", number: phone_field)
      end
    end

    ["Fax1", "Fax2"].each do |fax_field|
      if row.fetch(fax_field).present?
        company.phone_numbers.create!(number_type: "fax", number: fax_field)
      end
    end

    if row.fetch("Email").present?
      company.email_addresses.create!(address: row.fetch("Email"))
    end
  end

  [Company, CompanyAddress, CompanyPhoneNumber, CompanyEmailAddress].each do |model|
    puts "now #{model.count} of #{model.name}"
  end
end
