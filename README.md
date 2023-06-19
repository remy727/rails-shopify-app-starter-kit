# Rails Shopify App Starter Kit

The Rails Shopify app with some tools for quick starting developing shopify app.

## Tech Stack

This template combines a number of third party open source tools:

- BackEnd
  - [Rails](https://rubyonrails.org/) builds the backend.
- FrontEnd
  - [Vite](https://vitejs.dev/) builds the [React](https://reactjs.org/) frontend.
  - [React Router](https://reactrouter.com/) is used for routing. We wrap this with file-based routing.
  - [React Query](https://react-query.tanstack.com/) queries the Admin API.
  - [`i18next`](https://www.i18next.com/) and related libraries are used to internationalize the frontend.
    - [`react-i18next`](https://react.i18next.com/) is used for React-specific i18n functionality.
    - [`i18next-resources-to-backend`](https://github.com/i18next/i18next-resources-to-backend) is used to dynamically load app translations.
    - [`@formatjs/intl-localematcher`](https://formatjs.io/docs/polyfills/intl-localematcher/) is used to match the user locale with supported app locales.
    - [`@formatjs/intl-locale`](https://formatjs.io/docs/polyfills/intl-locale) is used as a polyfill for [`Intl.Locale`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale) if necessary.
    - [`@formatjs/intl-pluralrules`](https://formatjs.io/docs/polyfills/intl-pluralrules) is used as a polyfill for [`Intl.PluralRules`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/PluralRules) if necessary.
- Database: `PostgreSQL`
- Background Job:
  - [Sidekiq](https://sidekiq.org/)
  - [Redis](https://redis.io/)

These third party tools are complemented by Shopify specific tools to ease app development:

- [Shopify API library](https://github.com/Shopify/shopify-api-ruby) adds OAuth to the Rails backend. This lets users install the app and grant scope permissions.
- [App Bridge](https://shopify.dev/docs/apps/tools/app-bridge) and [App Bridge React](https://shopify.dev/docs/apps/tools/app-bridge/getting-started/using-react) add authentication to API requests in the frontend and renders components outside of the App’s iFrame.
- [Polaris React](https://polaris.shopify.com/) is a powerful design system and component library that helps developers build high quality, consistent experiences for Shopify merchants.
- [Custom hooks](https://github.com/Shopify/shopify-frontend-template-react/tree/main/hooks) make authenticated requests to the Admin API.
- [File-based routing](https://github.com/Shopify/shopify-frontend-template-react/blob/main/Routes.jsx) makes creating new pages easier.
- [`@shopify/i18next-shopify`](https://github.com/Shopify/i18next-shopify) is a plugin for [`i18next`](https://www.i18next.com/) that allows translation files to follow the same JSON schema used by Shopify [app extensions](https://shopify.dev/docs/apps/checkout/best-practices/localizing-ui-extensions#how-it-works) and [themes](https://shopify.dev/docs/themes/architecture/locales/storefront-locale-files#usage).

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
3. Install the ruby dependencies:
  ```shell
  cd web
  bundle install
  ```
4. Run the [Rails template](https://guides.rubyonrails.org/rails_application_templates.html) script.
   It will guide you through setting up your database and set up the necessary keys for encrypted credentials.
  ```shell
  bin/rails app:template LOCATION=./template.rb
  ```
5. Update `SHOPIFY_API_KEY` in `heroku.yml`.

And your Rails app is ready to run! You can now switch back to your app's root folder to continue:

```shell
cd ..
```

## Local Development

[The Shopify CLI](https://shopify.dev/docs/apps/tools/cli) connects to an app in your Partners dashboard.
It provides environment variables, runs commands in parallel, and updates application URLs for easier development.

You can develop locally using your preferred Node.js package manager.
Run one of the following commands from the root of your app:

Using yarn:

```shell
yarn dev
```

Using npm:

```shell
npm run dev
```

Using pnpm:

```shell
pnpm run dev
```

Open the URL generated in your console. Once you grant permission to the app, you can start development.

## Heroku Deployment

### Step 1: Set up hosting with Heroku
1. Download and install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli).
2. Navigate to your app directory:
  ```shell
  cd my-app
  ```
3. Log in to the Heroku CLI:
  ```shell
  heroku login
  ```
4. Log in to the Heroku Container Registry:
  ```shell
  heroku container:login
  ```
5. Create an app in Heroku:
  ```shell
  heroku create -a <my-app-name> -s container
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
| `RAILS_LOG_TO_STDOUT`      |         |          |                | Tells rails to print out logs.                              |
| `SENTRY_CURRENT_ENV`       |         |          |    string      | Sentry Environment                                          |
| `SENTRY_DSN`               |         |          |    string      | Sentry DSN                                                  |
| `SENTRY_TRACES_SAMPLE_RATE`|         |          |    float       | Sentry Sample Rate                                          |
| `SHOPIFY_API_KEY`          |         |          |    string      | The client ID of the app, retrieved using Shopify CLI.      |
| `SHOPIFY_API_SCOPES`       |         |          |    string      | The app's access scopes, retrieved using Shopify CLI.       |
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
- **App URL**: `https://my-app.herokuapp.com`
- **Allowed redirection URL(s)**: `https://my-app.herokuapp.com/api/auth/callback`

### Step 5: Enjoy your app :)