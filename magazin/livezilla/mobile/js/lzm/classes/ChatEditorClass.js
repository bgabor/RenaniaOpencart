/****************************************************************************************
 * LiveZilla ChatEditorClass.js
 *
 * Copyright 2013 LiveZilla GmbH
 * All rights reserved.
 * LiveZilla is a registered trademark.
 *
 ***************************************************************************************/

function ChatEditorClass(editor, isMobile, isApp, isWeb) {
    this.editor = editor;
    this.isMobile = isMobile;
    this.isApp = isApp;
    this.isWeb = isWeb;
    this.editorWindow = null;
}

ChatEditorClass.prototype.init = function(loadedValue, caller) {
    this.removeEditor();
    make_wyzz(this.editor);
    this.editorWindow = document.getElementById("wysiwyg" + this.editor).contentWindow;
    loadedValue = (typeof loadedValue != 'undefined') ? loadedValue : '';
    lz_he_setFocus(this.editor);
    this.setHtml(loadedValue);
    if (this.editor == 'chat-input') {
        lz_he_onEnterPressed(chatInputEnterPressed);
        //document.getElementById("wysiwyg" + this.editor).contentWindow.document.body.onclick=chatInputBodyClicked;
        document.getElementById("wysiwyg" + this.editor).contentWindow.document.body.onkeyup=chatInputTyping;
    } else {
        lz_he_onEnterPressed(null);
        document.getElementById("wysiwyg" + this.editor).contentWindow.document.body.onclick=doNothing;
        document.getElementById("wysiwyg" + this.editor).contentWindow.document.body.onkeyup=doNothing;
    }
};

ChatEditorClass.prototype.clearEditor = function(os, browser) {
    if (typeof os == 'undefined' || os.toLowerCase() == 'ios') {
        this.setHtml('');
    } else {
        this.init('', 'clearEditor');
    }
};

ChatEditorClass.prototype.removeEditor = function() {
    $('#chat-buttons').children('div').append('<span id="tmp-input-span"><input type="text" id="tmp-input" /></span>');
    $('#tmp-input').focus();
    $('#tmp-input-span').remove();
    $('#wysiwyg' + this.editor + 'table').remove();
};

ChatEditorClass.prototype.bold = function() {
    lz_he_setFocus(this.editor);
    lz_he_setBold(this.editor);
};

ChatEditorClass.prototype.italic = function() {
    lz_he_setItalic(this.editor);
    lz_he_setFocus(this.editor);
};

ChatEditorClass.prototype.underline = function() {
    lz_he_setUnderline(this.editor);
    lz_he_setFocus(this.editor);
};

ChatEditorClass.prototype.grabText = function() {
    return lz_he_getText(this.editor);
};

ChatEditorClass.prototype.grabHtml = function() {
    return lz_he_getHTML(this.editor);
};

ChatEditorClass.prototype.insertHtml = function(html) {
    lz_he_insertHTML(html, this.editor);
};

ChatEditorClass.prototype.setHtml = function(html) {
    lz_he_setHTML(html, this.editor);
    lz_he_setFocus(this.editor);
    lz_he_setCursor(this.editor);
};

ChatEditorClass.prototype.blur = function() {
    lz_he_removeFocus(this.editor);
};

ChatEditorClass.prototype.focus = function() {
    if (!isApp && !isMobile) {
        lz_he_setFocus(this.editor);
    }
};

ChatEditorClass.prototype.switchDisplayMode = function() {
    lz_he_switchDisplayMode(this.editor);
    if (!this.isMobile && this.isWeb) {
        lz_he_setFocus(this.editor);
    }
};

ChatEditorClass.prototype.enterPressed = function() {
    this.setHtml('');
};
