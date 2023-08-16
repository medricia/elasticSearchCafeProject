package com.projcafe.cafe;

import java.io.IOException;

import org.apache.http.HttpHost;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramInterval;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;

public class ElasticsearchAggregationExample {
	public static void main(String[] args) {
        // Elasticsearch 연결 설정
        RestHighLevelClient client = new RestHighLevelClient(
            RestClient.builder(
                new HttpHost("localhost", 9200, "http") // Elasticsearch 호스트 및 포트 설정
            )
        );

        // Elasticsearch 쿼리 작성
        SearchRequest searchRequest = new SearchRequest("cafesearch");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        
        // Size 설정
        sourceBuilder.size(0);

        // Aggregation 설정
        TermsAggregationBuilder keywordAggregation = AggregationBuilders.terms("top_keywords")
            .field("SEARCHKEYWORD")
            .size(10);
        
        sourceBuilder.aggregation(
            AggregationBuilders.dateHistogram("keyword_histogram")
                .field("timestamp")
                .calendarInterval(DateHistogramInterval.DAY)
                .subAggregation(keywordAggregation)
        );

        searchRequest.source(sourceBuilder);

        // 쿼리 실행 및 결과 처리
        try {
            SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
            System.out.println(searchResponse);
            // 결과 처리 코드 추가
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 클라이언트 종료
            try {
                client.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
