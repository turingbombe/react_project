# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

card_sets = MTG::Set.all
card_sets.each do |cardset|
	CardSet.create(code: cardset.code, name: cardset.name, release_date: cardset.release_date)
end

cards = MTG::Card.all
cards.each do |card|
	new_card = Card.create(multiverse_id: card.multiverse_id,artist: card.artist, cmc: card.cmc,colors: card.colors,flavor: card.flavor,image_url: card.image_url,mana_cost: card.mana_cost,name: card.name,number: card.number,original_text: card.original_text,original_type: card.original_type,power: card.power,printings: card.printings,rarity: card.rarity,set: card.set,set_name: card.set_name,subtypes: card.subtypes,card_text: card.text,toughness: card.toughness,card_type: card.type,types: card.types)

	new_card.card_set_id = CardSet.find_by(name: new_card.set_name).id
	new_card.save
end
