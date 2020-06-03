# frozen_string_literal: true

class BeerSong
  FIRST_LINE = '%1$i bottles of beer on the wall, %1$i bottles of beer.'
  SECOND_LINE =
    'Take one down and pass it around, %i bottles of beer on the wall.'
  ONE_BEER = '1 bottle of beer on the wall, 1 bottle of beer.'
  END_BEERS =
    'Take it down and pass it around, no more bottles of beer on the wall.'
  BEERLESS = 'No more bottles of beer on the wall, no more bottles of beer.'
  BUY_BEER =
    'Go to the store and buy some more, 99 bottles of beer on the wall.'

  def self.recite(initial_beer, verses)
    song = String.new
    verses.times do
      song << if initial_beer.zero?
                BEERLESS + "\n" + BUY_BEER
              elsif initial_beer == 1
                ONE_BEER + "\n" + END_BEERS
              else
                format(FIRST_LINE, initial_beer) + "\n" + (
                  if initial_beer == 2
                    format(SECOND_LINE, initial_beer - 1)
                     .sub(' bottles ', ' bottle ')
                  else
                    format(SECOND_LINE, initial_beer - 1)
                  end
                )
              end
      song << "\n\n"
      initial_beer -= 1
    end
    song.chomp
  end
end
