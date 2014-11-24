module BaseDataInteractions
  extend ActiveSupport::Concern

  module ClassMethods
    def find(id)
      all.each do |item|
        return item if item.id == id
      end
      return nil
    end
  end
end