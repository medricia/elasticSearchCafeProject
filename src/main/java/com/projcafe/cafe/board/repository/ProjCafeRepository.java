package com.projcafe.cafe.board.repository;


import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Query;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface ProjCafeRepository extends ElasticsearchRepository<ProjcafeElasticVO, String>{
	
	@Query("{\"bool\": {\"should\": [{\"match\": {\"cafe_name\": \"?0\"}}, {\"term\": {\"cafe_location\": \"?0\"}}]}}")
	List<ProjcafeElasticVO> findByCafeName(String cafeName, Pageable pageable);
	
	@Query("{\"bool\": {\"must\": {\"match_all\": {}}, \"filter\": {\"geo_distance\": {\"distance\": \"500m\", \"location-geopoint\": {\"lat\": ?0, \"lon\": ?1}}}}}")
	List<ProjcafeElasticVO> findClosestCafes(double lat, double lon, Pageable pageable);
	
}
