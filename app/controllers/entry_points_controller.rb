class EntryPointsController < ApplicationController

    def index
      @entry_point = EntryPoint.all
    end

end
