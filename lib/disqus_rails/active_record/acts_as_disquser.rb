module DisqusRails
  module Disquser
    module ActiveRecordMethods
      def acts_as_disquser(attributes={})

        define_method :disqus_params do
          data = {}

          if attributes.has_key?(:id)
            if attributes[:id].is_a? Proc
              data[:id] = instance_eval &attributes[:id]
            else
              data[:id] = send attributes[:id]
            end
          else
            data[:id] = self.id
          end

          data[:id] = data[:id].to_s

          if attributes.has_key?(:id_suffix)
            if attributes[:id_suffix].is_a? Proc
              data[:id] = data[:id].to_s + "-" + (instance_eval &attributes[:id_suffix])
            elsif attributes[:id_prefix].is_a? Symbol
              data[:id] = (send attributes[:id_suffix]) + "-" + data[:id].to_s
            else
              data[:id] = data[:id].to_s + "-" + attributes[:id_suffix]
            end
          end

          if attributes.has_key?(:id_prefix)
            if attributes[:id_prefix].is_a? Proc
              data[:id] = (instance_eval &attributes[:id_prefix]) + "-" + data[:id].to_s
            elsif attributes[:id_prefix].is_a? Symbol
              data[:id] = (send attributes[:id_prefix]) + "-" + data[:id].to_s
            else
              data[:id] = attributes[:id_prefix] + "-" + data[:id].to_s
            end
          end

          if attributes.has_key?(:username)
            if attributes[:username].is_a? Proc
              data[:username] = instance_eval &attributes[:username]
            else
              data[:username] = send attributes[:username]
            end
          end

          if attributes.has_key?(:email)
            if attributes[:email].is_a? Proc
              data[:email] = instance_eval &attributes[:email]
            else
              data[:email] = send attributes[:email]
            end
          end

          if attributes.has_key?(:avatar)
            if attributes[:avatar].is_a? Proc
              data[:avatar] = instance_eval &attributes[:avatar]
            else
              data[:avatar] = send attributes[:avatar]
            end
          end

          data
        end
      end
    end
  end
end
