# frozen_string_literal: true

class Site::HomeController < ApplicationController
  layout 'site'

  def index
    @caregories = Category.all
  end
end
