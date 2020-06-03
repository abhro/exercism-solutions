# frozen_string_literal: true

# Report on tourney info
module Reporter
  HEADER = "Team                           | MP |  W |  D |  L |  P\n"

  TEAM_FORMAT =
    '%<name>-30s | %<match>2i | %<win>2i | %<draw>2i | %<loss>2i | %<points>2i'

  def tally
    evaluate_matchstring unless @matchstring.strip.empty?
    return HEADER if @teams.empty?

    HEADER + @teams.values.sort_by do |team|
      [-team.points, team.team_name] # sort by points in descending order
    end.join("\n") + "\n"
  end

  def team_to_s
    format(FORMAT, name: team_name, match: matches_played,
                   win: wins, losse: losses, draw: draws, point: points)
  end
end

# Parse input tourney data
module Parser
end

# Represent a tournament history
class Tournament
  def self.tally(matchstring)
    new(matchstring).tally
  end

  include Reporter

  def initialize(matchstring)
    @matchstring = matchstring
    @teams = Hash.new { |hash, name| hash[name] = Team.new(name) }
  end

  private

  def evaluate_matchstring
    @matchstring.each_line do |line|
      home, away, result = parse_matchstring_line(line)
      convert_result(@teams[home], @teams[away], result)
    end
  end

  def parse_matchstring_line(line)
    captured = line.match(
      /^(?<home>[\w ]+);(?<away>[\w ]+);(?<result>win|loss|draw)/
    )
    [captured[:home], captured[:away], captured[:result]]
  end

  def convert_result(first_team, second_team, result)
    if result == 'win'
      first_team.win
      second_team.lose
    elsif result == 'loss'
      first_team.lose
      second_team.win
    elsif result == 'draw'
      first_team.draw
      second_team.draw
    end
  end
end

# Represent a team and their play history
class Team
  def initialize(team_name, wins: 0, losses: 0, draws: 0)
    @team_name = team_name
    @wins = wins
    @losses = losses
    @draws = draws
  end

  attr_reader :team_name, :wins, :losses, :draws

  # rubocop: disable Style/SingleLineMethods, Layout/EmptyLineBetweenDefs
  def matches_played; wins + losses + draws end
  def points;         wins * 3 + draws      end
  def win;            @wins += 1            end
  def lose;           @losses += 1          end
  def draw;           @draws += 1           end
  alias tie draw
  # rubocop: enable Style/SingleLineMethods, Layout/EmptyLineBetweenDefs
end
