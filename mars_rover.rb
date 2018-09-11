class Rover
    def initialize(x = 1, y = 1, direction = 0)
        @x = x
        @y = y
        @direction = direction
    end

    def read_instruction
        print "Current co-ordinates are #{@x} #{@y} #{nsew}. Please enter movement instructions: "
        instruction = gets.chomp.upcase.delete(' ').to_s
        instructions = instruction.split('')
        instructions.each do |char|
            if char != 'M' && char != 'L' && char != 'R'
                puts 'Invalid instructions, may only use "L", "R", or "M"'
                break
            elsif char == 'L' || char == 'R'
                turn(char)
            elsif char == 'M'
                move
            end
        end
        puts "New co-ordinates are #{@x} #{@y} #{nsew}."
    end

    def turn(char)
        if char == 'L'
            @direction == 0 ? @direction = 3 : @direction -= 1
        elsif char == 'R'
            @direction = (@direction + 1) % 4
        end
    end

    def move
        message = "Cannot move further!"
        if @direction == 0
            @y == 9 ? puts(message) : @y += 1
        elsif @direction == 1
            @x == 9 ? puts(message) : @x += 1
        elsif @direction == 2
            @y == 1 ? puts(message) : @y -= 1
        elsif @direction == 3
            @x == 1 ? puts(message) : @x -= 1
        end
    end

    def nsew
        if @direction == 0
            return 'N'
        elsif @direction == 1
            return 'E'
        elsif @direction == 2
            return 'S'
        elsif @direction == 3
            return 'W'
        end
    end
end