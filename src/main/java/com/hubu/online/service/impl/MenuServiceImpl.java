package com.hubu.online.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hubu.online.controller.PageParam;
import com.hubu.online.controller.PageResult;
import com.hubu.online.mapper.MenuMapper;
import com.hubu.online.entity.Menu;
import com.hubu.online.service.MenuService;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 菜单服务实现类
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {
    @Override
    public PageResult<Menu> listPage(PageParam<Menu> pageParam) {
        return new PageResult<>(baseMapper.listPage(pageParam), pageParam.getTotal());
    }

    @Override
    public List<Menu> getUserMenu(Integer userId, Integer menuType) {
        return baseMapper.listByUserId(userId, menuType);
    }

    @Override
    public List<Menu> toMenuTree(List<Menu> menus, Integer parentId) {
        List<Menu> list = new ArrayList<>();
        for (Menu menu : menus) {
            if (parentId.equals(menu.getParentId())) {
                menu.setChildren(toMenuTree(menus, menu.getMenuId()));
                list.add(menu);
            }
        }
        return list;
    }

}
