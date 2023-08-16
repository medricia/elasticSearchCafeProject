package com.projcafe.cafe.elastic.repository;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import com.projcafe.cafe.elastic.configuration.document.Person;

public interface PersonRepository extends ElasticsearchRepository<Person, String>{

}
