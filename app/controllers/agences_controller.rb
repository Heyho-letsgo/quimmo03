class AgencesController < ApplicationController

def index
@agences = Agence.all
end

end
