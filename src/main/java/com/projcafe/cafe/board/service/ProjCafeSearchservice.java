package com.projcafe.cafe.board.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projcafe.cafe.board.repository.ProjCafesearchRepository;
import com.projcafe.cafe.board.repository.ProjcafesearchkeywordVO;

@Service
public class ProjCafeSearchservice{

	private ProjCafesearchRepository search;
	
	@Autowired
	public ProjCafeSearchservice(ProjCafesearchRepository search) {
		this.search = search;
	}

	public void save(final ProjcafesearchkeywordVO vo) {
		SimpleDateFormat isoFormatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
		isoFormatter.setTimeZone(TimeZone.getTimeZone("UTC"));

		// 날짜 변환
		String isoFormattedDate = isoFormatter.format(new Date());
		vo.setTimestamp(isoFormattedDate);
		search.save(vo);
	}
	
	public Iterable<ProjcafesearchkeywordVO> getdata() {
		return search.findAll();
	}

}
