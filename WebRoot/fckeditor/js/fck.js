function FCKeditor_OnComplete(editorInstance) {
				var oCombo = document.getElementById('cmbSkins') ;
	
				// Get the active skin.
				var sSkin = editorInstance.Config['SkinPath'] ;
				sSkin = sSkin.match( /[^\/]+(?=\/$)/g ) ;
	
				oCombo.value = sSkin ;
				oCombo.style.visibility = '' ;
			}

			function ChangeSkin(skinName) {
				window.location.href = window.location.pathname + "?skin=" + skinName ;
			}