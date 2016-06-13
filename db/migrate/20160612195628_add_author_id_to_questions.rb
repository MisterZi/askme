class AddAuthorIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :author_id, :integer
  end
end
