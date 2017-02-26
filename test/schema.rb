ActiveRecord::Schema.define(:version => 0) do
  create_table :users do |t|
    t.string :email, :password, :password_confirmation
  end
end
