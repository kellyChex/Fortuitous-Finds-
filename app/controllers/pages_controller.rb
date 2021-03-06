class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def search
    if !params[:search_string].blank?
      search_string = params[:search_string].strip.downcase
      search_string = search_string.gsub("'", "\''")
      @search = Listing.joins(:user).where('LOWER(users.name)
        LIKE ? OR LOWER(listings.name) LIKE ?', "%#{search_string}%",
          "%#{search_string}%")
      render pages_search_path
    else
      redirect_to :back
    end
  end
end
