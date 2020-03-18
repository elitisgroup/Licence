require "prawn"
require_relative "constants"

puts "Generating..."

Prawn::Font::AFM.hide_m17n_warning = true

Prawn::Document.generate("Open Elitis Group Licence.pdf") do
  # Font
  puts "Set font"
  font "Helvetica"

  # Leading
  puts "Set leading"
  default_leading 7.5

  # Title
  puts "Set title"
  text "Open Elitis Group Licence", :size => Sizes::TITLE, :color => Colors::GENERAL
  text "Version G2020.3 (#{Time.now.utc})", :size => Sizes::HEADING, :color => Colors::UNIMPORTANT

  # Description
  puts "Set description"
  text "The Open Elitis Group Licence – the OEGL – aims to provide restrictive terms for smaller development groups.
  ", :size => Sizes::GENERAL, :color => Colors::GENERAL

  # Section 0
  puts "Set section 0"
  text "Section 0 – Definitions", :size => Sizes::HEADING, :color => Colors::HEADING
  text "a)	OEGL: This licence – the Open Elitis Group Licence;
  b)	Program: The copyrighted material licensed under the OEGL;
  c)	Author(s): The copyright holders of the licensed Program;
  d)	Original Source Code: The Program’s code as it was distributed by the Author(s);
  e)	User: The end-user of the Program.
  ", :size => Sizes::GENERAL, :color => Colors::GENERAL

  # Section 1
  puts "Set section 1"
  text "Section 1 – Distribution", :size => Sizes::HEADING, :color => Colors::HEADING
  text "You are allowed to redistribute the Program – modified or not – under the following conditions:
  a)	You credit the Author(s);
  b)	You include a link and/or copy of the Original Source Code and the OEGL.
  You cannot make a profit off of the Program (unless explicitly permitted by the Author(s) in writing).
  ", :size => Sizes::GENERAL, :color => Colors::GENERAL

  # Section 2
  puts "Set section 2"
  text "Section 2 – Modification", :size => Sizes::HEADING, :color => Colors::HEADING
  text "Modifying the Program is permitted under the following conditions:
  a)	You state all changes;
  b)	The Author(s)’s credit remains visible to the User;
  c)	A link and/or copy of the Original Source Code is visible to the User.
  The licence cannot be modified or changed in a way that lessens the restrictions.
  ", :size => Sizes::GENERAL, :color => Colors::GENERAL

  # Section 3
  puts "Set section 3"
  text "Section 3 – Relicensing", :size => Sizes::HEADING, :color => Colors::HEADING
  text "You are allowed to add further restrictions to the licence, however removing limitations is not permitted. You must state all changes.
  
  ", :size => Sizes::GENERAL, :color => Colors::GENERAL
  # ^ required newlines

  # Section 4
  puts "Set section 4"
  text "Section 4 – Liability", :size => Sizes::HEADING, :color => Colors::HEADING
  text "In absolutely no circumstance – unless legally required – will the Author(s) or any other party who modified the Program under the OEGL be accountable for any damages, even if the User was informed previously.
  ", :size => Sizes::GENERAL, :color => Colors::GENERAL

  # Section 5
  puts "Set section 5"
  text "Section 5 – Warranty", :size => Sizes::HEADING, :color => Colors::HEADING
  text "The Program does not come with a warranty of any kind.
  In no situation will the Author(s) be accountable for any defects or inabilities to perform certain actions within the Program; it is provided “as is”.
  ", :size => Sizes::GENERAL, :color => Colors::GENERAL

  # Section 6
  puts "Set section 6"
  text "Section 6 – Licence Revisions", :size => Sizes::HEADING, :color => Colors::HEADING
  text "In the event that the OEGL is updated, only the Program’s stated version will apply. If you release newer versions of the Program with an updated version of the OEGL, older versions will not follow the newer licence.
  ", :size => Sizes::GENERAL, :color => Colors::GENERAL

  # End Warning
  puts "Set end warning"
  text "End of licence.
  ", :size => Sizes::WARNING, :color => Colors::WARNING, :align => :center, :style => :bold

  # How to Apply Title
  puts "Set how to apply title"
  text "How to Apply the OEGL", :size => Sizes::TITLE, :color => Colors::GENERAL
  
  # How to Apply P!
  puts "Set how to apply p1"
  text "To follow the general standard, create a file named LICENSE (not LICENCE) and input this licence’s contents.", :size => Sizes::GENERAL, :color => Colors::GENERAL

  # How to Apply P2
  puts "Set how to apply p2"
  text "At the top of all copyrighted files, adding a notice like the following is recommended:
  ", :size => Sizes::GENERAL, :color => Colors::GENERAL

  # How to Apply CB
  puts "Set how to apply cb"
  text "Program Name v1.0
  Copyright © <year> <author(s)>. All rights reserved.
  Licensed under the OEGL; see LICENSE.
  ", :size => Sizes::GENERAL, :color => Colors::GENERAL, :align => :center

  # How to Apply P3
  puts "Set how to apply p3"
  text "You should update the copyright year to correspond with the last modification of the file.", :size => Sizes::GENERAL, :color => Colors::GENERAL

  # Footer
  page_count.times do |i|
    puts "Set footer for page #{i+1}"
    # Go to page
    go_to_page(i+1)

    # Reset Leading
    default_leading 0
    
    # Copyright Notice
    bounding_box([bounds.left, bounds.bottom+25], :width => bounds.right - 50) {
      puts "Set copyright notice"
      text "© 2020 Elitis\nRedistribution of this document is not permitted; redistribute the generator.", :size => Sizes::GENERAL, :color => Colors::UNIMPORTANT
    }

    # Page Number
    bounding_box([bounds.right - 25, bounds.bottom+25], :width => bounds.left + 50) {
      puts "Set page number"
      text "Page", :size => Sizes::GENERAL, :color => Colors::UNIMPORTANT
      text "#{i+1}", :size => Sizes::GENERAL, :color => Colors::GENERAL
    }
  end
end

puts "\nDone!"