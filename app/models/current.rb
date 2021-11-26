  class Current < ActiveSupport::CurrentAttributes
    # makes Current.user accessible in view files.
    attribute :headhunter
    attribute :worker
  end