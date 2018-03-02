# README

This repository provides a basic setup for using Rails API with:

* Authentication using JWT
* Persistence via Postgres
* Serialization using JSON-API
* API versioning via path (e.g., /v1/foo)
* Testing with RSpec

## Tests

```
rake
```

## Coverage

After running the tests, view `./coverage/index.html`

## Future

* Use uuid for primary keys
* Define and handle token expiration
* Document the endpoints
* Leverage JSON-API deserialization
* Expand the schema for medications
* Create an audit trail of all requests
* Invite family, add authorization system
