module V1
  class MedicationsController < AuthenticatedController
    def create
      medication = current_user.medications.create(name: params[:name])

      render json: medication, status: :created
    end
  end
end
