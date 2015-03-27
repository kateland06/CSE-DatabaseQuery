class QueryController < ApplicationController
	def index
	end
	
	def results
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
		
		results = Student.joins(@range.to_sym)
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
end