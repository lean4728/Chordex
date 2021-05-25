require "application_system_test_case"

class ChordsTest < ApplicationSystemTestCase
  setup do
    @chord = chords(:one)
  end

  test "visiting the index" do
    visit chords_url
    assert_selector "h1", text: "Chords"
  end

  test "creating a Chord" do
    visit chords_url
    click_on "New Chord"

    fill_in "Artist", with: @chord.artist
    fill_in "Chords", with: @chord.chords
    fill_in "Page url", with: @chord.page_url
    fill_in "Song", with: @chord.song
    click_on "Create Chord"

    assert_text "Chord was successfully created"
    click_on "Back"
  end

  test "updating a Chord" do
    visit chords_url
    click_on "Edit", match: :first

    fill_in "Artist", with: @chord.artist
    fill_in "Chords", with: @chord.chords
    fill_in "Page url", with: @chord.page_url
    fill_in "Song", with: @chord.song
    click_on "Update Chord"

    assert_text "Chord was successfully updated"
    click_on "Back"
  end

  test "destroying a Chord" do
    visit chords_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chord was successfully destroyed"
  end
end
