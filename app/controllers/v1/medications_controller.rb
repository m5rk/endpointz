module V1
  class MedicationsController < AuthenticatedController
    def create
      medication = current_user.medications.create(name: params[:name])

      render jsonapi: medication, status: :created
    end

    def index
      medications = current_user.medications.reorder(:name)

      render jsonapi: medications
    end
  end
end
