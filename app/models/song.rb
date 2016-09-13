class Song < ActiveRecord::Base

  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  # ask question about why using attr_reader doesnt work?
  def genre_name
    self.genre.name unless self.genre.blank?
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name unless self.artist.blank?
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes << Note.create(content: content) unless content.blank?
    end
  end

  def note_contents
    self.notes.collect {|note| note.content} unless self.notes.blank?
  end

end

