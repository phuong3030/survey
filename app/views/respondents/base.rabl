attributes :id, if: lambda { |r| r.valid? }
attributes :first_name, :last_name

child profile: :profile do
  attributes :gender, :department
end

node :errors, if: lambda { |r| r.invalid? } do |m|
  m.errors.full_messages
end
