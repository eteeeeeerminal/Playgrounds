def swap(a, i, j)
  x = a[i]
  a[i] = a[j]
  a[j] = x
end

def bubble_sort(a)
  (a.length-1).times do |i|
    (a.length-1-i).times do |j|
      if a[j] > a[j+1] then
        swap(a, j, j+1)
      end
    end
  end
end

def min_idx(array, left, right)
  idx = left
  min = array[left]
  left.upto(right) do |i|
    if array[i] < min then
      min = array[i]
      idx = i
    end
  end
  return idx
end

def selection_sort(a)
  a.length.times do |i|
    k = min_idx(a, i, a.length-1)
    swap(a, k, i)
  end
end

def shift_larger(a, i, x)
  (i-1).downto(0) do |k|
    return k+1 unless a[k] > x
    a[k+1] = a[k]
  end
  return 0
end

def insertion_sort(a)
  a.length.times do |i|
    x = a[i]
    i = shift_larger(a, i, x)
    a[i] = x
  end
end

def merge_sort(a, left=0, right=a.length)
  if (right - left == 1) then
       return true
  end
  mid = (left + (right - left) / 2).to_i
  
  merge_sort(a, left, mid)
  merge_sort(a, mid,  right)

  buf = a[left...mid] + a[mid...right].reverse

  # マージ
  left_i  = 0
  right_i = buf.length() -1
  left.upto(right-1) do |i|
      if buf[left_i] <= buf[right_i] then
          a[i] = buf[left_i]
          left_i+=1
      else
          a[i] = buf[right_i]
          right_i-=1
      end
  end
end

def quick_sort(a, left=0, right=a.length-1)
  if right > left
    pivot = a[right]
    s = left
    left.upto(right-1) do |i|
      if a[i] <= pivot
        swap(a, s, i)
        s += 1
      end
    end
    swap(a, right, s)
    quick_sort(a, left, s-1)
    quick_sort(a, s+1, right)
  end
end

def radix_sort(a)
  a.max.bit_length.times do |bit_shift|
    t = []; f = []
    a.length.times do |i|
      (a[i][bit_shift] == 0) ? t << a[i] : f << a[i]
    end
    a = t + f
  end
  return a
end

require 'benchmark'

# rubyの標準のソートと今回のソートを全部比較する
# 配列の大きさが, 10~10^10 各1万回ずつ測って平均取る

Array_length_idx = 10
Try_times = 10000

results = {}

results['bubble_sort'] = Array.new(Array_length_idx){0}
results['selection_sort'] = Array.new(Array_length_idx){0}
results['insertion_sort'] = Array.new(Array_length_idx){0}
results['merge_sort'] = Array.new(Array_length_idx){0}
results['quick_sort'] = Array.new(Array_length_idx){0}
results['radix_sort'] = Array.new(Array_length_idx){0}
results['ruby_sort!'] = Array.new(Array_length_idx){0}

Array_length_idx.times do |i|

  n = 10*(i+1)
  a = Array.new(n){rand(n)}

  Try_times.times do |k|
    b = Array.new(n){|i| a[i]}
    results['bubble_sort'][i] += Benchmark.realtime {bubble_sort(b)}
    b = Array.new(n){|i| a[i]}
    results['selection_sort'][i] += Benchmark.realtime {selection_sort(b)}
    b = Array.new(n){|i| a[i]}
    results['insertion_sort'][i] += Benchmark.realtime {insertion_sort(b)}
    b = Array.new(n){|i| a[i]}
    results['merge_sort'][i] += Benchmark.realtime {merge_sort(b)}
    b = Array.new(n){|i| a[i]}
    results['quick_sort'][i] += Benchmark.realtime {quick_sort(b)}
    b = Array.new(n){|i| a[i]}
    results['radix_sort'][i] += Benchmark.realtime {radix_sort(b)}
    b = Array.new(n){|i| a[i]}
    results['ruby_sort!'][i] += Benchmark.realtime {b.sort!}
  end
end

for result in results.to_a do 
  printf("#{result[0]}")
  for time in result[1] do 
    printf(",\ %3.4f", time)
  end
  printf("\n")
end