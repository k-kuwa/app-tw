// スマホメニューボタン
$(function () {
    $(".header-menu-button, .menu-overlay").click(function(){
  	  $(".header-menu-button").toggleClass("open"); // クリックした要素にclass="open"を付け足す。あれば消す。
      $(".side-menu").animate({width:'toggle'}, 300); // サイドメニューを横から300スピードでスライド イン/アウト
      $(".menu-overlay").fadeToggle(300);　//周りを暗くするオーバーレイを同時に　表示/非表示
    });
});

// フォーム関連
//すべてのinput type="text"のエンターキーでの送信を無効化する。
$(function(){
    $('input[type="text"]').keypress(function(e){
        if((e.which == 13) || (e.keyCode == 13)){ return false; } //13はenterキーのキーコード
    });
});
// スマホツイート・コメント投稿フォーム
$(function () {
    // 表示
    $(".post-button, .post-icon-fixed, .comment-button").click(function(){   //クリックされた時
      if($(".modal-overlay")[0]) $(".modal-overlay").remove();　//もしモーダルオーバーレイがあれば一旦削除。
      $(".header").append('<div class="modal-overlay"></div>');//新たにhtmlオーバーレイを作成。
      $(".modal-overlay, .post-form-content, .comment-form-content").fadeIn(300);　//フォームとオーバーレイを表示させる。スピード300で
    });
    // 非表示
    $(document).on("click",".modal-overlay, .cansel-button", function(){ //オーバーレイかキャンセル押されたら
      $(".modal-overlay, .post-form-content, .comment-form-content").fadeOut(300, function(){//フォームとオーバーレイをfadeOutさせて
        $(".modal-overlay").remove();　//最後にオーバーレイのhtmlを削除
      });
    });
});

// 投稿フォーム入力判定　データがあった時だけボタンが押せる
$(function(){
    if ($('#tweet_text, #comment_text').val() == 0) {　//textareaの文字列が０かつ画像がなかったらだったら
      $('.post-form-box-toolbar-button-send, .comment-form-box-toolbar-button-send').prop('disabled', true);
    }  //sendボタンを無効化
    $('#tweet_text, #comment_text').on('keydown keyup keypress change', function() {
       if ($(this).val().length > 0) { //文字列が１以上だったら
         $('.post-form-box-toolbar-button-send, .comment-form-box-toolbar-button-send').prop('disabled', false);
       } else { //無効化解除
         $('.post-form-box-toolbar-button-send, .comment-form-box-toolbar-button-send').prop('disabled', true);
       }　//それ以外は無効のまま
    });

// 画像ファイルも同様
    if ($('#tweet_image, #comment_image')[0] == null){ //ファイルがnullだったら
      $('.post-form-box-toolbar-button-send, .comment-form-box-toolbar-button-send').prop('disabled', true);
    }//ボタン無効化
    $('#tweet_image, #comment_image').on('change', function() { //ファイルがセットされた時
       if ($(this)[0].files[0] != null) { //ちゃんとファイルがあれば
         $('.post-form-box-toolbar-button-send, .comment-form-box-toolbar-button-send').prop('disabled', false);
       } else { //無効化解除
         $('.post-form-box-toolbar-button-send, .comment-form-box-toolbar-button-send').prop('disabled', true);
       }　//それ以外は無効のまま
  });
});

//投稿画像が選択されたらサムネを表示する
$(function() {
    // jQuery Upload Thumbs プラグインを使用
    $('#tweet_image, #comment_image').uploadThumbs({ //投稿、コメントフォーム
        position : '.selected-image',
    });
    $('#user_image').uploadThumbs({　//プロフィール編集フォーム
       position : '.content-profile-image',
   });
});

// コメント一覧の高さ指定
  $(function () {
      wh = $(window).height();　//ウィンドウの高さ取得
      hh = $(".header").height(); //ヘッダーの高さ取得
      cbh =$(".comment-button").height(); //コメントボタンの高さ取得
    $(".page-comment-container").css("height", (wh - (hh + cbh + 20)) + "px");
    // 　ウィンドウ ー (ヘッダー ＋ コメボタン ＋ マージン20px)で一覧の高さを指定。

    //画面をリサイズされた時にも対応。ほぼ上記と同じ。
  　$(window).resize(function () {
    wh = $(window).height();
    hh = $(".header").height();
    cbh =$(".comment-button").height();
    $(".page-comment-container").css("height", (wh - (hh + cbh + 20)) + "px");
  　  });
  });
