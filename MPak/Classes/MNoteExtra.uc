// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MNoteExtra extends MNote
	Config(MPak);


struct ChaptersStruct
{
	var() array<string> Notes;
};

struct TableOfContentsStruct
{
	var() string NoteSectionTitle;
	var() int NoteIndex;
};

var(MNote) string NoteTitle;
var(MNote) array<TableOfContentsStruct> NoteTableOfContents;
var(MNote) array<ChaptersStruct> NoteChapters;