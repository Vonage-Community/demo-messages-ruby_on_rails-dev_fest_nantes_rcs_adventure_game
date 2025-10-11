# Vonage Messages API RCS Demo

This is a demo application built in Ruby using [Ruby on Rails](https://rubyonrails.org/) and the [Vonage Ruby SDK](https://github.com/Vonage/vonage-ruby-sdk) to demonstrate the Rich Card and Suggested Reply functionality of RCS channel of the [Vonage Messages API](https://developer.vonage.com/en/messages/overview).

## Pre-requisites

To run this demo locally you will need:

- A [Vonage Developer account](https://developer.vonage.com/sign-up) with a [RCS Agent](https://developer.vonage.com/en/messages/channel-manager/guides/rcs/rcs-onboarding-guide?source=channel-manager) set up.
- [Ruby](https://www.ruby-lang.org/en/) installed
- [Ngrok](https://ngrok.com/) installed

## Setting up your Vonage Application

You'll need to set up a Vonage application to manage the capabilities and obtain the API credentials for this app.

1. Log onto the [Vonage Developer Dashboard](https://dashboard.nexmo.com/)

2. Go to the [Applications](https://dashboard.nexmo.com/applications) page and click on the  'Create a new application' button

3. Generate a private key for the application by clicking on the 'Generate public and private key' button. Download the `private.key` file and keep it somewhere safe.

4. Under 'Capabilities', enable the application for **Messages** by toggling the switch to 'on'.

5. Set the URLs for the Inbound and Message Status webhooks:
  - The URL for Inbound webhook should have `/inbound_messages` appended to it
  - The URL for Status webhook should have `/status_messages` appended to it
  - Note: if you are running the demo locally, the URL in this case should be your Ngrok URL

5. Click on the 'Generate new application' button at the bottom. This will generate and Application ID for the Vonage application; make a note of this or copy it to your clipboard for later.

## Running the Demo Locally

1. Open Terminal and navigate to wherever you want to clone the repository.

2. Clone the repository
    ```
    git clone https://github.com/Vonage-Community/demo-messages-ruby_on_rails-dev_fest_nantes_rcs_adventure_game.git
    ```

3. Change directory (`cd`) into the root directory of the cloned repository and install the dependencies
    ```
    bundle install
    ```

3. Run Ngrok (if you haven't already done this) but running `ngrok http 3000` in a separate terminal tab or window.

5. Copy or move the `private.key` file you downloaded earlier the root directory of this demo application

6. Copy or rename the `.env-example` file to `.env` and update the file with your Vonage credentials and the other settings:
    - `VONAGE_APPLICATION_ID`: This is the Application ID you generated earlier when creating the Vonage Application.
    - `RCS_SENDER_ID`: This is the sender ID for your RCS agent.
    - `MESSAGES_TO_NUMBER`: This is the mobile number, in E.164 format but without the leading `+`, that will receive the RCS messages.
      - Note: if using a test RCS agent the mobile number needs to be added as a test number for that agent.
    - `BASE_URL`: This is the URL for the site where you are running the demo. If running it locally, this will be your Ngrok URL.

7. Start the Rails application
    ```
    rails s
    ```

8. In your browser, navigate to `localhost:3000`. The demo should now be running in the browser.
