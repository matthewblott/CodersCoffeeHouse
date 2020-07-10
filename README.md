Coder's Coffee House Template
=============================

This is the template for the [coderscoffeehouse.com](https://coderscoffeehouse.com) website. Posts aren't included.


Image Helper
-------------

A helper file ```_helper.rb``` for creating a range of images from the most recently captured screenshot is included.

### Requirements

Make sure the following are present:
* ~/Pictures/PROJECT_NAME
* ~/Pictures/Screenshots

Make sure files saved to the Screenshots folder are in the following format:
* s yyyy-MM-dd at HH.mm.ss
* s 2020-07-10 at 14.01.12 for example

Run Program
-----------

To run simply execute the following:

```
ruby _helper.rb
```

Description
-----------

The program will search ~/Pictures/Screenshots for the most recent file. 
Three smaller files will be created using ImageMagick they will be saved in the following paths:
* ./_assets/images/posts/yyyyMMdd/HHmmss-[xs | sm | md].jpg
* ./_assets/images/posts/20200707/105846-sm.jpg for example

The original file will then be moved to the following path to prevent cluttering the Screenshots folder:
* ~/Pictures/PROJECT_NAME/yyyy-MM-dd@HH.mm.ss.jpg
* ~/Pictures/PROJECT_NAME/2020-07-07@10.58.46.jpg for example

