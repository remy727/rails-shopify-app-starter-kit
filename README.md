# Rails Shopify App Starter Kit

The Rails Shopify app starter kit with some tools for quick starting developing shopify app.

## Why do we need separate repo instead of using Shopify's ruby template?

- Shopify's ruby template uses Polaris 12 but this starter kit uses Polaris 13.
- Shopify's ruby template uses SQLite but this starter kit uses PostgreSQL.
- This starter kit includes some additional gems and configurations.

## Tech Stack

This template combines a number of third party open source tools:

- BackEnd
  - Ruby: `3.3.6`
  - Rails: `7.1.3`
- FrontEnd
  - Vite
  - React
  - React Router
  - React Query
  - i18next
- Database
  - PostgreSQL
- Background Job
  - Sidekiq
  - Redis

## Gems

This includes gems like:
- [dotenv-rails](https://github.com/bkeepers/dotenv)
- [rubocop](https://github.com/rubocop/rubocop)
- [sentry-rails](https://github.com/getsentry/sentry-ruby)
- [sentry-ruby](https://github.com/getsentry/sentry-ruby)
- [sentry-sidekiq](https://github.com/getsentry/sentry-ruby)
- [sidekiq](https://github.com/sidekiq/sidekiq)

## Requirements

1. You must [create a Shopify partner account](https://partners.shopify.com/signup) if you don’t have one.
2. You must create a store for testing if you don't have one, either a [development store](https://help.shopify.com/en/partners/dashboard/development-stores#create-a-development-store) or a [Shopify Plus sandbox store](https://help.shopify.com/en/partners/dashboard/managing-stores/plus-sandbox-store).
3. You must have [Ruby](https://www.ruby-lang.org/en/) installed.
4. You must have [Bundler](https://bundler.io/) installed.
5. You must have [Node.js](https://nodejs.org/) installed.

## Installation

1. `git clone git@github.com:remy727/rails-shopify-app-starter-kit.git your-app-name`
2. `cd your-app-name`
3. Install the dependencies:
   ```shell
   yarn
   cd web
   bundle install
   ```
4. Run the [Rails template](https://guides.rubyonrails.org/rails_application_templates.html) script.
   It will guide you through setting up your database and set up the necessary keys for encrypted credentials.
   ```shell
   bin/rails app:template LOCATION=./template.rb
   ```
5. Navigate to the root of your app and connect to Shopify app.
   ```shell
   cd ..
   shopify app config link
   ```
6. Launch the app:
   ```shell
   shopify app dev
   ```

Open the URL generated in your console. Once you grant permission to the app, you can start development.

## Heroku Deployment

### Step 1: Set up hosting with Heroku
1. Download and install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli).
2. Navigate to your app directory:
   ```shell
   cd your-app
   ```
3. If you want to deploy to Heroku, update `SHOPIFY_API_KEY` in `heroku.yml`.
4. Log in to the Heroku CLI:
   ```shell
   heroku login
   ```
5. Log in to the Heroku Container Registry:
   ```shell
   heroku container:login
   ```
6. Create an app in Heroku:
   ```shell
   heroku create -a <your-app-name> -s container
   ```

### Step 2: Add addons
- [Heroku Postgres](https://elements.heroku.com/addons/heroku-postgresql)
- [Heroku Data for Redis](https://elements.heroku.com/addons/heroku-redis)

### Step 3: Set environment variables
The following environment variables need to be provided for all apps:
| Variable                   | Secret? | Required |     Value      | Description                                                 |
| -------------------------- | :-----: | :------: | :------------: | ----------------------------------------------------------- |
| `HOST`                     |   Yes   |   Yes    |     string     | Heroku App Domain                                           |
| `RAILS_MASTER_KEY`         |   Yes   |   Yes    |     string     | Use value from `web/config/master.key` or create a new one. |
| `RAILS_ENV`                |         |   Yes    | `"production"` |                                                             |
| `RAILS_SERVE_STATIC_FILES` |         |   Yes    |      `1`       | Tells rails to serve the React app from the public folder.  |
| `RAILS_LOG_TO_STDOUT`      |         |   Yes    |      `1`       | Tells rails to print out logs.                              |
| `SENTRY_CURRENT_ENV`       |         |          |    string      | Sentry Environment                                          |
| `SENTRY_DSN`               |         |          |    string      | Sentry DSN                                                  |
| `SENTRY_TRACES_SAMPLE_RATE`|         |          |    float       | Sentry Sample Rate                                          |
| `SHOPIFY_API_KEY`          |         |          |    string      | The client ID of the app, retrieved using Shopify CLI.      |
| `SHOPIFY_API_SECRET`       |         |          |    string      | The client secret of the app, retrieved using Shopify CLI.  |
| `SHOPIFY_APP_NAME`         |         |          |    string      | Shopify App Name                                            |

### Step 3: Deploy your app

```shell
git push heroku main
```

### Step 4: Update URLs in the Partner Dashboard
1. From the Partner Dashboard, go to [Apps](https://partners.shopify.com/current/apps).
2. Select the app that you deployed to your hosting provider.
3. On the App setup page, in the URLs section, update the App URL and Allowed redirection URL(s) settings.
- **App URL**: The base URL of your app. This URL should match your `HOST` environment variable.
- **Allowed redirection URL(s)**: The callback URL for your app. This is usually the same as the app URL, with `/api/auth/callback` appended.

The following are examples of URLs that you might set for Heroku:
- **App URL**: `https://your-app.herokuapp.com`
- **Allowed redirection URL(s)**: `https://your-app.herokuapp.com/api/auth/callback`

Enjoy your app :)
