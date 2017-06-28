class RsoController < ApplicationController
  def index
  end

  def manage
    @rsos = Rso.all
  end
end
