/**
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as
 *  published by the Free Software Foundation, either version 3 of the
 *  License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.ushahidi.swiftriver.core.api.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Test;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class AccountsControllerTest extends AbstractControllerTest {

	@Test
	public void getAccount() throws Exception {
		this.mockMvc
				.perform(get("/v1/accounts/1"))
				.andExpect(status().isOk())
				.andExpect(
						content().contentType("application/json;charset=UTF-8"))
				.andExpect(jsonPath("$.id").value(1));
	}

	@Test
	public void getAuthenticatedUserAccount() throws Exception {		
		Authentication authentication = new UsernamePasswordAuthenticationToken(
				"user1", "password");
		SecurityContextHolder.getContext().setAuthentication(authentication);

		this.mockMvc
				.perform(get("/v1/accounts/me").principal(authentication))
				.andExpect(status().isOk())
				.andExpect(
						content().contentType("application/json;charset=UTF-8"))
				.andExpect(jsonPath("$.id").value(3))
				.andExpect(jsonPath("$.account_path").value("user1"))
				.andExpect(jsonPath("$.active").value(true))
				.andExpect(jsonPath("$.public").value(true))
				.andExpect(jsonPath("$.date_added").value("Mon, 31 Dec 2012 21:00:02 +0000"))
				.andExpect(jsonPath("$.river_quota_remaining").value(20))
				.andExpect(jsonPath("$.follower_count").value(2))
				.andExpect(jsonPath("$.following_count").value(1))
				.andExpect(jsonPath("$.is_owner").value(true))
				.andExpect(jsonPath("$.is_collaborator").value(false))
				.andExpect(jsonPath("$.is_following").value(false))
				.andExpect(jsonPath("$.owner.name").value("User 1"))
				.andExpect(jsonPath("$.owner.email").value("user1@myswiftriver.com"))
				.andExpect(jsonPath("$.owner.username").value("user1"))
				.andExpect(jsonPath("$.owner.date_added").value("Mon, 31 Dec 2012 21:00:02 +0000"))
				.andExpect(jsonPath("$.rivers").exists())
				.andExpect(jsonPath("$.rivers[0].id").value(1))
				.andExpect(jsonPath("$.rivers[0].name").value("River 1"))
				.andExpect(jsonPath("$.rivers[0].follower_count").value(0))
				.andExpect(jsonPath("$.rivers[0].is_collaborating").value(false))
				.andExpect(jsonPath("$.rivers[0].is_following").value(false))
				.andExpect(jsonPath("$.rivers[0].public").value(true))
				.andExpect(jsonPath("$.rivers[0].active").value(true))
				.andExpect(jsonPath("$.rivers[0].drop_count").value(100))
				.andExpect(jsonPath("$.rivers[0].drop_quota").value(10000))
				.andExpect(jsonPath("$.rivers[0].full").value(false))
				.andExpect(jsonPath("$.rivers[0].date_added").value("Tue, 1 Jan 2013 21:00:02 +0000"))
				.andExpect(jsonPath("$.rivers[0].expiry_date").value("Fri, 1 Feb 2013 21:00:02 +0000"))
				.andExpect(jsonPath("$.rivers[0].extension_count").value(0))
				.andExpect(jsonPath("$.buckets").exists())
				.andExpect(jsonPath("$.buckets[0].id").value(1))
				.andExpect(jsonPath("$.buckets[0].name").value("Bucket 1"))
				.andExpect(jsonPath("$.buckets[0].description").value("A Bucket"))
				.andExpect(jsonPath("$.buckets[0].follower_count").value(0))
				.andExpect(jsonPath("$.buckets[0].is_collaborating").value(false))
				.andExpect(jsonPath("$.buckets[0].is_following").value(false))
				.andExpect(jsonPath("$.buckets[0].public").value(true))
				.andExpect(jsonPath("$.buckets[0].drop_count").value(13))
				.andExpect(jsonPath("$.buckets[0].date_added").value("Tue, 1 Jan 2013 21:00:02 +0000"));
	}
}
