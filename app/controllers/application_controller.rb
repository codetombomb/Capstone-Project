class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  wrap_parameters format: [] 

  def current_guest 
    @current_guest ||= Guest.find_by(id: session[:guest_id]) 
  end

  private

  def is_authorized 
    render json: { errors: { Guest: "Not Authorized" } }, status: :unauthorized unless @current_guest
  end

  def is_admin 
    permitted = current_guest.admin? 
    render json: { errors: { Guest: "Not Admin" } }, status: :forbidden unless permitted
  end

  def is_owner
    permitted = @item.guest_id == current_guest.id
    render json: { errors: { Guest: "Not Owner" } }, status: :forbidden unless permitted
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { errors: NotFound.message }, status: :not_found
  end
end
