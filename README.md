[![Codeship Status for BorisMargarian/ChoreMates](https://app.codeship.com/projects/0af94010-531c-0137-5019-2a29686d085d/status?branch=master)](https://app.codeship.com/projects/340586)

<h2>ChoreMates</h2>
I have spent many years living with other people. Keeping our living space clean and fairly distributing common chores have been our biggest issues. ChoreMates is my "capstone" project which attempts to solve these problems.

Devise is used for user registrations. The front-end is built in React.js and integrated with a Rails back-end. Users can create, claim, and complete household chores. Chore and review image uploads are handled by CarrierWave and stored remotely on AWS.

Contributors:<a href="https://github.com/BorisMargarian">Boris Margarian</a>

<h3>See the Live Version Here:</h3>
https://choremates.herokuapp.com/

<h3>My Presentation/Screencast:</h3>
https://vimeo.com/337288732

<h3>To Run Locally:</h3>
<ul>
  <li>Download the Repo</li>
  <li>'yarn install' and 'bundle install' from your terminal</li>
  <li>create the database: 'bundle exec rake db:create', 'bundle exec rake db:migrate'</li>
  <li>Optional: 'bundle exec rake db:seed'</li>
  <li>You will need an AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, placed in a .env file</li>
  <li>In separate terminal tabs run: 'yarn run start' and 'rails s'</li>
  <li>Navigate your browser to localhost:3000</li>
</ul>
NOTE: seed information can be found in this folder 'app/seeders'

<h3>Config:</h3>
<ul>
  <li>Ruby v2.4.5</li>
  <li>Run tests with 'bundle exec rspec' and 'yarn run test'</li>
</ul>
