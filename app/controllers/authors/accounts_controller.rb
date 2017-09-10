module Authors
  class AccountsController < AuthorController

    def edit

    end

    def update_info
      if current_author.update(author_info_params)
        flash[:success] = 'Successfully Updated'
      else
        flash[:warning] = current_author.display_error_messages
      end
      redirect_to authors_edit_profile_path
    end

    def get_password

    end

    def change_password
      if current_author.valid_password?(author_password_params[:current_password])
        if current_author.chg_password(author_password_params)
          sign_in(current_author, bypass: true)
          flash[:success] = 'Password Changed Successfully'
        else
          flash[:danger] = current_author.display_error_messages
        end

      else
        flash[:danger] = 'Incorrect Password' #current_author.errors.full_messages.join('. ') << '.'
      end
      redirect_to authors_edit_password_path

    end

    private
    def author_info_params
      params.require(:author).permit(:name, :email, :bio)
    end

    def author_password_params
      params.require(:author).permit(:current_password, :new_password, :new_password_confirmation)
    end

  end
end