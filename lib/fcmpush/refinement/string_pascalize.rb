# frozen_string_literal: true

module Fcmpush
  module Refinement
    module StringPascalize
      SEP = '_'.freeze

      refine String do
        def pascalize
          split(SEP).map(&:capitalize).join
        end
      end
    end
  end
end

