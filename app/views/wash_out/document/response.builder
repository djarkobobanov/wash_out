xml.instruct!
xml.tag! "soap:Envelope", "xmlns:soap" => 'http://schemas.xmlsoap.org/soap/envelope/' do
  if !header.nil?
    xml.tag! "soap:Header" do
      xml.tag! "#{@action_spec[:response_tag]}" do
        wsdl_data xml, header
      end
    end
  end
  xml.tag! "soap:Body" do
    xml.tag! "#{@action_spec[:response_tag]}", 'xmlns'=> @response_namespace do
      wsdl_data xml, result
    end
  end
end
