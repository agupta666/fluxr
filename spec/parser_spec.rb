$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'fluxr/slide'
require 'fluxr/parser'

describe "parser" do
  it "parses multiple empty slides" do
    text = %q{
      slide("Slide 1") {}
      slide("Slide 2") {}
      slide("Slide 3") {}
    }

    slides = Fluxr::Parser.new.parse(text)
  	slides.count.should == 3
  end

  it "should parse titles of multiple empty slides" do
  	text = %q{
      slide("Slide 1") {

      }
      slide("Slide 2") {

      }
    }

    slides = Fluxr::Parser.new.parse(text)
    slides.first.title.should == "Slide 1"
    slides.last.title.should  == "Slide 2"
  end

  it "should parse titles of single nonempty slides" do
    text = %q{
      slide("Slide 1") {%q{# Slide 1 Content ...}}
    }
    slides = Fluxr::Parser.new.parse(text)
    slides.first.title.should == "Slide 1"
    slides.first.content.should == "# Slide 1 Content ..."
  end

  it "should parse titles of multiple nonempty slides" do
    text = %q{
      slide("Slide 1") {%q{# Slide 1 Content ...}}
      slide("Slide 2") {%q{# Slide 2 Content ...}}
      slide("Slide 3") {%q{# Slide 3 Content ...}}
    }
    slides = Fluxr::Parser.new.parse(text)
    slides.count.should == 3
    slides.first.title.should == "Slide 1"
    slides.first.content.should == "# Slide 1 Content ..."
    slides.last.title.should == "Slide 3"
    slides.last.content.should == "# Slide 3 Content ..."
  end


end