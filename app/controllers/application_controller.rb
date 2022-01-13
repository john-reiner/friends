class ApplicationController < ActionController::Base
    include AuthenticateUserConcern
end
