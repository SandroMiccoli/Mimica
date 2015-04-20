# Mimica

An interactive installation that users record themselves trying to act a word using their bodies. Users can also see, on another screen, content related to each word.

### File structure

The following file structure indicates where the content should be placed. The words in the *activeWords* folder will be available for the users to select. The folder *words* is used only for organizing other content.

- data
  - activeWords
    - word1
      - video1.ogg
      - video2.ogg
      - image1.jpg
      - ...
    - word2
    - word3
    - ...
  - words
    - word4
    - word5
    - ...

####Add content for the user

To add content, you simply add a folder of the new word (the name of the folder is the new word) to the *activeWords* folder and add content in that folder.

Example: I have content related to the word **Reflect**, then I simply create a folder named **Reflect** in the *activeWords* folder.

####Remove content

To remove content, simply move the word folder from *activeWords* to *words*.