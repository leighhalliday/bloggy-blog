Types::CategoryType = GraphQL::ObjectType.define do
  name 'Category'

  field :id, !types.ID
  field :slug, !types.String
  field :name, !types.String
  field :vertical_image_url, !types.String do
    resolve -> (obj, args, ctx) {
      obj.upload.file.url(:vertical_620)
    }
  end
  field :updated_at, !types.String
end
