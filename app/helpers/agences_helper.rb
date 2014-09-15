module AgencesHelper

  def image_for(movie)
    if movie.image.exists?
      image_tag(movie.image.url)
    else
      image_tag('placeholder.png')
    end
  end

end
