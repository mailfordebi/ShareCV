package com.dp.sharecv;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class CVDao {
	@Autowired
	private MongoOperations mongoOperations;

	public boolean saveCV(CVInfo cvInfo) {
		try {
			mongoOperations.save(cvInfo);
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	public String newUser(User user) {
		User usr = getUserDetails(user.getEmail(), user.getPassword());
		if (usr != null) {
			return CVUtil.USER_ALREADY_EXIST;
		} else {
			try {
				mongoOperations.save(user);
				return CVUtil.REGISTER_SUCCESS;
			} catch (Exception e) {
				System.out.println(e);
				return CVUtil.REGISTER_ERROR;
			}
		}
	}

	public User getUserDetails(String email, String password) {
		Query query = new Query();
		query.addCriteria(Criteria.where("email").is(email));
		query.addCriteria(Criteria.where("password").is(password));
		User user = (User) mongoOperations.findOne(query, User.class);
		return user;
	}
}
