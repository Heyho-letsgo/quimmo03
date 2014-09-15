module AgencesHelper

  def image_for(agence)
    if agence.image.exists?
      image_tag(agence.image.url)
    else
      image_tag('placeholder.png')
    end
  end

end
