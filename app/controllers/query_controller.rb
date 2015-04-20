require 'GraphStatics'

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
		# These three lines for testing purposes only. Set the parameters for the query here.
		# Ideally, these will all be set and determined by the form on the query/index page.
		params = {group: [{subdomain: "sections", dattribute: ["semester", "year_offered"], dcondition: ["= 'Fall'", "= '2011'"], name: "Fall 2011"}, {subdomain: "sections", dattribute: ["semester", "year_offered"], dcondition: ["= 'Spring'", "= '2012'"], name: "Spring 2012"}, {subdomain: "sections", dattribute: ["semester", "year_offered"], dcondition: ["= 'Summer'", "= '2012'"], name: "Summer 2012"}, {subdomain: "sections", dattribute: ["semester", "year_offered"], dcondition: ["= 'Fall'", "= '2012'"], name: "Fall 2012"}, {subdomain: "sections", dattribute: ["semester", "year_offered"], dcondition: ["= 'Spring'", "= '2013'"], name: "Spring 2013"}, {subdomain: "sections", dattribute: ["semester", "year_offered"], dcondition: ["= 'Summer'", "= '2013'"], name: "Summer 2013"}], range: "sections", rattribute: "grade", rcondition: ["= 'A'", "= 'B'", "= 'C'", "= 'D'", "= 'F'"]}
		v_type = "polar"
		v_data = "count"
		
		@counts = Array.new
		@visualization
		categories = Array.new
		graph = Array.new
		title = "#{v_data} of Students" 
	
		@groups = params[:group]
		@range = params[:range]
		@rattribute = params[:rattribute]
		@rconditions = params[:rcondition]
		literal = params[:literal]
	
		i = 0
		for item in @groups
			subdomain = item[:subdomain]
			dattributes = item[:dattribute]
			dconditions = item[:dcondition]
			g_name = item[:name]
			
			if dattributes == nil || dconditions == nil
				dattributes = []
				dconditions = []
			end
			
			if v_type == "polar"
				categories.push(g_name)
			end
			
			if subdomain != nil
				results = Student.joins(subdomain.to_sym, @range.to_sym)
			else
				results = Student.joins(@range.to_sym)
			end
				
			if literal
				clause = "("
				dattributes.zip(dconditions).each do | dattr, dcond |
					clause = "#{clause} #{dattr} #{dcond}"
				end
				clause = clause + ")"
				results = results.where(clause)
			else
				dattributes.zip(dconditions).each do | dattr, dcond |
					results = results.where("#{dattr} #{dcond}")
				end
			end
			
			results = results.select(@rattribute)
			sub_counts = Array.new
			j = 0
			for rcond in @rconditions
				count = results.where("#{@rattribute} #{rcond}").count
				sub_counts.push(count)
				if v_type == "stacked"
					graph.push({name: "#{g_name} where #{@rattribute} #{rcond}", data: [count], stack: g_name})
				elsif v_type == "polar"
					if i == 0
						graph.push({name: rcond, data: [count]})
					else
						temp = graph.delete_at(j)
						temp[:data].push(count)
						graph.insert(j, temp)
					end
				else
					graph.push({name: "#{g_name} where #{@rattribute} #{rcond}", data: [count], stack: "#{g_name} & #{rcond}"})
				end
				j = j + 1
			end
			i = i + 1
			@counts.push(sub_counts)
		end
		
		data = ""
		graph.each { |element| 
			data = data + element.to_s + ","
		}
		data = data[0...-1]
		data.gsub! ':name=>', 'name:'
		data.gsub! ':data=>', 'data:'
		data.gsub! ':stack=>', 'stack:'
		data = "[" + data + "]"
		
		if v_type == "stacked" && v_data == "percent"
			categories.push(@rattribute)
			@visualization = GraphStatics.createHistogramPercentage("#{@rattribute} #{title}", categories, title, data)
		elsif v_type == "polar"
			@visualization = GraphStatics.createLineGraph("#{@rattribute} #{title}", "", categories, title, data, "")
		else
			categories.push(@rattribute)
			@visualization = GraphStatics.createHistogram("#{@rattribute} #{title}", categories, title, data)
		end
		
		render "/query/search"
	end
	
end