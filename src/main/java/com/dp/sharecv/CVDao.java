package com.dp.sharecv;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

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
		if (!StringUtils.isEmpty(email)) {
			query.addCriteria(Criteria.where("email").is(email));
		}
		if (!StringUtils.isEmpty(password)) {
			query.addCriteria(Criteria.where("password").is(password));
		}
		User user = (User) mongoOperations.findOne(query, User.class);
		return user;
	}

	public CVInfo getCVDetails(String email) {
		Query query = new Query();
		query.addCriteria(Criteria.where("email").is(email));
		CVInfo cv = (CVInfo) mongoOperations.findOne(query, CVInfo.class);
		return cv;
	}

	public boolean updateUser(User user) {
		Query query = new Query();
		query.addCriteria(Criteria.where("email").is(user.getEmail()));
		Update update = new Update();
		update.set("password", user.getPassword());
		mongoOperations.updateFirst(query, update, User.class);
		return true;
	}
}
