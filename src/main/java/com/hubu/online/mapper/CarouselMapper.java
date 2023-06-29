package com.hubu.online.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hubu.online.entity.PageParam;
import com.hubu.online.entity.Carousel;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

/**
 * Mapper接口
 */
public interface CarouselMapper extends BaseMapper<Carousel> {

    /**
     * 分页查询
     */
    List<Carousel> listPage(@Param("page") PageParam<Carousel> page);

    /**
     * 查询全部
     */
    List<Carousel> listAll(@Param("page") Map<String, Object> page);

}
