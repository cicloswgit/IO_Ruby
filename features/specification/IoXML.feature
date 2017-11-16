Feature: Io XML

@ignore
Scenario: Write XML
	Given I create an XML structure
	When I send then to Builder
	Then I generate a new XML archive
	
Scenario: Read XML
	Given I read a XML archive
	When I see its tags
	Then I print this