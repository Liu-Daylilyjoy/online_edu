package com.hubu.online.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hubu.online.controller.PageParam;
import com.hubu.online.controller.PageResult;
import com.hubu.online.entity.Carousel;
import com.hubu.online.mapper.CarouselMapper;
import com.hubu.online.service.CarouselService;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

/**
 * 服务实现类
 * Created by AutoGenerator on 2020-08-13 09:08:35
 */
@Service
public class CarouselServiceImpl extends ServiceImpl<CarouselMapper, Carousel> implements CarouselService {

    @Override
    public PageResult<Carousel> listPage(PageParam<Carousel> page) {
        List<Carousel> records = baseMapper.listPage(page);
        return new PageResult<>(records, page.getTotal());
    }

    @Override
    public List<Carousel> listAll(Map<String, Object> page) {
        return baseMapper.listAll(page);
    }

}
