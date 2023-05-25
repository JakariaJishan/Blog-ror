# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new
    # if user.role == 'admin'
    #   can :manage, :all
    # else
    #   can :manage, Post, author_id: user.id
    #   # can :manage, Comment, author_id: user.id
    #   can :read, :all
    # # can :destroy, Post if user.role == 'Admin'
    # end

   #  user ||= User.new # guest user (not logged in)
   #  case user.role
   #     when "admin" #-> use double quotes for evaluating strings
   #        can :manage, :all
   #     when "user"
   #        can :manage, [Post, Comment], author_id: user.id
   #     end

   return unless user.present?
    can :read, :all
    can :create, :all
    can :destroy, Post do |post|
      post.author == user
    end
    can :destroy, Comment do |comment|
      comment.author == user
    end

    return unless user.role == 'admin'

    can :manage, :all
    can :destroy, Post
    can :destroy, Comment
  end
end
