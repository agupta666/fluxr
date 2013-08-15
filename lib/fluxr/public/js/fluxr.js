var Fluxr = (function() {
  function Fluxr() {
    this.slides = [];
    this.current = 0;
  }

  Fluxr.prototype.showSlide = function(slideNumber) {
    console.log('Displaying slide ' + this.current);
    self = this;
    $('#main').fadeOut(400, function(){
      var slideContent = $(self.slides[self.current]).html();
      $('#main').html(slideContent);
      $('#main').fadeIn(400);
    });
  };

  Fluxr.prototype.next = function() {
    if (this.current < (this.slides.length - 1) ) {
      this.current++;
      this.showSlide();
    };
  }

  Fluxr.prototype.previous = function() {
    if (this.current > 0 ) {
      this.current--;
      this.showSlide();
    }
  }

  Fluxr.prototype.first = function() {
    if (this.current != 0 ) {
      this.current = 0;
      this.showSlide();
    }
  }


  Fluxr.prototype.last = function() {
    if (this.current != (this.slides.length - 1) ) {
      this.current = this.slides.length - 1;
      this.showSlide();
    }
  }


  Fluxr.prototype.installKeyHandlers = function() {
  	var self = this;

  	$(document).keyup(function(event) {
      if (event.keyCode == 37 ) {     // Left
      	self.previous();
      } 
      else if (event.keyCode == 39) { // Right
      	self.next();
      }
      else if (event.keyCode == 35) { // End
        self.last();
      }
      else if (event.keyCode == 36) { // Home
        self.first();
      }
      else {
      	console.log('KeyCode=', event.keyCode);
      }
      
  	});
  };

  Fluxr.prototype.start = function() {
  	this.slides = $('#slides > .slide')
    this.installKeyHandlers();
  	this.showSlide();
  };

  return Fluxr;

})();
