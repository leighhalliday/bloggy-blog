class Setting < ApplicationRecord

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  # == Validations ==========================================================

  validates :key, presence: true
  validates :key, uniqueness: true

  # == Scopes ===============================================================

  scope :by_key, -> (key) { where(key: key) }

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  def self.load(key)
    @@settings ||= {}
    return @@settings[key] if @@settings[key].present?
    Setting.all.each do |setting|
      @@settings[setting.key.to_sym] = setting
    end
    @@settings[key]
  end

  def self.get(key)
    setting = load(key)
    return case
      when setting.nil?
        Settings::Manager.load_default(key)
      when setting.reference? || setting.image?
        setting.load_reference
      when setting.boolean?
        setting.value == "1"
      else
        setting.value.to_s
    end
  end

  def self.key_from_id(id)
    self.where(id: id).pluck(:key).first
  end

  def self.max_updated_at
    self.maximum(:updated_at)
  end

  # == Instance Methods =====================================================

  def string?
    data_type == "string"
  end

  def text?
    data_type == "text"
  end

  def reference?
    data_type == "reference"
  end

  def code?
    data_type == "code"
  end

  def image?
    data_type == "image"
  end

  def boolean?
    data_type == "boolean"
  end

  def to_s
    case
    when boolean?
      value == "1" ? I18n.t('admin.ans_yes') : I18n.t('admin.ans_no')
    else
      value.to_s
    end
  end

  def load_reference
    return nil unless value.present?
    (ref_class, ref_id) = value.split(",")
    ref_class.constantize.find(ref_id)
  end

  def load_image
    load_reference
  end

end
