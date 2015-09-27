class TargetGroup < ActiveRecord::Base
  belongs_to :panel_provider
  belongs_to :parent, class_name: 'TargetGroup', dependent: :destroy
  has_many :children, class_name: 'TargetGroup', foreign_key: 'parent_id', dependent: :destroy
  has_and_belongs_to_many :countries

  scope :roots, -> { where(parent_id: nil) }

  def create_children(level = 2)
    return if level <= 0

    0.upto(2) do
      TargetGroup.create(name: "TargetGroup", panel_provider: panel_provider, external_id: SecureRandom.hex, secret_code: SecureRandom.hex, parent: self)
    end
    children.sample.create_children(level-1)
  end
end
