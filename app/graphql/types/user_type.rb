Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :id, !types.ID
  field :name, !types.String
  field :image_url, !types.String do
    resolve -> (obj, args, ctx) {
      obj.upload.file.url(:square_200)
    }
  end
end
