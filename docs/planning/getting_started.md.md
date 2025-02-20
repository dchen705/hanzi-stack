## Thoughts
### Idea dump
1. Main App
	* **Chinese Characters (HSK) Flash Cards**
		* backend
			* lists 2000+ chars but can filter and sort by hsk level, frequency, marked status, radicals, personal proficiency (green, yellow, red)
				* use tags column
			* create custom flashcard decks
			* add customer characters
				* upload a csv of new chars
			* parse text, extract new chars, iterate each new char - "add to db?"
			* take test, display progress in each hsk level
		* frontend
			* display random example sentence with char (LLM generated)
	* Video transcript/Text to Audio
		* YouTube vid transcripts to audio
		* Forums to audio
2. Features
	* Add user-specific global tags and proficiency per character
		* ie: "partes del cuerpo"
	* Pagination or Grid view
	* User authentication
	* Mobile Friendly
	* Extendable to other languages
		* ie: Spanish
3. Future Features
	1. LLM

### Problems
* Character limits of AI and translation AI

### Strategy
- Focus on core UX
	- minimal content (HSK 1 and 2 only) - extend in future
	- deck stack manipulation to avoid redundancy, allow personalization
	- progress tracking for motivation
	- example UX
		- user filter searches database for hsk-1 tagged characters, clone characters into a deck, display deck characters in a grid, filter deck by "pass proficiency", select all then remove, display remaining characters of their deck, manually select 10, clone to a new deck called current, enter view mode which iterates and shows each card of deck, for each card - can mark a proficiency as fail, not yet, pass for each card which marks all duplicates + the original
	- offline mode
		- session stored custom review list
			- example: excalidraw storage, no signup required

## Research
Sources: Github, YouTube, LLMs, job boards/marketplaces, academia

### HSK flashcard app examples
https://github.com/stephenmccready/HSK-Flashcards
https://github.com/tnm/hsk
https://github.com/alyssabedard/chinese-hsk-and-frequency-lists

	UX Analysis
		* https://www.reddit.com/r/ChineseLanguage/comments/11uqd7i/am_i_doing_flash_cards_wrong/
		* 

## Sketch / Prototyping

I