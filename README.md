# Fixers Engineering Test - Ticket Organisation

### The Brief

At Fixers core is a powerful universal checkout that enables Fixers to sell everything from Music Festivals, Yoga Retreats, Hotels, Apartment through to Ski Hire and Transport. The example app represents a very simplified version of the fixers app which concentrates on one of these area, selling an experience.

The app currently has 3 models. `Experience` which represents a fixers product, an experience then has many `Experience::TicketType` to represent the possible tickets an experience might have, e.g First release, second release. An experience can also have many `Extra` these are for selling auxiliary variants, i.e. camping pass, equipment hire. Both ticket types and extras would come under the umbrella term "Variant" as something which is actually bookable by a customer.

For this test we want you to have a go at implementing this request from one of our sellers:

> We want to start selling different types of tickets and extras i.e. a day ticket alongside a weekend ticket or ski hire and ski lessons as types of extras. For this we need a better way of organising the tickets and extras.
>
> Our ideal solution would be that we can create ticket and extra segments then separate the variants into these. Within the segments we'd need to be able to reorder the variants and then ideally we'd be able to reorder the segments on the page. ( Just reordering ticket segments or extra segments not mixing them ). For example we could have a default segment for regular festival tickets and a segment for shorter stay tickets, or we could have an extras segment for ski hire and one for ski lessons.
>
> Within these segments we'd also need to be able to reorder the variants ( previously on fixers these have moved themselves around if sold out ) but we'd like to have full control over the order they appear in.

### Instructions and Requirements

When configuring an experience a seller should be able to create segments for their variants ( either tickets or extras ), these segments should be reorderable and variants should be reorderable within them.

Other than variants a segment should also have a name and a tagline to appear as in the mockup below, name should be a required field whilst tagline should be optional.

Don't worry if you can't get everything done, the test was made to be difficult and especially tight on time. Concentrate on making sure the code you end up submitting is of a high standard rather than ensuring you fulfill all the requirements of the seller.

Make as much of an effort as possible to test any code which is submitted.

Feel free to use any other technologies you see fit, whether it be new gems, react components etc.

You have 1 week to complete the test and by then a PR should be open into your master branch ready for us to review.

After the test the following mockup should be configurable by a seller on an experience

![segments_mockup](https://github.com/fixershq/engineering-test/raw/master/app/assets/images/engineering_test_mockup.png)

## Completing the test

The point of this test is to mirror as closesly as possible a real world project at fixers, this is a problem we've had to solve whilst building the app. To get this as close as possible we want you to follow the process we use as much as possible as well.

You should use the following as a guide to getting set up and submitting your solution to the test:

1) Fork the sample app to your github account

2) Create a Feature branch from master for your work

3) Work on this branch ( feel free to branch again and merge in to this ) as this will be what is submitted for code review

4) Add your reviewer ( you will've received their github account in the email with this test ) as a collaborator on the project and request review from then when you're happy your work is finished.

## Getting up and running

Once you've forked the repo use the following to get the project up and running

1. Ensure you have `postgres 10` installed
2. `bundle` To install any ruby dependencies
3. `yarn` || `npm install` to install any javascript dependencies
4. `rails db:create` to create the database
5. `rails db:migrate`
6. `rails db:seed` to create some example data
7. `cp .env.example .env` to setup environment
8. `foreman start` to run the server, the app should now be accessible at http://localhost:3000
