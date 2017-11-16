require 'nokogiri'

#Write scenario
Given("I create an XML structure") do
  @builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
    xml.root {
      xml.products {
        xml.widget {
          xml.id_ "10"
          xml.name "Awesome widget"
        }
      }
    }
  end
  
end

When("I send then to Builder") do
    xml = File.new("C:\\DEV\\ioxml.xml", "w+")
    xml.write(@builder.to_xml)
    xml.close
end

Then("I generate a new XML archive") do
  puts @builder.to_xml
end


#Read scenario
Given("I read a XML archive") do
  @doc = Nokogiri::XML(File.open("C:\\DEV\\ioxml.xml")) do |config|
    config.norecover
  end
    
  expect(@doc.at('id').text).to eq '10'
end

When("I see its tags") do
  
end

Then("I print this") do
  puts @doc.to_xml
end