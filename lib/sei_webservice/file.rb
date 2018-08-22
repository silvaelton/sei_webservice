module SeiWebservice
  class File
    attr_accessor :file_url, :file

    def initialize(file_url, file_name)
      @file_url   = file_url
      @file_name  = file_name
      @file       = set_file
    end

    def image_to_pdf
      pdf = Prawn::Document.new
      pdf.image @file, fit: [600,600], position: :center
    rescue Exception => e
      p e
    end

    private

    def set_file
      open(URI.parse(@file_url))
    rescue Exception => e
      raise e
    end

  end
end