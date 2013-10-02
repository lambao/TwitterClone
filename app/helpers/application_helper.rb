module ApplicationHelper
   #get title for page
   def get_title(page_title)
      base_title = "TwitterClone"
      if (page_title.empty?)
         return base_title
      else
         return "#{base_title} | #{page_title}"
      end
   end
end
