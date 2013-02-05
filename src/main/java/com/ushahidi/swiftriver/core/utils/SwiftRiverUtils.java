/**
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/agpl.html>
 * 
 * Copyright (C) Ushahidi Inc. All Rights Reserved.
 */
package com.ushahidi.swiftriver.core.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.regex.Pattern;

import com.ushahidi.swiftriver.SwiftRiverException;

/**
 * Helper methods
 * @author ekala
 *
 */
public class SwiftRiverUtils {

	private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");
	private static final Pattern WHITESPACE = Pattern.compile("[\\s]");

	/**
	 * Given a number of set of strings, concatenates them and computes
	 * their MD5 hash
	 * 
	 * @param tokens
	 * @return
	 */
	public static String getMD5Hash(Object... tokens) {
		String md5String = null;
		
		if (tokens.length == 0) {
			// Throw the exception
			throw new SwiftRiverException("No token strings found");
		}
		
		try {
			// Concatenate the tokens into a single string
			StringBuffer hashPayload = new StringBuffer();
			for (Object token: tokens) {
				hashPayload.append(token);
			}

			String hashPayloadString =  hashPayload.toString();

			// Create a message digest object for MD5
			MessageDigest digest = MessageDigest.getInstance("MD5");
			digest.update(hashPayloadString.getBytes(), 0, hashPayloadString.length());
			
			// Convert the message digest value in base 16 (hex)
			md5String = new BigInteger(1, digest.digest()).toString(16);

		} catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return md5String;
	}

	/**
	 * Given a phrase (string), generates and returns a URL "slug"
	 * The phrase is first normalized normalized and any whitespaces
	 * are replaced with hyphens ("-")
	 * 
	 * @param phrase
	 * @return
	 */
	public static String getURLSlug(String phrase) {
		if (phrase == null || phrase.trim().length() == 0)
			return "";
		
		String nonWhitespace = WHITESPACE.matcher(phrase).replaceAll("-");
		String normalized = Normalizer.normalize(nonWhitespace, Form.NFD);
		String slug = NONLATIN.matcher(normalized).replaceAll("");

		return slug.toLowerCase();
	}

}
