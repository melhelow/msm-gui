class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

   def create
    m= Actor.new
       m.name = params[:the_name]         
       m.bio = params[:the_bio]            
      m.dob = params[:the_dob]            
      m.image = params[:the_image]

    m.save

    redirect_to("/actors")
  end

    def update
    the_id = params[:the_id]
    actor = Actor.find_by(id: the_id)
    
    if actor
      actor.name = params[:the_name] if params[:the_name]
      actor.bio = params[:the_bio] if params[:the_bio]
      actor.dob = params[:the_dob] if params[:the_dob]
      actor.image = params[:the_image] if params[:the_image]
      actor.save
    end
    
    redirect_to("/actors/#{the_id}")
  end
end
