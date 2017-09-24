Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :posts, !types[Types::PostType] do
    description "All of the published posts from this blog"
    resolve -> (obj, args, ctx) {
      Post.published.all
    }
  end
end
