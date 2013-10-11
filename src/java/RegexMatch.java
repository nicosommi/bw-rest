package com.hp.labs.tibco.bw.regex;

import java.util.regex.Pattern;

public class RegexMatch {

    public static final String[][] HELP_STRINGS = {

		{ 
			"match", 
			"match(<i>string</i>, <i>pattern</i>)<p><p>Says if the given string matches the regular expression."
		}

	};

	public static boolean match (String input, String pattern) {
		return Pattern.matches(pattern, input);
	}
	
}