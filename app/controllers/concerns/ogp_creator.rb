class OgpCreator
  require 'mini_magick'
  BASE_IMAGE_PATH = './app/assets/images/'
  #GRAVITY = 'center'
  GRAVITY = 'west'
  TEXT_POSITION = '20,20'
  BASE_FONT_PATH = './app/assets/fonts/'
  FONT_SIZE = 65
  INDENTION_COUNT_WE = 5
  INDENTION_COUNT_NS = 8
  ROW_LIMIT = 8

  def self.build(text)
    position,path,font =random_photo()
    text = prepare_text(text,position)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH + path)
    image.combine_options do |config|
      config.font BASE_FONT_PATH + font
      config.fill 'black'
      config.gravity position
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
      config.stroke 'white'
      config.strokewidth 5
    end
    image.combine_options do |config|
      config.font BASE_FONT_PATH + font
      config.fill 'black'
      config.gravity position
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
    end
  end


  private
  def self.prepare_text(text,position)
    if position == "north" || position == "south"
      text.to_s.scan(/.{1,#{INDENTION_COUNT_NS}}/)[0...ROW_LIMIT].join("\n")
    else
      text.to_s.scan(/.{1,#{INDENTION_COUNT_WE}}/)[0...ROW_LIMIT].join("\n")
    end
  end

  def self.random_photo
    position = ["north","west","east","south"].sample
    photo =  position + format("%03d.jpg",(1..4).to_a.sample)
    font = ["Jiyucho.ttf","LogoTypeGothic.otf","rounded-mgenplus-1cp-medium.ttf"].sample
    return position,photo,font
  end
end
