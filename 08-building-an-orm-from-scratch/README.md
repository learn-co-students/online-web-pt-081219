# Building an ORM from Scratch

Let's do some quick practice writing Ruby classes that interact with SQL databases. Our domain will involve artists and paintings--a painting will *belong to* one artist, which can *have many* paintings.

## Deliverables

### Artist class Part 1

An artist will have an `id` and a `name`. These should be attributes in the ruby class as well as columns in the `artists` SQL table.

#### #initialize

Should take two keyword arguments: a `name:` and an optional `id:` argument which defaults to `nil`

#### .create_table

Should create the `artists` table if it doesn't exist.

##### Hint: "CREATE TABLE IF NOT EXISTS..."

#### #save

Should insert a new artist row into the `artists` table and set the `id` attribute of the ruby object

#### .find\_by\_id

Should search the `artists` table for a row matching the given id and return a new Ruby object with the correct `id` and `name` attributes set

### Paintings

A painting will have an `id`, a `name`, and an `artist_id`. These should be attributes in the ruby class as well as columns in the `paintings` SQL table. The `artist_id` will hold the `id` of the `artist` to which this painting belongs.

#### #initialize

Should take three keyword arguments: a `name:`, an `artist_id:`, and an optional `id:` argument which defaults to `nil`

#### .create_table

Should create the `paintings` table if it doesn't exist.

##### Hint: "CREATE TABLE IF NOT EXISTS..."

#### #save

Should insert a new painting row into the `paintings` table and set the `id` attribute of the ruby object

#### .find\_by\_id

Should search the `paintings` table for a row matching the given id and return a new Ruby object with the correct `id`, `artists_id`, and `name` attributes set

### Artist class Part 2

#### #paintings

Should *join* the `paintings` and `artists` tables to get all the painting rows which `artist_id` matches the current object's `id`. It should convert these rows into `Painting` objects and return them in an array.

##### Hints:
- You probably want an INNER JOIN
- Consider creating a Painting.new\_from\_db helper method
