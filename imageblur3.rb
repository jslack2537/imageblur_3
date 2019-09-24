#image-blur2
class Image

  def initialize(image)
    @image = image
    @row_length = image.length
    @col_length = image[0].length

  end 

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur_pixel(row_index, col_index)
    @image[row_index -1][col_index] = 1 unless row_index == 0
    @image[row_index +1][col_index] = 1 unless row_index >= @row_length-1
    @image[row_index][col_index -1] = 1 unless col_index == 0
    @image[row_index][col_index +1] = 1 unless col_index >= @col_length-1
  end

  def find_ones
    one_pixel = []

    @image.each_with_index do |row_array, row_index|
        row_array.each_with_index do |cell, col_index|
        if cell == 1
          one_pixel << [row_index, col_index]
        end
      end
    end    
    one_pixel  
  end


  def find_pix
    image_cordinates = find_ones

    image_cordinates.each do |x, y|
      blur_pixel(x, y)
    end  
  end

   def blur(distance=2)
    distance.times do
      find_pix
    end
  end


end


image = Image.new([
  [0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0]
])



image.blur
image.output_image