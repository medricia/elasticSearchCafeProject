package com.projcafe.cafe.board.controller;

import java.util.List;

import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.client.ClientConfiguration;
import org.springframework.data.elasticsearch.client.RestClients;
import org.springframework.data.elasticsearch.config.AbstractElasticsearchConfiguration;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
@EnableElasticsearchRepositories(basePackages =  "com.projcafe.cafe")
public class Config extends AbstractElasticsearchConfiguration implements WebMvcConfigurer{
	
	  @Value("localhost:9200")
	  public String elasticsearchUrl;
	  
	  @Bean
	  @Override
	  public RestHighLevelClient elasticsearchClient() {
		  final ClientConfiguration config = ClientConfiguration.builder()
				  .connectedTo(elasticsearchUrl)
				  .build();
		  
		  return RestClients.create(config).rest();
	  }
	  
	  @Override
	  public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
	      argumentResolvers.add( new PageableHandlerMethodArgumentResolver());
	  }
	  
}
	