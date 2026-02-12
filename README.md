# CRM Rails Application

A full-stack implementation of a Customer Relationship Management (CRM) system using Ruby on Rails, Hotwire (Turbo + Stimulus), and Tailwind CSS.

## Overview

This application serves as a comprehensive tool for managing customer relationships, tracking leads, and recording interactions. It started as an API-only backend and was converted into a full-stack application to provide a modern, responsive web interface.

## Database Schema

The following diagram illustrates the database structure and the relationships between Users, Customers, Leads, and Interactions. Note the polymorphic relationship where both Customers and Leads can have multiple Interactions.

![Database Schema](do_not_render_this_image_path_use_relative_path_instead)
![Database Schema](public/database_schema.png)

## Features

- **Dashboard**: Real-time overview of metrics and recent activity.
- **Customer Management**: Full CRUD operations for managing customer data.
- **Lead Tracking**: Track potential customers through various statuses (New, Contacted, Won, Lost).
- **Interaction Logging**: Record calls, emails, and meetings. Interactions are polymorphically associated with either Customers or Leads.
- **Secure Authentication**: Built with Devise for robust user session management.
- **Modern UI**: Designed with Tailwind CSS, featuring a responsive layout and a premium red-themed aesthetic.
- **Hotwire Integration**: Uses Turbo Drive and Frames for a fast, single-page application feel without complex JavaScript frameworks.

## Prerequisites

Ensure you have the following installed on your system:

- **Ruby**: Version 3.4.8 (managed via rbenv or rvm)
- **Rails**: Version 8.1.2
- **SQLite3**: Default database for development.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd crm-rails
    ```

2.  **Install Ruby dependencies:**
    ```bash
    bundle install
    ```

3.  **Install Foreman (Required for running the app):**
    ```bash
    gem install foreman
    ```

4.  **Setup the database:**
    ```bash
    bin/rails db:setup
    ```

## Usage

To start the application, run the development script. This command uses Foreman to start both the Rails server and the Tailwind CSS file watcher simultaneously.

```bash
./bin/dev
```

Open your browser and navigate to:
[http://localhost:3000](http://localhost:3000)

### Initial Login
You can register a new user or use the seed data if available.

## Project Structure

- `app/models`: Contains the Active Record models (Customer, Lead, Interaction, User).
- `app/controllers`: Handles incoming requests.
    - `api/v1/`: API controllers for JSON endpoints.
    - Standard controllers (`CustomersController`, etc.) for HTML views.
- `app/views`: HTML templates using ERB and Tailwind CSS classes.
- `config/routes.rb`: Application routing definitions.
- `db/`: Database migrations and schema.
- `public/`: Static files.

## Tech Stack

- **Backend**: Ruby on Rails 8
- **Frontend**: Hotwire (Turbo, Stimulus), Tailwind CSS
- **Database**: SQLite
- **Authentication**: Devise
- **Asset Management**: Propshaft

## License

This project is open-source and available for use and modification.
