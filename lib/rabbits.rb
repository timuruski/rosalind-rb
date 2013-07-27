class Rabbits
  def initialize(litter)
    @litter = litter
  end

  def pop(n)
    pop_r 1, 1 + @litter, n
  end

  def pop_r(a, b, n)
    n <= 2 ? a : pop_r(b, a * @litter + b, n - 1)
  end


  # Slow. O(n^n) I think.
  # Uses double-recursion, not good.
  # s(n) = s(n-1) + s(n-2) * k
  def pop_slow(month)
    return 1 if month <= 2
    pop_slow(month - 1) + pop_slow(month - 2) * @litter
  end

end


if $0 == __FILE__
  require 'benchmark'

  def fib(n)
    fib_r 0, 1, n
  end

  def fib_r(a, b, n)
    n == 0 ? a : fib_r(b, a + b, n - 1)
  end

  # Bench and find stack limit, it's 8,000 here.
  Benchmark.bm do |x|
    (1_000..9_000).step(1_000) do |n|
      x.report("n #{n}") { fib n }
    end
  end

end
