(*
 
 Move email to Processed folder
 Original code from http://forgetmenotes.blogspot.com/2011/01/mac-outlook-2011-keyboard-shortcut-to.html
 
*)

on run {}
	
	tell application "Microsoft Outlook"
		
		-- listSelectedItems : a list of all items selected in Entourage
		set selectedMessages to current messages
		
		-- Check to make sure items are selected, if not then quit
		if ((count of selectedMessages) < 1) then return
		
		set allFolders to mail folders
		repeat with aFolder in allFolders
			
			if (name of aFolder is "Archive") then
				set destinationFolder to aFolder
			end if
		end repeat
		
		try
			destinationFolder
		on error
			error "No folder found called 'Archive'"
		end try
		
		-- Iterate through selected items
		repeat with aMessage in selectedMessages
			
			if (class of account of aMessage is not imap account) then
				-- IMAP currently not supported
				set aMessage's is read to true
				move aMessage to destinationFolder
			end if
			
		end repeat
		
	end tell
	
end run
