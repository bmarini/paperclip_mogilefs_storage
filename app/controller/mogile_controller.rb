class MogileController < ApplicationController
  
  def show    
    path             = request.request_uri
    mogilefs_options = YAML.load_file(File.join(Rails.root, "config", "mogilefs.yml"))[Rails.env].symbolize_keys
    mogile           = MogileFS::MogileFS.new(mogilefs_options[:connection].symbolize_keys)
    
    send_data( mogile.get_file_data(path), :disposition => 'inline' )
  end

end
