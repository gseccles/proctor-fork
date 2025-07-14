class Role
  # Define available roles
  TYPES = [
    'software_engineer',
    'database_engineer',
    'engineering_manager',
    'site_reliability_engineer',
    'ux_designer',
    'product_manager'
  ].freeze

  # Class method to get all roles
  def self.all
    TYPES.map { |role| new(role) }
  end

  # Class method to get formatted roles for display/API
  def self.for_select
    TYPES.map { |role| { id: role, name: role.titleize } }
  end

  # Instance methods
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def name
    id.titleize
  end

  def ==(other)
    other.is_a?(Role) && other.id == id
  end
end 