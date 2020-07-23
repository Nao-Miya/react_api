module Api
  module V1
    class EventsController < ApplicationController
      before_action :set_event, only: [:show, :update, :destroy]
      #skip_before_action :verify_authenticity_token

      def index
        events = Event.order(id: :asc)
        test = events.map{|item| item.attributes.slice("id", "title", "body")}
        render json: test.to_json
        #render json: { status: 'SUCCESS', message: 'Loaded posts', data: events }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the event', data: @event }
      end

      def create
        event = Event.new(event_params)
        if event.save
          render json: { status: 'SUCCESS', data: event }
        else
          render json: { status: 'ERROR', data: event.errors }
        end
      end

      def destroy
        @event.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the event', data: @event }
      end

      def update
        if @event.update(event_params)
          render json: { status: 'SUCCESS', message: 'Updated the event', data: @event }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @event.errors }
        end
      end

      private

      def set_event
        @event = Event.find(params[:id])
      end

      def event_params
        params.require(:event).permit(:title, :body)
      end
    end
  end
end