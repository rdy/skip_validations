module SkipValidations
  def skip_validations(*attributes)
    attributes.collect!(&:to_sym)
    instance_eval do
      define_method :skip_validations do
        if errors.present?
          err = errors.dup
          errors.clear
          err.reject {|attr, message| attributes.include?(attr.to_sym) }.each {|attr, message| self.errors.add(attr, message)}
        end
      end

      define_method :valid? do
        super
        skip_validations
        errors.empty?
      end
    end
  end
end