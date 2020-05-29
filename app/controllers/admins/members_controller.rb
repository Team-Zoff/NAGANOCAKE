class Admins::MembersController < ApplicationController
	def index
		@members = Member.page(params[:page]).reverse_order
	end
	def show
		@member = Member.find(params[:id])
	end
	def edit
		@member = Member.find(params[:id])
		@deleted_status_Invalid = @member.deleted_status == "Invalid"
        @deleted_status_Validity = @member.deleted_status == "Validity"
	end
	def update
		@member = Member.find(params[:id])
		if @member.update!(member_params)
			redirect_to admins_member_path
		else
			render :edit
		end
	end
	private
	def member_params
		params.require(:member).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:telephone,:email,:address,:deleted_status)
    end
end