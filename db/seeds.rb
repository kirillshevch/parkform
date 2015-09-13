require 'seeder'

Question.destroy_all
Response.destroy_all
Form.destroy_all

Seeder.add_user
Seeder.create_forms_with_responces

