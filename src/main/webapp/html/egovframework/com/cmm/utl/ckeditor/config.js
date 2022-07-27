/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.language='ko';	
	config.responseType = 'json';
	config.filebrowserUploadUrl = '/utl/wed/insertImage.do';
	config.filebrowserImageBrowseUrl = '/utl/wed/insertImage.do';
	config.filebrowserFlashBrowseUrl = '/utl/wed/insertImage.do';
	//config.contentsCss = '/css/egovframework/com/kings/style.css';
	CKEDITOR.dtd.$removeEmpty['i'] = false;
	CKEDITOR.dtd.$removeEmpty['span'] = false;
	config.extraAllowedContent = 'span[selector1,selector2,...,selectorN;iframe[*]';
	config.docType = "<!DOCTYPE html>";
	config.htmlEncodeOutput = false;
	//config.extraPlugins = 'youtube,pastecode,iframe';
	config.toolbar = [

	                  ['Font', 'FontSize'],

	                  ['BGColor', 'TextColor' ],

	                  ['Bold', 'Italic', 'Strike', 'Superscript', 'Subscript', 'Underline', 'RemoveFormat'],   

	                  ['BidiLtr', 'BidiRtl'],

	                  '/',

	                  ['Image', 'SpecialChar', 'Smiley'],

	                  ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],

	                  ['Blockquote', 'NumberedList', 'BulletedList'],

	                  ['Link', 'Unlink'],

	                  ['Source','Youtube','Pastecode','Iframe'],

	                  ['Undo', 'Redo']

	          ];
	config.allowedContent = true;
};
