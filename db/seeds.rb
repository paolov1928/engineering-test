unless Experience.find_by(name: "Rise Festival").present?
  experience = Experience.create(
    name: "Rise Festival",
    tagline: "Party on top of the world next December at Europe's leading snow sports and music festival.",
    overview: "Europe's biggest snow sports and music festival Rise is back for a fifth year running to take over the beautiful Les 2 Alpes resort for this party on top of the world.

Embrace adventure on the slopes, get wild at après-ski and by night seek out the world's biggest artists and DJs in cosy alpine bars, show stopping arenas and secret mountainside venues.

Find the trail towards secret adventure parties, where s'mores are on the menu with DJs, huge roaring fires and parties until the early hours."
  )

  experience.hero_image.attach(
    io: File.open(Rails.root.join("app", "assets", "images", "rise-hero-image.jpg")),
    filename: "rise-hero-image.jpg",
    content_type: "image/jpeg"
  )

  experience.overview_image.attach(
    io: File.open(Rails.root.join("app", "assets", "images", "rise-overview-image.jpg")),
    filename: "rise-overview-image.jpg",
    content_type: "image/jpeg"
  )

  experience.save!

  experience.ticket_types.create([
    {name: "First release", price: 199, sold_out: true},
    {name: "Second release", price: 239, sold_out: true},
    {name: "Third release", price: 259},
    {name: "2 Day Ticket", price: 69},
    {name: "4 Day Ticket", price: 139},
    {name: "Junior Ticket", price: 119}
  ])

  experience.extras.create([
    {name: "Platinum Ski Hire", tagline: "Advanced equipment for experienced skiers.", price: 199},
    {name: "Platinum Snowboard Hire", tagline: "Advanced equipment for experienced skiers.", price: 199, sold_out: true},
    {name: "Gold Ski Hire", tagline: "Beginner equipment for beginner skiers with little or no experience.", price: 150},
    {name: "Gold Snowboard Hire",  tagline: "Beginner equipment for beginner skiers with little or no experience.", price: 150},
    {name: "Beginner ski lesson", tagline: "Complete beginners who have never skied or had any lessons on snow before.", price: 89},
    {name: "Intermediate ski lesson", tagline: "6 hours of lessons for those with some experience", price: 89},
    {name: "Advanced ski lesson", tagline: "Spend a day on the slopes improving your already expert skills", price: 120},
    {name: "Beginner snowboard lesson", tagline: "Complete beginners who have never skied or had any lessons on snow before.", price: 89},
    {name: "Intermediate snowboard lesson", tagline: "6 hours of lessons for those with some experience", price: 89, sold_out: true},
    {name: "Advanced snowboard lesson", tagline: "Spend a day on the slopes improving your already expert skills", price: 120, sold_out: true}
  ])
end
