package com.projcafe.cafe.elastic;

import java.io.IOException;
import java.util.Map;

import org.apache.http.HttpHost;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;

public class ElasticTest {

	public static void main(String[] args) throws IOException {
		String hostname = "localhost";
		int port = 9200;
		HttpHost host = new HttpHost(hostname, port);
		RestClientBuilder restClientBuilder = RestClient.builder(host);
		RestHighLevelClient client = new RestHighLevelClient(restClientBuilder);
		
		
		String index = "cafeinfo";
		String id = "2";
		GetRequest getRequest = new GetRequest(index, id);
		RequestOptions options = RequestOptions.DEFAULT;
		
		GetResponse response = client.get(getRequest, options);
		
		Map<String,Object> map = response.getSourceAsMap();
		System.out.println(map);
		
		
	}

}
