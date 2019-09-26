# priority_queue

Priority queue for Crystal

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     priority_queue:
       github: ktanaka101/priority_queue
   ```

2. Run `shards install`

## Usage

```crystal
require "priority_queue"

q = PriorityQueue(Int32).build
q << 3
q << 1
q << 2
q << 5
q << 4

q.pop #=> 5
q.pop #=> 4
q.pop #=> 3
q.pop #=> 2
q.pop #=> 1

# #pop raises IndexError if empty
q = PriorityQueue(Int32).build
q.pop #=> raise IndexError

# #pop? returns nil if empty
q = PriorityQueue(Int32).build
q.pop? #=> nil
```

## Contributing

1. Fork it (<https://github.com/ktanaka101/priority_queue/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [ktanaka101](https://github.com/ktanaka101) - creator and maintainer
