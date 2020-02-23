attributes :id, if: lambda { |r| r.valid? }
attributes :prompt, :optional
attributes type_represent: :type

node :errors, if: lambda { |r| r.invalid? } do |m|
  m.errors.full_messages
end
