#/
 # @file
 # @author  Dan Koksal w4nder1n9w12ard (at) gmail (dot) com
 # @version 1.0
 #
 # @section LICENSE
 #
 # This program is free software; you can redistribute it and/or
 # modify it under the terms of the GNU General Public License as
 # published by the Free Software Foundation; either version 2 of
 # the License, or (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful, but
 # WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 # General Public License for more details at
 # http://www.gnu.org/copyleft/gpl.html
 #
 # @section DESCRIPTION
 #
 # www.lairthegame.com
 # LAIR is a social sandbox dungeon crawling game
 #/
##!/usr/local/bin/python
import os
mydir = os.getcwd()

def list_files_in_folder(relative_path_to_folder):
	list_of_file_names = []
	new_line = "\t<" + "graphic>"
	end_line = "</graphic>\n"
	graphics_root = "graphics/"
	slash = "/"
	close_line = "\"" + ">"
	for dirname, dirnames, filenames in os.walk('.'):
		for filename in filenames:
			list_of_file_names.append(new_line + graphics_root + relative_path_to_folder + slash + filename +end_line )
	return list_of_file_names
	
def pragmatic_file_builder(relative_path_to_folder):
	print mydir
	ME = os.path.join(mydir,relative_path_to_folder)
	print ME
	os.chdir(ME)
	folder_name = os.getcwd() 
	file_name = folder_name + ".xml"
	os.path.split(mydir)
	FILE = open(file_name,'w')
	xml_head = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\" ?>\n"
	xml_root = "<ImageListing>\n"
	xml_close = "</ImageListing>"
	FILE.writelines(xml_head)
	FILE.writelines(xml_root)
	FILE.writelines(list_files_in_folder(relative_path_to_folder))
	FILE.writelines(xml_close)
	FILE.close()

def loadtest():
	print "Testing the file indexer"
	pragmatic_file_builder(test_path)

def loadall():
	print "Generating file indexes"
	gse = "Sprites/Eyes"
	gsf = "Sprites/Face"
	gsb = "Sprites/figures"
	gsh = "Sprites/Hair"
	gsg = "Sprites/Hands"
	gsi = "Sprites/Hat"
	gsn = "Sprites/Necklace"
	gsp = "Sprites/Pants"
	gsr = "Sprites/Ring"
	gss = "Sprites/Shirts"
	gst = "Sprites/Shoes"
	gsc = "Sprites/StatusCodes"
	gsws = "Sprites/Weapons/Swing"
	gswt = "Sprites/Weapons/Throw"
	gmm = "Interface/Menus"
	gmb = "Interface/Buttons"
	gtr = "Tiles/Real"
	gff = "Floors"
	gft = "Fonts"
	pragmatic_file_builder(gse)
	pragmatic_file_builder(gse)
	pragmatic_file_builder(gsf)
	pragmatic_file_builder(gsb)
	pragmatic_file_builder(gsh)
	pragmatic_file_builder(gsg)
	pragmatic_file_builder(gsi)
	pragmatic_file_builder(gsn)
	pragmatic_file_builder(gsp)
	pragmatic_file_builder(gsr)
	pragmatic_file_builder(gss)
	pragmatic_file_builder(gst)
	pragmatic_file_builder(gsc)
	pragmatic_file_builder(gsws)
	pragmatic_file_builder(gswt)
	pragmatic_file_builder(gmm)
	pragmatic_file_builder(gmb)
	pragmatic_file_builder(gtr)
	pragmatic_file_builder(gff)
	pragmatic_file_builder(gft)

loadall()

