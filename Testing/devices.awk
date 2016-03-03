#!/usr/bin/awk -f
BEGIN {
	version = "";
}
{
    line = $0;
    if (line !~ ".*Devices.*") {
	    if (line ~ /--.*--/) {
	    	version = line;
	    } else {
	    	print version, " | ", line 	
	    }
    }
}