Dir["#{Rails.root}/db/upload_pic/*/*"].each do |img|
  cat = Category.find_or_create_by_title(img.split('/')[-2])
  Gallery.create(:category => cat , :image => File.open(img))
  puts "Create #{img}"
end

