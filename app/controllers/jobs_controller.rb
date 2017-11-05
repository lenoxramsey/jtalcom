class JobsController < ApplicationController
    def index
        @jobs = Job.all
    end
    
    def show
    end
    
    def new
        if current_user.recruiter?
            @job = Job.new
        else
            redirect_to root_path, notice: 'Please sign up for recruiter account to post jobs.'
        end
    end
    
    def edit
    end
    
    def create
        @job = current_user.jobs.create(job_params)
        @job.save
        
        respond_to do |format|
            if @job.save
                format.html { redirect_to @job, notice: 'Your job listing was successfully created.' }
                format.json { render :show, status: :created, location: @job }
            else
                format.html { render :new }
                format.json { render json: @job.errors, status: :unprocessable_entity }
            end
        end        
    end
    
    def update
        respond_to do |format|
            if @job.update(job_params)
                format.html { redirect_to @job, notice: 'Your job listing was successfully updated.' }
                format.json { render :show, status: :ok, location: @job }
            else
                format.html { render :edit }
                format.json { render json: @job.errors, status: :unprocessable_entity }
            end
        end        
    end

    def destroy
        @job.destroy
        respond_to do |format|
          format.html { redirect_to jobs_url, notice: 'Your listing was successfully destroyed.' }
          format.json { head :no_content }
        end        
    end
    
    protected
    
    def job_params
       params.require(:job).permit(:title, :description, :requirements, :location) 
    end
end
