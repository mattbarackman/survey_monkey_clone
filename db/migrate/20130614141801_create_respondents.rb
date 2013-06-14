class CreateRespondents < ActiveRecord::Migration
  def change
    create_table :respondents do |t|
      t.references :user
      t.references :survey
    end
  end
end
