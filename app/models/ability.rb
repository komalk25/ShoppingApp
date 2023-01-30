# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Seller)
      can :read, :all
      can [:create, :update], Product, :seller_id => user.id
      cannot :read, Cart
    elsif user.is_a?(User)
      can :read, Product
      can :read, Cart
      can :reduce_quantity, Cart
      can :destroy, Cart
      can :create, Cart, :product_id
    else
      can :read, :all
    end
  end
end
