### README

# Quantified Self - Rails

### Table Of Contents
- [Versions/Prerequisites](#versions-prerequisites)
- [Setup](#setup)
- [The Test Suite](#the-test-suite)
- [Endpoints](#endpoints)
- [Authors](#authors)

### Versions/Prerequisites

The prerequisites for this application are:
- Postgresql 10+
- Rails 5+
- Ruby 2.4+ (2.4.4 if deployed to AWS)

### Setup
- Clone the repository and change directory into the project directory:
```
git clone https://github.com/anon0mys/quantified_self.git
cd quantified_self
```
- Run bundle to install the gem dependencies:
```
bundle
```
- Migrate and seed the database:
```
rake db:{create,migrate,seed}
```

### The Test Suite
- The test suite is written in RSpec. To run the test suite, from the root project folder run:
```
rspec
```

- In order to run a specific test file, add the path to the test file:
```
rspec spec/requests/api/v1/invoices/invoices_spec.rb
```

### Endpoints
- Documentation for all endpoints is here: 
[Endpoint Explanation](https://github.com/anon0mys/rales_engine/blob/master/endpoint.md)


### Authors
- [Evan Wheeler](https://github.com/anon0mys)
