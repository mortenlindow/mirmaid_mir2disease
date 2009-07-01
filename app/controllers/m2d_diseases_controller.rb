class M2dDiseasesController < ApplicationController
  layout "application"
  protect_from_forgery :only => [:create, :update, :destroy]
  
  # GET /m2d_diseases
  # GET /m2d_diseases.xml
  def index
    @m2d_diseases = nil
    
    params[:page] ||= 1
        
    respond_to do |format|
      format.html do
        if @m2d_diseases # subselect
          @m2d_diseases = M2dDisease.paginate @m2d_diseases.map{|x| x.id}, :page => params[:page], :per_page => 12, :order => :name
        else #all
          @m2d_diseases = M2dDisease.paginate :page => params[:page], :per_page => 12, :order => :name
        end        
      end
      format.xml do
        @m2d_diseases = M2dDisease.find(:all) if !@m2d_diseases
        render :xml => @m2d_diseases
      end
    end
  end

  # GET /m2d_diseases/1
  # GET /m2d_diseases/1.xml
  def show
    @m2d_disease = nil
    
    if params[:m2d_disease_link_id]
      @m2d_disease = M2dDiseaseLink.find(params[:m2d_disease_link_id]).m2d_disease
    else
      @m2d_disease = M2dDisease.find_rest(params[:id])
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @m2d_disease }
    end
  end
  
end
