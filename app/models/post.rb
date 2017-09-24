class Post < ApplicationRecord

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  date_flag :published_at
  # == Relationships ========================================================

  belongs_to :user
  belongs_to :category
  belongs_to :upload

  # == Validations ==========================================================

  validates :title, :body, :slug, presence: true
  validates :category_id, :user_id, presence: true, unless: :is_static?

  # == Scopes ===============================================================

  scope :static,       -> (show_static = true) { where(is_static: show_static) }
  scope :listed,       -> (show_listed = true) { where(is_listed: show_listed) }
  scope :nav_posts,    -> { static.listed }
  scope :listed_posts, -> { includes(:user, :category).static(false).listed.
    published.newest_first
  }
  scope :newest_first, -> { order(published_at: :desc) }

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

  def to_param
    slug
  end

  def other_posts(limit: 6)
    self.class.where("id != ?", id).listed_posts.limit(limit)
  end

  def parsed_body
    GitHub::Markdown.render_gfm(body).html_safe
  end

end
