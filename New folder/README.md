# xpedia

This project is a focused implementation of a flight booking system, allowing users to:

- Search flights by origin, destination, and date

- View available flights with details (airline, departure, arrival, price)

- Select flights and reserve seats

- Provide passenger information and confirm booking

The goal is to replicate the core booking workflow without including other sections of the full Expedia system.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)

## Features

- **Flight Search:** Search for flights based on origin, destination, and departure date.
- **Flight Listings:** View a list of available flights with details such as airline, departure/arrival times, and price.
- **Filtering Options:** Filter flight results to narrow down choices.
- **Booking Flow:** A step-by-step process to select flights and reserve seats.
- **Passenger Information:** A form to enter passenger details for the booking.
- **Price Summary:** A clear summary of the total cost before final confirmation.
- **Input Validation:** Basic validation on forms to ensure data integrity.

### Optional future features:

- Payment gateway integration.
- Email and SMS notifications for booking confirmations.
- User accounts for managing booking history.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

You will need a local web server environment. [XAMPP](https://www.apachefriends.org/index.html) is recommended as it includes Apache, MySQL, and PHP.

### Installation

1.  **Clone the repository** into your `htdocs` folder within your XAMPP installation directory:

    ```sh
    git clone https://github.com/your-username/xpediaflightbookingsystem.git C:/xampp/htdocs/xpedia

    ```

2.  **Database Setup**:
    - Start Apache and MySQL services from the XAMPP Control Panel.
    - Open your web browser and navigate to `http://localhost/phpmyadmin`.
    - Create a new database and name it `xpedia_db`.
    - Select the `xpedia_db` database and go to the "Import" tab to upload the `database.sql` file (assuming one is in your project root).
3.  **Configure Database Connection**:
    - Update the database connection credentials (host, username, password, database name) in the project's configuration file (e.g., `config.php` or `db_connect.php`).

## Usage

1.  Once the installation is complete, open your browser and go to:
    ```
    http://localhost/xpedia
    ```
2.  The main page will display the flight search interface.
3.  You can use the provided options to add a new country, edit an existing one, or delete one from the list.
4.  Clicking on a country will navigate you to a details page where you can view associated cities, airports, and airlines.
