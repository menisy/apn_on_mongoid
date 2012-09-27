module APN
  class Application
    
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name
    field :identifier
    field :certificate

    #index identifier: 1, :unique => true, :background => true
    
    has_many :subscriptions, :class_name => "APN::Subscription", :inverse_of => :application
    has_many :groups, :class_name => 'APN::Group', :dependent => :destroy
    has_many :devices, :class_name => 'APN::Device', :dependent => :destroy
    has_many :notifications, :through => :devices, :dependent => :destroy
    
  end
end