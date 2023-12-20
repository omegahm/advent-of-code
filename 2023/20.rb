input = <<~INPUT
broadcaster -> a, b, c
%a -> b
%b -> c
%c -> inv
&inv -> a
INPUT

input = <<~INPUT
broadcaster -> a
%a -> inv, con
&inv -> b
%b -> con
&con -> output
INPUT

input = <<~INPUT
%nd -> fs
%ql -> qz
%gz -> vv
%lg -> zx, lx
%tr -> sd
%vn -> ql, qz
%kg -> xz
%sj -> gs
&bq -> rx
%hf -> xm
%vv -> mq, db
%gf -> fn, lx
%zt -> sk
%bm -> lx, cp
%cp -> lx, gb
%gs -> gq, qz
%sp -> db, jh
%bh -> kr, db
%xb -> qz, vn
%fx -> qf
%gq -> qz, xb
%xp -> zn, sd
%hl -> tr, sd
%sk -> nd
%mh -> xs, sd
&qz -> nd, sj, sk, gp, gc, vh, zt
&vg -> bq
%sh -> pz
%jh -> kg
&kp -> bq
%gp -> zt
&gc -> bq
%xf -> xp
%cv -> sd, hl
&db -> kg, sp, kp, fx, jh, gz
%kr -> db
%xz -> zs, db
%fs -> qz, sj
%xm -> kh, lx
%qf -> db, gz
%fn -> bm
%kh -> lx, gf
%vh -> qz, gp
%mq -> bh, db
%zn -> cv
%sv -> xf, sd
%lh -> lx
%dl -> lh, lx
%zx -> lx, hf
%pz -> sd, cn
%cn -> sd, sv
%xs -> sh
%gb -> lx, dl
&tx -> bq
&sd -> mh, tx, sh, xf, zn, xs
&lx -> fn, hf, vg, lg
%zs -> db, fx
broadcaster -> vh, sp, lg, mh
INPUT

##############
### Part 1 ###
##############

def solve(input, part: 1)
  inputs = {}
  modules = {}

  input.split("\n").each do |line|
    from, to = line.split(" -> ")
    to = to.split(", ")
    type = case from
    when /^%/
      from = from[1..-1]
      [:flip_flop, :off]
    when /^&/
      from = from[1..-1]
      [:conjunction]
    when "broadcaster"
      [:broadcaster]
    else
      [:untyped]
    end

    to.each do |t|
      inputs[t] ||= {}
      inputs[t][from] = :low
    end

    modules[from] = [to, type]
  end

  lows = 0
  highs = 0
  loops = {}

  i = 0
  loop do
    return lows * highs if part == 1 && i == 1000
    i += 1

    pulses = [["broadcaster", :low, "button"]]

    until pulses.empty?
      to, signal, from = pulses.shift

      # "bq" because this is the only input to "rx"
      if part == 2 && to == "bq" && signal == :high
        loops[from] ||= i

        if loops.keys.sort == inputs["bq"].keys.sort
          return loops.values.reduce(&:lcm)
        end
      end

      case signal
      when :low then lows += 1
      when :high then highs += 1
      end

      next if modules[to].nil?

      case modules[to][1][0]
      when :flip_flop
        next if signal == :high

        if modules[to][1][1] == :off
          modules[to][1][1] = :on
          modules[to][0].each do |t|
            pulses << [t, :high, to]
          end
        else
          modules[to][1][1] = :off
          modules[to][0].each do |t|
            pulses << [t, :low, to]
          end
        end
      when :conjunction
        inputs[to][from] = signal
        if inputs[to].values.all? { |v| v == :high }
          modules[to][0].each do |t|
            pulses << [t, :low, to]
          end
        else
          modules[to][0].each do |t|
            pulses << [t, :high, to]
          end
        end
      when :broadcaster
        modules[to][0].each do |t|
          pulses << [t, signal, to]
        end
      end
    end
  end
end

puts "Part 1: #{solve(input, part: 1)}"
puts "Part 2: #{solve(input, part: 2)}"
