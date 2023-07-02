package com.hubu.online.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hubu.online.entity.*;
import com.hubu.online.utils.CoreUtil;
import com.hubu.online.service.RoleService;
import com.hubu.online.service.UserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 用户管理
 */
@Controller
@RequestMapping("/sys/user")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @RequiresPermissions("sys:user:view")
    @RequestMapping()
    public String view(Model model) {
        model.addAttribute("rolesJson", JSON.toJSONString(roleService.list()));
        return "system/user.html";
    }

    /**
     * 个人中心
     */
    @RequestMapping("/info")
    public String userInfo(Model model) {
        model.addAttribute("user", userService.getFullById(getLoginUserId()));
        return "index/user-info.html";
    }

    /**
     * 分页查询用户
     */
//    @RequiresPermissions("sys:user:list")
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<User> page(HttpServletRequest request) {
        PageParam<User> pageParam = new PageParam<>(request);
        pageParam.setDefaultOrder(null, new String[]{"create_time"});
        return userService.listPage(pageParam);
    }

    /**
     * 查询全部用户
     */
    @RequiresPermissions("sys:user:list")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        PageParam<User> pageParam = new PageParam<>(request);
        List<User> records = userService.listAll(pageParam.getNoPageParam());
        return JsonResult.ok().setData(pageParam.sortRecords(records));
    }

    /**
     * 根据id查询用户
     */
    @RequiresPermissions("sys:user:list")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        PageParam<User> pageParam = new PageParam<>();
        pageParam.put("userId", id);
        List<User> records = userService.listAll(pageParam.getNoPageParam());
        return JsonResult.ok().setData(pageParam.getOne(records));
    }

    /**
     * 添加用户
     */
    @RequiresPermissions("sys:user:save")
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult save(@RequestBody User user) {
        user.setState(0);
        user.setPassword(userService.encodePsw(user.getPassword()));
        if (userService.saveUser(user)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 修改用户
     */
    @RequiresPermissions("sys:user:update")
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(@RequestBody User user) {
        user.setState(null);  // 状态不能修改
        user.setPassword(null);  // 密码不能修改
        user.setUsername(null);  // 账号不能修改
        if (userService.updateUser(user)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 删除用户
     */
    @RequiresPermissions("sys:user:remove")
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(Integer id) {
        if (userService.removeById(id)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 批量修改用户
     */
    @RequiresPermissions("sys:user:update")
    @ResponseBody
    @RequestMapping("/updateBatch")
    public JsonResult updateBatch(@RequestBody BatchParam<User> batchParam) {
        // 不能修改的字段
        batchParam.getData().setPassword(null);
        batchParam.getData().setState(null);
        batchParam.getData().setUsername(null);
        batchParam.getData().setPhone(null);
        if (batchParam.update(userService, "user_id")) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 批量删除用户
     */
    @RequiresPermissions("sys:user:remove")
    @ResponseBody
    @RequestMapping("/removeBatch")
    public JsonResult deleteBatch(@RequestBody List<Integer> ids) {
        if (userService.removeByIds(ids)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 修改用户状态
     */
    @RequiresPermissions("sys:user:update")
    @ResponseBody
    @RequestMapping("/state/update")
    public JsonResult updateState(Integer id, Integer state) {
        if (state == null || (state != 0 && state != 1)) {
            return JsonResult.error("状态值不正确");
        }
        User user = new User();
        user.setUserId(id);
        user.setState(state);
        if (userService.updateById(user)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 批量修改用户状态
     */
    @RequiresPermissions("sys:user:update")
    @ResponseBody
    @RequestMapping("/state/updateBatch")
    public JsonResult updateStateBatch(@RequestBody BatchParam<User> batchParam) {
        User user = new User();
        user.setState(batchParam.getData().getState());
        if (user.getState() == null || (user.getState() != 0 && user.getState() != 1)) {
            return JsonResult.error("状态值不正确");
        }
        if (batchParam.update(userService, "user_id")) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 重置密码
     */
    @RequiresPermissions("sys:user:update")
    @ResponseBody
    @RequestMapping("/psw/reset")
    public JsonResult resetPsw(Integer id, String password) {
        User user = new User();
        user.setUserId(id);
        user.setPassword(userService.encodePsw(password));
        if (userService.updateById(user)) {
            return JsonResult.ok("重置成功");
        } else {
            return JsonResult.error("重置失败");
        }
    }

    /**
     * 批量重置密码
     */
    @RequiresPermissions("sys:user:update")
    @ResponseBody
    @RequestMapping("/psw/resetBatch")
    public JsonResult resetPswBatch(@RequestBody BatchParam<User> batchParam) {
        User user = new User();
        user.setPassword(userService.encodePsw(batchParam.getData().getPassword()));
        if (batchParam.update(userService, "user_id")) {
            return JsonResult.ok("重置成功");
        } else {
            return JsonResult.error("重置失败");
        }
    }

    /**
     * 修改自己密码
     */
    @ResponseBody
    @RequestMapping("/psw/update")
    public JsonResult updatePsw(String oldPsw, String newPsw) {
        if (StrUtil.hasBlank(oldPsw, newPsw)) {
            return JsonResult.error("参数不能为空");
        }
        if (getLoginUserId() == null) {
            return JsonResult.error("未登录");
        }
        if (!userService.comparePsw(userService.getById(getLoginUserId()).getPassword(), oldPsw)) {
            return JsonResult.error("原密码输入不正确");
        }
        User user = new User();
        user.setUserId(getLoginUserId());
        user.setPassword(userService.encodePsw(newPsw));
        if (userService.updateById(user)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 修改自己资料
     */
    @ResponseBody
    @RequestMapping("/info/update")
    public JsonResult updateInfo(User user) {
        user.setUserId(getLoginUserId());
        // 不能修改的字段
        user.setState(null);
        user.setPassword(null);
        user.setUsername(null);
        if (userService.updateById(user)) {
            User loginUser = getLoginUser();
            if (user.getNickName() != null) {
                loginUser.setNickName(user.getNickName());
            }
            if (user.getAvatar() != null) {
                loginUser.setAvatar(user.getAvatar());
            }
            return JsonResult.ok("保存成功");
        }
        return JsonResult.error("保存失败");
    }

    /**
     * excel导入用户
     */
    @Transactional
    @RequiresPermissions("sys:user:save")
    @ResponseBody
    @RequestMapping("/import")
    public JsonResult importBatch(MultipartFile file) {
        StringBuilder sb = new StringBuilder();
        try {
            // 读取excel
            int startRow = 1;
            ExcelReader reader = ExcelUtil.getReader(file.getInputStream(), 0);
            List<List<Object>> list = reader.read(startRow);
            // 进行非空和重复检查
            sb.append(CoreUtil.excelCheckBlank(list, startRow, 0, 1, 2, 3, 4, 7));
            sb.append(CoreUtil.excelCheckRepeat(list, startRow, 0, 5, 6));
            if (!sb.toString().isEmpty()) {
                return JsonResult.error(sb.toString());
            }
            // 进行数据库层面检查
            List<User> users = new ArrayList<>();
            for (int i = 0; i < list.size(); i++) {
                List<Object> objects = list.get(i);
                String username = String.valueOf(objects.get(0));  // 账号
                String password = String.valueOf(objects.get(1));  // 密码
                String nickName = String.valueOf(objects.get(2));  // 用户名
                String sexName = String.valueOf(objects.get(3));  // 性别
                String roleName = String.valueOf(objects.get(4));  // 角色名
                String phone = String.valueOf(objects.get(5));  // 手机号
                String email = String.valueOf(objects.get(6));  // 邮箱
                String orgName = String.valueOf(objects.get(7));  // 组织机构
                if (userService.count(new QueryWrapper<User>().eq("username", username)) > 0) {
                    sb.append("第");
                    sb.append(i + startRow + 1);
                    sb.append("行第1");
                    sb.append("列账号已存在;\r\n");
                }
                if (StrUtil.isNotBlank(phone) && userService.count(new QueryWrapper<User>().eq("phone", phone)) > 0) {
                    sb.append("第");
                    sb.append(i + startRow + 1);
                    sb.append("行第6");
                    sb.append("列手机号已存在;\r\n");
                }
                if (StrUtil.isNotBlank(email) && userService.count(new QueryWrapper<User>().eq("email", email)) > 0) {
                    sb.append("第");
                    sb.append(i + startRow + 1);
                    sb.append("行第7");
                    sb.append("列邮箱已存在;\r\n");
                }
                User user = new User();
                user.setUsername(username);

                Role role = roleService.getOne(new QueryWrapper<Role>().eq("role_name", roleName), false);
                if (role == null) {
                    sb.append("第");
                    sb.append(i + startRow + 1);
                    sb.append("行第5");
                    sb.append("列角色不存在;\r\n");
                } else {
                    user.setRoleIds(Collections.singletonList(role.getRoleId()));
                }

                users.add(user);
            }
            if (!sb.toString().isEmpty()) {
                return JsonResult.error(sb.toString());
            }
            // 开始添加用户
            int okNum = 0, errorNum = 0;
            for (User user : users) {
                if (userService.saveUser(user)) {
                    okNum++;
                } else {
                    errorNum++;
                }
            }
            return JsonResult.ok("导入完成，成功" + okNum + "条，失败" + errorNum + "条");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return JsonResult.error("导入失败");
    }

}
