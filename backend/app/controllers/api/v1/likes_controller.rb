module Api
  module V1
    class LikesController < ApiController
      skip_before_action :verify_authenticity_token, only: %i[create destroy]
      before_action :set_likeable, only: %i[create]
      before_action :set_like, only: [:destroy]

      def create
        like = @likeable.likes.new(like_params)

        if like.save
          render json: like, status: :created
        else
          render json: { errors: like.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @like.destroy
          render json: { message: 'Successfully removed like' }, status: :ok
        else
          render json: { errors: @like.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def most_liked_days
        render json: Like.most_liked_days_of_week
      end

      def like_streaks
        render json: Like.like_streaks
      end

      private

      def set_likeable
        @likeable_type = params[:likeable_type].classify
        @likeable = @likeable_type.constantize.find(params[:likeable_id])
      end

      def set_like
        @like = Like.find(params[:id])
      end

      def like_params
        params.require(:like).permit(:date, :user_id)
      end
    end
  end
end
