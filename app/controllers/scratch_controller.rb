class ScratchController < ApplicationController
	include RestGraph::RailsUtil
	before_filter :filter_setup_rest_graph

	def me
	    render :text => rest_graph.get('me').inspect
	end

	def feed
	    render :text => rest_graph.get('me/home').inspect
	end

	def wall
	    render :text => rest_graph.get('me/feed').inspect
	end

	private

		def filter_setup_rest_graph
			scope = []
			scope << 'read_stream'
		    rest_graph_setup(:auto_authorize => true, :auto_authorize_scope => scope.join(','))
		end
end
