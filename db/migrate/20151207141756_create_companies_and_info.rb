class CreateCompaniesAndInfo < ActiveRecord::Migration

  def change
    create_table :companies do |t|
      t.string :name, null: false
    end

    add_index :companies, :name, unique: true

    create_table :company_addresses do |t|
      t.integer :company_id, null: false
      t.string :line_1, null: false
      t.string :line_2
      t.string :line_3
      t.string :city
      t.string :state
      t.string :zip
    end

    add_foreign_key :company_addresses, :companies
    add_index :company_addresses, :company_id

    create_table :company_phone_numbers do |t|
      t.integer :company_id, null: false
      t.string :number, null: false
      t.string :type, null: false
    end

    add_foreign_key :company_phone_numbers, :companies
    add_index :company_phone_numbers, :company_id

    create_table :company_email_addresses do |t|
      t.integer :company_id, null: false
      t.string :address, null: false
    end

    add_foreign_key :company_email_addresses, :companies
    add_index :company_email_addresses, :company_id
  end
end
