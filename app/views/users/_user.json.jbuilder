json.extract! user, :id, :admin, :password, :email, :address, :name, :last_name, :image, :birth_date, :security_question, :security_answer, :last_login, :created_at, :updated_at
json.url user_url(user, format: :json)
