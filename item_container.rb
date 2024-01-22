module ItemContainer
    module ClassMethods
    end
  
    module InstanceMethods
      def add_item(item)
        @items ||= []
        @items << item
      end
  
      def remove_item
        @items.pop
      end
  
      def delete_items
        @items.clear
      end
  
      def method_missing(method_name, *arguments, &block)
        if method_name.to_s =~ /^show_all_/
          @items.each { |item| puts item }
        else
          super
        end
      end
    end
  
    def self.included(base)
      base.extend ClassMethods
      base.include InstanceMethods
    end
  end