module SeiWebservice
  class File
    attr_accessor :file_url, :file

    def initialize(file_url, file_name)
      @file_url   = file_url
      @file_name  = file_name
      @file       = set_file
    end

    def to_base64
    end

    def image_to_pdf
    end

    private

    def set_file
      open(URI.parse(@url))
    rescue Expection => e
      raise e
    end

  end
end