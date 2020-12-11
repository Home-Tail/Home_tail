package com.sist.news;
/*
 * <item>
	<title>"요리 없이 홈파티 준비 끝" HMR 전문브랜드 프롬셰프, 연말파티 기념 프로모션 제공</title>
	<link>http://www.job-post.co.kr/news/articleView.html?idxno=11106</link>
	<description>
	<![CDATA[ 현업에서 활동 중인 셰프들의 고유한 레시피가 바탕이 된 만큼 기존의 밀키트나 쿠킹박스 등 제품과도 차별화 된 수준을 보이면서 깐깐한 입맛을 가진 2030 젊은 세대를 사로잡고 있다. 특히 최근 출시된 연말 할인팩은 별도의... ]]>
	</description>
	<pubDate>Thu, 26 Nov 2020 14:37:00 +0900</pubDate>
	<author>잡포스트</author>
	<category>섹션없음</category>
	<media:thumbnail url="https://imgnews.pstatic.net/image/thumb140/5820/2020/11/26/4383.jpg"/>
	</item>
 */
// <rss> => Rss
// <channel> => Channel
// <title>aa</title> ==> String title
public class Item {
	private String title;
	private String link;
	private String description;
	private String pubDate;
	private String author;
	private String day;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
}
