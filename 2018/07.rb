input = <<~INPUT
Step C must be finished before step A can begin.
Step C must be finished before step F can begin.
Step A must be finished before step B can begin.
Step A must be finished before step D can begin.
Step B must be finished before step E can begin.
Step D must be finished before step E can begin.
Step F must be finished before step E can begin.
INPUT

input = <<~INPUT
Step G must be finished before step T can begin.
Step L must be finished before step V can begin.
Step D must be finished before step P can begin.
Step J must be finished before step K can begin.
Step N must be finished before step B can begin.
Step K must be finished before step W can begin.
Step T must be finished before step I can begin.
Step F must be finished before step E can begin.
Step P must be finished before step O can begin.
Step X must be finished before step I can begin.
Step M must be finished before step S can begin.
Step Y must be finished before step O can begin.
Step I must be finished before step Z can begin.
Step V must be finished before step Z can begin.
Step Q must be finished before step Z can begin.
Step H must be finished before step C can begin.
Step R must be finished before step Z can begin.
Step U must be finished before step S can begin.
Step E must be finished before step Z can begin.
Step O must be finished before step W can begin.
Step Z must be finished before step S can begin.
Step S must be finished before step C can begin.
Step W must be finished before step B can begin.
Step A must be finished before step B can begin.
Step C must be finished before step B can begin.
Step L must be finished before step P can begin.
Step J must be finished before step V can begin.
Step E must be finished before step W can begin.
Step Z must be finished before step W can begin.
Step W must be finished before step C can begin.
Step S must be finished before step W can begin.
Step Q must be finished before step S can begin.
Step O must be finished before step B can begin.
Step R must be finished before step W can begin.
Step D must be finished before step H can begin.
Step E must be finished before step O can begin.
Step Y must be finished before step H can begin.
Step V must be finished before step O can begin.
Step O must be finished before step S can begin.
Step X must be finished before step V can begin.
Step R must be finished before step E can begin.
Step S must be finished before step A can begin.
Step K must be finished before step Y can begin.
Step V must be finished before step W can begin.
Step U must be finished before step W can begin.
Step H must be finished before step R can begin.
Step P must be finished before step I can begin.
Step E must be finished before step C can begin.
Step H must be finished before step Z can begin.
Step N must be finished before step V can begin.
Step N must be finished before step W can begin.
Step A must be finished before step C can begin.
Step V must be finished before step E can begin.
Step N must be finished before step Q can begin.
Step Y must be finished before step V can begin.
Step R must be finished before step O can begin.
Step R must be finished before step C can begin.
Step L must be finished before step S can begin.
Step V must be finished before step R can begin.
Step X must be finished before step R can begin.
Step Z must be finished before step A can begin.
Step O must be finished before step Z can begin.
Step U must be finished before step C can begin.
Step X must be finished before step W can begin.
Step K must be finished before step O can begin.
Step O must be finished before step A can begin.
Step K must be finished before step T can begin.
Step N must be finished before step O can begin.
Step X must be finished before step C can begin.
Step Z must be finished before step C can begin.
Step N must be finished before step X can begin.
Step T must be finished before step A can begin.
Step D must be finished before step O can begin.
Step M must be finished before step Q can begin.
Step D must be finished before step C can begin.
Step U must be finished before step E can begin.
Step N must be finished before step H can begin.
Step I must be finished before step U can begin.
Step N must be finished before step A can begin.
Step M must be finished before step E can begin.
Step M must be finished before step V can begin.
Step P must be finished before step B can begin.
Step K must be finished before step X can begin.
Step N must be finished before step S can begin.
Step S must be finished before step B can begin.
Step Y must be finished before step W can begin.
Step K must be finished before step Q can begin.
Step V must be finished before step S can begin.
Step E must be finished before step S can begin.
Step N must be finished before step Z can begin.
Step P must be finished before step A can begin.
Step T must be finished before step V can begin.
Step L must be finished before step D can begin.
Step I must be finished before step C can begin.
Step Q must be finished before step E can begin.
Step Y must be finished before step U can begin.
Step J must be finished before step I can begin.
Step P must be finished before step H can begin.
Step T must be finished before step M can begin.
Step T must be finished before step E can begin.
Step D must be finished before step F can begin.
INPUT

def parse(input)
  Hash.new { |h, k| h[k] = [] }.tap do |steps|
    input.split("\n").map do |line|
      from, to = line.scan(/Step (\w) must be finished before step (\w) can begin./).first
      steps[from] ||= []
      steps[to] << from
    end
  end
end

steps = parse(input)

order = []

until steps.empty?
  n = steps.select { |_k, v| v.empty? }.sort_by(&:first).first.first
  order << n

  steps = steps.to_h do |k, v|
    [k, v.reject { |i| i == n }]
  end.reject { |k, _v| k == n }
end

puts "Part 1: #{order.join}"

steps = parse(input)

workers = [[nil, 0]] * 5
tick = 0

until steps.empty?
  workers.map! do |job, time|
    if job.nil?
      [nil, 0]
    elsif time > 1
      [job, time - 1]
    elsif time == 1
      steps = steps.to_h do |k, v|
        [k, v.reject { |i| i == job }]
      end.reject { |k, _v| k == job }

      [nil, 0]
    end
  end

  next_jobs = steps.select { |_k, v| v.empty? }.sort_by(&:first)
  next_jobs = next_jobs.reject { |k, _v| workers.map(&:first).include?(k) }

  next_jobs.each do |k, _v|
    worker = workers.find { |job, _time| job.nil? }

    if worker
      worker[0] = k
      worker[1] = k.ord - ?A.ord + 61
    end
  end

  tick += 1
end

puts "Part 2: #{tick + workers.map(&:last).max - 1}"
