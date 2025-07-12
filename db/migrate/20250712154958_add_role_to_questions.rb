class AddRoleToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :role, :string
  end
end
