package model;

public class Likes {

	
	private int likes_num;
	private int board_num; //좋아요 한 게시글 번호
	private String nickname; //좋아요 한 사용자
	public Likes() {	}
	public Likes(int likes_num, int board_num, String nickname) {
		super();
		this.likes_num = likes_num;
		this.board_num = board_num;
		this.nickname = nickname;
	}
	public int getLikes_num() {
		return likes_num;
	}
	public void setLikes_num(int likes_num) {
		this.likes_num = likes_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "{\"likes_num\":\"" + likes_num + "\", \"board_num\":\"" + board_num + "\", \"nickname\":\"" + nickname
				+ "\"}";
	}
	
	
	
	
	
	
}
