Types::PostType = GraphQL::ObjectType.define do
  name 'Post'

  field :id, !types.ID
  field :title, !types.String
  field :slug, !types.String
  field :subtitle, types.String
  field :body_html, !types.String do
    resolve -> (obj, args, ctx) {
      obj.parsed_body
    }
  end
  field :body_markdown, !types.String do
    resolve -> (obj, args, ctx) {
      obj.body
    }
  end
  field :summary, types.String
  field :published_at, !types.String
  field :updated_at, !types.String
  field :hero_image_url, !types.String do
    resolve -> (obj, args, ctx) {
      obj.upload.file.url(:wide_1440)
    }
  end
  field :square_image_url, !types.String do
    resolve -> (obj, args, ctx) {
      obj.upload.file.url(:square_800)
    }
  end

  field :author, Types::UserType do
    resolve -> (obj, args, ctx) {
      obj.user
    }
  end

  field :category, Types::CategoryType do
    resolve -> (obj, args, ctx) {
      obj.category
    }
  end
end
