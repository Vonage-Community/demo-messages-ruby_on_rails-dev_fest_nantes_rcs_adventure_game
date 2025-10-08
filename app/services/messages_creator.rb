class MessagesCreator
  attr_reader :data_id

  def initialize(data_id)
    @data_id = data_id
  end

  def create_message
    Vonage.messaging.rcs(
      type: 'card',
      message: card_content,
      opts: card_opts
    )
  end

  private

  def card_content
    content = message_content
    set_base_url_for_media_params(content)
    content.merge(standard_params)
  end
  
  def message_content
    content_lang = data_id.split('-').first
    content_step = data_id.split('-').last
    parse_yaml('message_content.yml')[content_lang][content_step]
  end

  def parse_yaml(filename)
    YAML.load_file(Rails.root.join('data', filename))
  end

  def standard_params
    {
      media_height: "TALL",
      media_force_refresh: false
    }
  end

  def card_opts
    {
      rcs: {
        card_orientation: "VERTICAL",
        image_alignment: "RIGHT"
      }
    }
  end

  def set_base_url_for_media_params(content)
    if content.key?('media_url')
      content['media_url'] = "#{ENV['BASE_URL']}#{content['media_url']}" 
    end
  end
end