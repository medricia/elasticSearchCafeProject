package com.projcafe.cafe.board.service;

import java.util.List;
import java.util.Map;

import org.elasticsearch.common.geo.GeoPoint;
import org.elasticsearch.common.unit.DistanceUnit;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.sort.GeoDistanceSortBuilder;
import org.elasticsearch.search.sort.SortMode;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Service;

import com.projcafe.cafe.board.repository.ProjCafeRepository;
import com.projcafe.cafe.board.repository.ProjcafeElasticVO;

@Service
public class ProjCafeServiceImpl2{

	@Autowired
	private ProjCafeRepository cafedao;
	@Autowired
    private ElasticsearchRestTemplate elasticsearchRestTemplate;

	public List<ProjcafeElasticVO> CafeList(Map<String, Object> map) {
		return (List<ProjcafeElasticVO>) cafedao.findAll((Sort) map);
	}
	
	public ProjcafeElasticVO findById(final String CAFE_ID) {
		return cafedao.findById(CAFE_ID).orElse(null);
	}
	
	public Iterable<ProjcafeElasticVO> findAll() {
		return  cafedao.findAll();
	}
	
	public List<ProjcafeElasticVO> findname(String name, Pageable page) {
		return cafedao.findByCafeName(name, page);
	}
	
	@SuppressWarnings("deprecation")
	public List<ProjcafeElasticVO> findClosestCafes(double lat, double lon, Pageable page){
        GeoPoint geoPoint = new GeoPoint(lat, lon);

        return cafedao.search(
            new NativeSearchQueryBuilder()
                .withQuery(
                    QueryBuilders.geoDistanceQuery("location-geopoint")
                        .point(lat, lon)
                        .distance("500m")
                )
                .withSort(
                    new GeoDistanceSortBuilder("location-geopoint", geoPoint)
                        .order(SortOrder.ASC)
                        .unit(DistanceUnit.METERS)
                        .sortMode(SortMode.MIN)
                )
                .withPageable(page)
                .build()
        ).toList();
	}
	

}
