json.extract! membership, :id, :user_id, :team_id, :owner, :created_at, :updated_at
json.url membership_url(membership, format: :json)
