class Draftable::PresenterCollection < Array
  def method_missing(name, *args)
    if first.respond_to?(name)
      first.send(name)
    else
      super
    end
  end
end