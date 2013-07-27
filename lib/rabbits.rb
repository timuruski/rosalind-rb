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


  # Loop
  def lfib(n,k=1)
    a,b = 1,0
    (1..n).each do
      a,b = a + k * b, a
    end

    b
  end

  # Memoize
  $m = {}
  def mfib(n, k)
    $m.fetch([n,k]) {
      if n <= 2
        p = 1
      else
        p = mfib(n - 1, k) + k * mfib(n - 2, k)
      end

      $m[[n,k]] = p

      p
    }
  end

  # Efficient recursive
  def rfib(n)
    rfib_r 0, 1, n
  end

  def rfib_r(a, b, n)
    n == 0 ? a : rfib_r(b, a + b, n - 1)
  end

  # TODO Combine efficient recursive and memoize

  Benchmark.bm do |x|
    (1_000..20_000).step(1_000) do |n|
      x.report("mfib #{n}") { mfib n, 3 }
      x.report("lfib #{n}") { lfib n }
      # Bench and find stack limit, it's 8,000 here.
      # x.report("n #{n}") { fib n }
    end
  end

end
