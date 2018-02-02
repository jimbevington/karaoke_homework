require('minitest/autorun')
require('minitest/rg')

require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../karaoke_bar.rb')

class TestKaraokeBar < MiniTest::Test

  def setup
    # @guest1 = Guest.new("The Pope", 10)
    # @guest2 = Guest.new("Ant McPartlin", 15)
    # @guest3 = Guest.new("Popeye", 25)
    @song1 = Song.new("The Visitors", "Abba")
    @song2 = Song.new("Get Ur Freak On", "Missy Elliott")
    @song3 = Song.new("It's Gonna Rain", "Steve Reich")
    @playlist1 = [@song1, @song2, @song3]
    # # @playlist2 = [@song2, @song3]
    # @room1 = Room.new("Purgatory", 2, 20)
    # @room2 = Room.new("IKEA", 2, 30)
    @karaoke_bar = KaraokeBar.new("Posers", @playlist1, [@room1, @room2, @room3])
  end

  def test_bar_has_name
    assert_equal("Posers", @karaoke_bar.name)
  end

  def test_bar_has_songs
    assert_equal(3, @karaoke_bar.songs.count)
  end

  def test_bar_has_rooms
    assert_equal(3, @karaoke_bar.rooms.count)
  end

  def test_bar_has_guests__none
    assert_equal([], @karaoke_bar.guests)
  end

  # could make this, check in guests
  def test_check_in_guest
    guest = Guest.new("The Pope", 10)
    room = Room.new("Purgatory", 5, 10)
    @karaoke_bar.check_in(guest, room)
    assert_equal(1, room.guests.count)
  end

  def test_check_out_guest
    guest = Guest.new("Ant McPartlin", 10)
    room = Room.new("IKEA", 5, 10)
    @karaoke_bar.check_in(guest, room)
    @karaoke_bar.check_out(guest, room)
    assert_equal(0, room.guests.count)
  end

  def test_add_songs_to_room__multiple_songs
    room = Room.new("Barftopia", 10, 12)
    @karaoke_bar.add_songs(room, @playlist1)
    assert_equal(3, room.songs.count)
  end

  def test_add_songs_to_room__single_songs
    room = Room.new("The Dungeon", 10, 12)
    song = Song.new("Hammer Fight", "Agoraphobic Nosebleed")
    @karaoke_bar.add_songs(room, song)
    assert_equal(1, room.songs.count)
  end

  def test_room_capacity_full
    room = Room.new("The Matrix", 2, 10)
    guest1 = Guest.new("Wilbur", 10)
    guest2 = Guest.new("Maude", 10)
    guest3 = Guest.new("Cleetus", 10)
    @karaoke_bar.check_in(guest1, room)
    @karaoke_bar.check_in(guest2, room)
    result = @karaoke_bar.check_in(guest3, room)
    assert_equal("Room Full. GET OUT!!!", result)
    assert_equal(2, room.guests.count)
  end

  def test_check_guest_money__can_afford
    guest = Guest.new("Stinky", 50)
    room = Room.new("Lush Tunes", 4, 30)
    @karaoke_bar.check_in(guest, room)
    assert_equal(1, room.guests.count)
  end
  #
  def test_check_guest_money__cant_afford
    guest = Guest.new("Vladimir", 50)
    room = Room.new("Mar a Lago", 4, 100)
    result = @karaoke_bar.check_guest_money(guest, room)
    assert_equal("You can't afford it!", result)
    assert_equal(0, room.guests.count)
  end

  # def test_guest_cant_afford_room
  #   result = @karaoke_bar.check_in(@guest1, @room2)
  #   assert_equal("Excuuuuuuse me! This costs £30, you have £10.", result)
  # end

end
