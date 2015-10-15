class CreateGithubWebhookHandlerEvents < ActiveRecord::Migration
  def change
    create_table :github_webhook_handler_events do |t|
      t.string :type
      t.text :payload

      t.timestamps null: false
    end
  end
end
