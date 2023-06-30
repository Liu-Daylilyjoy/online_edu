package com.hubu.online.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hubu.online.entity.PageParam;
import com.hubu.online.entity.PageResult;
import com.hubu.online.mapper.ClassifyMapper;
import com.hubu.online.entity.Classify;
import com.hubu.online.service.ClassifyService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 服务实现类
 */
@Service
public class ClassifyServiceImpl extends ServiceImpl<ClassifyMapper, Classify> implements ClassifyService {

    @Override
    public PageResult<Classify> listPage(PageParam<Classify> page) {
        List<Classify> records = baseMapper.listPage(page);
        return new PageResult<>(records, page.getTotal());
    }

    @Override
    public List<Classify> listAll(Map<String, Object> page) {
        return baseMapper.listAll(page);
    }

}
