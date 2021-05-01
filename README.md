# Society Management

This web application created using flask provides House owners, staff with various features of the society.

## Installation

This web app requires python installed in the system and a locally configured Oracle database with configurations as in cfg.py.
Use the package manager [pip](https://pip.pypa.io/en/stable/) to install the requirements for this app.

```bash
pip install -r requirements.txt
```

## Usage

```bash
py app.py
```

The web app will be hosted on the localhost port 5000. Use a browser for accessing it.

## Features V1.0

- Three different types of users: Admin, Staff and House Owner.
- Initial data for the database is available in .SQL files.
- Admin is the user with full access to the database.
- Staff is responsible for managing complaints, guests, etc.
- House owner accounts are for the owners of a house in society.
- An owner can add/update his family members, view notices, post complaints and view his guest log as entered by staff.
- An owner also receives notification when the house has a guest, a complaint's status is updated, or a new notice is posted.
- House owners can pay their maintenance fee from the website as well.
- And many other features are available.

## V1.1
- RSS Feed to get notified whenever a new notice is posted
- View notices without the need of logging in

## Contributing
Pull requests are welcome. For significant changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
