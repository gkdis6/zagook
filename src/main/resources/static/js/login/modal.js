var Modal = function(){
	
};
/**
jQuery.ajax로 options.url에 해당하는 html 내용 가져온 후
body에 append 해주기
 */
 Modal.prototype.open = function(options){
$.ajax({
		url: options.url,
		dataType:'html',
		success: function(html){
			var $modal = $(html)
			$('body').append($modal);
//			$modal.modal('show');
			$modal.show();
			//닫기
			$modal.on('hidden.bs.modal',function(){
				$modal.remove();
				
			});
		}
	});
		};





