class Members::MembersController < ApplicationController
before_action :authenticate_member!
	def show
		@member = current_member
	end

	def edit
		@member = current_member

	end

	def update
		@member = current_member
		if @member.update(member_params)
			redirect_to members_member_path
		else
			render :edit
		end
	end

	def withdrawal
		@member = current_member
	end

	def withdrawal_confirm
		@member = current_member
		@member.deleted_status = 0
		@member.save!
		redirect_to members_path
	end

	private
	def member_params
		params.require(:member).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:telephone,:email,:address,:delete_status)
  end
end
