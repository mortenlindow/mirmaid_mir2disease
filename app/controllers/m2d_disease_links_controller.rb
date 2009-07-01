class M2dDiseaseLinksController < ApplicationController
  layout "application"
  protect_from_forgery :only => [:create, :update, :destroy]
  
  # GET /m2d_disease_links
  # GET /m2d_disease_links.xml
  def index
    @m2d_disease_links = nil
    
    params[:page] ||= 1
        
    if params[:mature_id]
      @m2d_disease_links = Mature.find_rest(params[:mature_id]).m2d_disease_links
    elsif params[:m2d_disease_id]
      @m2d_disease_links = M2dDisease.find_rest(params[:m2d_disease_id]).m2d_disease_links
    end

    respond_to do |format|
      format.html do
        if @m2d_disease_links # subselect
          @m2d_disease_links = M2dDiseaseLink.paginate @m2d_disease_links.map{|x| x.id}, :page => params[:page], :per_page => 12, :order => "mirna, mature_id"
        else #all
          @m2d_disease_links = M2dDiseaseLink.paginate :page => params[:page], :per_page => 12, :order => "mirna, mature_id"
        end        
      end
      format.xml do
        @m2d_disease_links = M2dDiseaseLink.find(:all) if !@m2d_disease_links
        render :xml => @m2d_disease_links
      end
    end
  end

  # GET /m2d_disease_links/1
  # GET /m2d_disease_links/1.xml
  def show
    @m2d_disease_link = M2dDiseaseLink.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @m2d_disease_link }
    end
  end
  
end
