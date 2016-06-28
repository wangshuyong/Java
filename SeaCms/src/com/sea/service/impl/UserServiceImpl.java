package com.sea.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.sea.dao.UserDao;
import com.sea.model.User;
import com.sea.service.UserService;
import com.sea.util.BussAnnotation;
import com.sea.util.MD5Util;

@Component("userService")
public class UserServiceImpl implements UserService {
	private UserDao userDao;
	private String importMessage;

	public UserDao getUserDao() {
		return userDao;
	}

	@Resource(name = "userDao")
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public boolean exists(String str) {
		List<User> list = userDao.findUserByPhone(str);
		if (list.size() > 0) {
			return true;
		} else
			return false;
	}

	@Override
	@BussAnnotation(moduleName="用户管理",option="用户登录")
	public User login(String phone, String pwd) {
		List<User> list = userDao.userLogin(phone, MD5Util.getPassMD5(pwd));
		User user = (User) list.get(0);
		if (list.size() <= 0) {
			return null;
		} else {
			user.setLastLoginTime(new Timestamp(System.currentTimeMillis()));
			userDao.update(user);
			return user;
		}

	}

	@Override
	@BussAnnotation(moduleName="用户管理",option="添加用户")
	public String addUser(User u) {
		if (exists(u.getPhone()) || "".equals(u.getPhone())) {
			return "fail";
		} else
			u.setPassword(MD5Util.getPassMD5("123456"));
			u.setCreateTime(new Timestamp(System.currentTimeMillis()));
			userDao.save(u);
		return "add";

	}

	@Override
	@BussAnnotation(moduleName="用户管理",option="批量导入用户")
	public String importUsers(ArrayList<ArrayList<String>> list) {
		/**
		 * if(list.get(0).size() != 7 ){ importMessage="用户excel文件中的列数不正确！"; }
		 * if(!list.get(0).get(0).equals("用户名")){ importMessage =
		 * "用户excel文件中的第一列应该为“用户名”！"; } if(!list.get(0).get(1).equals("性别")){
		 * importMessage = "用户excel文件中的第二列应该为“性别”！"; }
		 * if(!list.get(0).get(2).equals("邮箱")){ importMessage =
		 * "用户excel文件中的第三列应该为“邮箱”！"; } if(!list.get(0).get(0).equals("手机号")){
		 * importMessage = "用户excel文件中的第一列应该为“手机号”！"; }
		 * if(!list.get(0).get(4).equals("部门")){ importMessage =
		 * "用户excel文件中的第五列应该为“部门”！"; } if(!list.get(0).get(5).equals("职位")){
		 * importMessage = "用户excel文件中的第六列应该为“职位”！"; }
		 * if(!list.get(0).get(6).equals("角色")){ importMessage =
		 * "用户excel文件中的第七列应该为“角色”！"; }
		 **/
		for (int i = 0; i < list.size(); ++i) {
			int index = i + 1;
			User user = new User();
			// 第一列：手机号处理
			String firstColumn = list.get(i).get(0);

			if (firstColumn.equals("")) {
				importMessage = "第" + index + "行，第1列为空，导入失败,请修正后重新导入！！！";
				break;
			} else {
				if (firstColumn.trim().length() > 11) {
					importMessage = "第" + index
							+ "行，第1列“手机”号码格式错误，导入失败,请修正后重新导入！！！";
					break;
				} else {
					if (this.exists(firstColumn)) {
						importMessage = "第" + index + "行，第1列" + firstColumn
								+ "已存在，导入失败,请修正后重新导入！！！";
						break;
					}
					user.setPhone(firstColumn);
				}
			}
			// 第二列：姓名处理
			String secondColumn = list.get(i).get(1);
			if (secondColumn.equals("")) {
				importMessage = "第" + index + "行，第2列为空，导入失败,请修正后重新导入！！！";
				break;
			} else {
				if (secondColumn.length() > 30) { // 长度过大
					importMessage = "第" + index
							+ "行，第2列“姓名”长度大于20，导入失败,请修正后重新导入！！！";
					break;
				}
				user.setRealName(secondColumn);
			}

			// 第三列：性别处理
			String thirdColumn = list.get(i).get(2);
			if (thirdColumn.equals("")) {
				importMessage = "第" + index + "行，第3列为空，导入失败,请修正后重新导入！！！";
				break;
			} else {
				if ((!thirdColumn.equals("男")) && (!thirdColumn.equals("女"))) { // 长度过大
					importMessage = "第" + index
							+ "行，第3列“性别”填写错误，导入失败,请修正后重新导入！！！";
					break;
				}
				user.setSex(thirdColumn);
			}

			// 第四列：年龄校验
			String forthColumn = list.get(i).get(3);
			if (forthColumn.equals("")) {
				importMessage = "第" + index + "行，第4列为空，导入失败,请修正后重新导入！！！";
				break;
			} else {
				if (Integer.parseInt(forthColumn) < 0) { // 长度过大
					importMessage = "第" + index
							+ "行，第4列“年龄”填写错误，导入失败,请修正后重新导入！！！";
					break;
				}
				user.setAge(Integer.parseInt(forthColumn));
			}
			// 第五列：邮箱校验
			String fifthColumn = list.get(i).get(4);
			if (fifthColumn.equals("")) {
				importMessage = "第" + index + "行，第5列“邮箱”为空，导入失败,请修正后重新导入！！！";
				break;
			} else {
				Pattern p = Pattern.compile("(^([\\w-.]+)@)");
				Matcher m = p.matcher(fifthColumn);
				if (!m.find()) {
					importMessage = "第" + index
							+ "行，第5列“邮箱”不符合标准，导入失败,请修正后重新导入！！！";
					break;
				}
				user.setEmail(fifthColumn);
			}

			// 第六列：地址校验
			String sixthColumn = list.get(i).get(5);
			user.setAddress(sixthColumn);

			// 第七列：籍贯校验
			String seventhColumn = list.get(i).get(6);
			user.setNativePlace(seventhColumn);

			// 第八列：爱好校验
			String eighthColumn = list.get(i).get(7);
			user.setHobby(eighthColumn);
			// 默认密码是 123456
			user.setPassword(MD5Util.getPassMD5("123456"));

			// 设置权限，默认用户为普通用户
			user.setPower("0");
			// 创建时间
			user.setCreateTime(new Timestamp(System.currentTimeMillis()));
			this.userDao.save(user);

			importMessage = "导入成功";
		}
		return importMessage;
	}

	@Override
	@BussAnnotation(moduleName="用户管理",option="删除用户")
	public void deleteUser(int id) {
		userDao.delete(id);

	}

	@Override
	public List<User> getUsersByPage(int startRows, int pageSize) {
		List<User> list = userDao.listUserByPage(startRows, pageSize);
		return list;
	}

	public int getUserCount() {
		return userDao.getUsers().size();
	}

	@Override
	public User getUserById(int id) {
		User user = userDao.load(id);
		return user;
	}

	@Override
	@BussAnnotation(moduleName="用户管理",option="修改用户")
	public void updateUser(User user) {
		user.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		userDao.update(user);
	}

	// all attribute getters and setters method
	public String getImportMessage() {
		return importMessage;
	}

	public void setImportMessage(String importMessage) {
		this.importMessage = importMessage;
	}

}
