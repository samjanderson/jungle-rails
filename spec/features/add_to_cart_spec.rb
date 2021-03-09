require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

     # SETUP
     before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @product = @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

  scenario "A guest user can add a product to the cart" do
     #visit app home page
  visit "/"
  #locate the first product (bordered div with title and picture) #click on the blue add button in the product
  first('article.product').find_button("Add").click #find button that includes text add and is case sensitive
  #find the cart Nav link, make sure the cart quantity is correct, click on the my cart button/link
  find_link("My Cart (1)").click
  page.save_screenshot
  #check for my cart/total
  expect(page).to have_content("TOTAL:")
  expect(page).to have_selector('h1', text: "My Cart") #h1 of my cart
  expect(page).to have_content(@product.name)
  expect(page).to have_content(@product.price)
  page.save_screenshot
  end

end
