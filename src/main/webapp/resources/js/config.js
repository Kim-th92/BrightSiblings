CKEDITOR.editorConfig =function (config){
	config.language = 'ko';
	config.font_names = '맑은 고딕/Malgun Gothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;'+ config.font_names;
	config.toolbar = [

        ['Font', 'FontSize'],
        ['BGColor', 'TextColor' ],
        ['Bold', 'Italic', 'Strike', 'Superscript', 'Subscript', 'Underline', 'RemoveFormat'],   
        ['BidiLtr', 'BidiRtl'],	

        '/',

        [ 'SpecialChar', 'Smiley'],
        ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],

        ['Blockquote', 'NumberedList', 'BulletedList'],

        ['Link', 'Unlink'],

        ['Source'],

        ['Undo', 'Redo']

];
}

