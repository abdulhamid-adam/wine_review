class Wine < ActiveRecord::Base
	include ActiveModel::Validations

	VARIETALS = ["Barbera", "Chardonnay", "Merlot"]

	validates :name, :year, :country, presence: true

	validates :year,
				numericality: {only_integer: true},
				if: "year.present?"

	validates :varietal,
				inclusion: {in: VARIETALS,
				message: "%{value} is not a valid varietal"}
end
