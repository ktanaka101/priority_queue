module PriorityQueue(T)
  VERSION = "0.1.0"

  def self.build : PriorityQueue(T)
    PriorityQueue(T).new
  end

  class PriorityQueue(T)
    include Enumerable(T)

    def initialize
      @a = Array(T).new
    end

    def each
      @a.each do |o|
        yield o
      end
    end

    delegate size, to: @a

    def push(key : T)
      @a << T::MIN
      increase_key(@a.size - 1, key)
    end

    def <<(key : T)
      push(key)
    end

    def pop : T
      return T::MIN if @a.empty?

      maxv = @a[0]
      @a.size > 1 ? (@a[0] = @a.pop) : @a.pop
      max_heapify(0)

      maxv
    end

    private def increase_key(i, key)
      return if key < @a[i]

      @a[i] = key

      c_idx = i
      p_idx = (c_idx - 1) // 2
      while c_idx > 0 && @a[p_idx] < @a[c_idx]
        @a.swap(p_idx, c_idx)
        c_idx = (c_idx - 1) // 2
        p_idx = (c_idx - 1) // 2
      end
    end

    private def max_heapify(i : Int)
      l = i * 2 + 1
      r = l + 1

      largest =
        if l < @a.size && @a[l] > @a[i]
          l
        else
          i
        end
      largest = r if r < @a.size && @a[r] > @a[largest]

      unless largest == i
        @a.swap(i, largest)
        max_heapify(largest)
      end
    end
  end
end
