class QueryController < ApplicationController
	def index
	end
	
	# Dynamic querying by GET request. Does not support comparison groups.
	def results
		@subdomain = params[:subdomain]
		@dattributes = params[:dattribute]
		@dconditions = params[:dcondition]
		@range = params[:range]
		@rattribute = params[:rattribute]
		@rconditions = params[:rcondition]
		literal = params[:literal]
		
		if @dattributes == nil || @dconditions == nil
			@dattributes = []
			@dconditions = []
		end
		
		if @subdomain != nil
			results = Student.joins(@subdomain.to_sym, @range.to_sym)
		else
			results = Student.joins(@range.to_sym)
		end
			
		if literal
			clause = "("
			@dattributes.zip(@dconditions).each do | dattr, dcond |
				clause = clause + dattr + dcond
			end
			clause = clause + ")"
			results = results.where(clause)
		else
			@dattributes.zip(@dconditions).each do | dattr, dcond |
				results = results.where(dattr+dcond)
			end
		end
		
		results = results.select(@rattribute)
		@counts = Array.new
		for rcond in @rconditions
			@counts.push(results.where(@rattribute+rcond).count)
		end
		render "/query/results"
	end
	
	# Dynamic querying by GET or POST.
	def search
		# This line for testing purposes only. Set the parameters for the query here.
		# Ideally, these will all be set and determined by the form on the query/index page.
		params = {group: [{dattribute: ["act", "act"], dcondition: [">'20'", "<='25'"]}, {dattribute: ["act", "act"], dcondition: [">'15'", "<='20'"]}], range: "sections", rattribute: "grade", rcondition: ["='A'", "='B'", "='C'", "='D'", "='F'"]}
		
		@counts = Array.new
	
		@groups = params[:group]
		@range = params[:range]
		@rattribute = params[:rattribute]
		@rconditions = params[:rcondition]
		literal = params[:literal]
	
		for item in @groups
			@subdomain = item[:subdomain]
			@dattributes = item[:dattribute]
			@dconditions = item[:dcondition]
			
			if @dattributes == nil || @dconditions == nil
				@dattributes = []
				@dconditions = []
			end
			
			if @subdomain != nil
				results = Student.joins(@subdomain.to_sym, @range.to_sym)
			else
				results = Student.joins(@range.to_sym)
			end
				
			if literal
				clause = "("
				@dattributes.zip(@dconditions).each do | dattr, dcond |
					clause = clause + dattr + dcond
				end
				clause = clause + ")"
				results = results.where(clause)
			else
				@dattributes.zip(@dconditions).each do | dattr, dcond |
					results = results.where(dattr+dcond)
				end
			end
			
			results = results.select(@rattribute)
			sub_counts = Array.new
			for rcond in @rconditions
				sub_counts.push(results.where(@rattribute+rcond).count)
			end
			@counts.push(sub_counts)
		end
		render "/query/search"
	end
	
end