module APN
  class Application
    
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name
    field :identifier
    field :certificate

    #index identifier: 1, :unique => true, :background => true
    
    has_many :devices, :class_name => 'APN::Device', :dependent => :destroy
    has_many :notifications, :dependent => :destroy
    
  end
end