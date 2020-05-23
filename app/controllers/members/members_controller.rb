class Members::MembersController < ApplicationController
	def show
		@member = current_member
	end

	def edit
		@member = current_member

	end

	def update
	end

	def withdrawal
	end

	private
	def member_params
		params.require(:member).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:telephone,:email,:address,:delete_status)
  end
end
