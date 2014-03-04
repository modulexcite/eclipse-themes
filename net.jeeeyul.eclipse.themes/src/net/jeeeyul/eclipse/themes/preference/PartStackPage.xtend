package net.jeeeyul.eclipse.themes.preference

import net.jeeeyul.eclipse.themes.preference.internal.PreperencePageHelper
import net.jeeeyul.eclipse.themes.preference.internal.TextShadowEdit
import net.jeeeyul.eclipse.themes.rendering.JTabSettings
import net.jeeeyul.swtend.SWTExtensions
import net.jeeeyul.swtend.ui.ColorWell
import net.jeeeyul.swtend.ui.GradientEdit
import org.eclipse.swt.custom.CTabFolder
import org.eclipse.swt.graphics.Color
import org.eclipse.swt.widgets.Button
import org.eclipse.swt.widgets.Composite
import net.jeeeyul.eclipse.themes.SharedImages

class PartStackPage extends AbstractJTPreferencePage {
	Color[] backgroundColors = #[]
	Color[] selectedBackgroundColors = #[]
	Color unselectedForeground
	Color selectedForeground

	GradientEdit backgroundEdit
	GradientEdit borderEdit
	Button hideBorderButton

	GradientEdit selectedBackgroundEdit
	GradientEdit selectedBorderEdit
	Button hideSelectedBorderButton
	ColorWell selectedTextColorWell
	TextShadowEdit selectedShadowEdit

	GradientEdit unselectedBackgroundEdit
	Button hideUnselectedBackgroundButton
	GradientEdit unselectedBorderEdit
	Button hideUnselectedBorderButton
	ColorWell unselectedTextColorWell
	TextShadowEdit unselectedShadowEdit

	GradientEdit hoverBackgroundEdit
	Button hideHoverBackgroundButton
	GradientEdit hoverBorderEdit
	Button hideHoverBorderButton
	ColorWell hoverTextColorWell
	TextShadowEdit hoverShadowEdit

	ColorWell closeButtonColorWell
	ColorWell closeButtonHoverColorWell
	ColorWell closeButtonActiveColorWell

	@Property String context

	new(String title, String context) {
		super(title)
		this.context = context
		image = SharedImages.getImage(SharedImages.ACTIVE_PART)
	}

	override createContents(Composite parent, extension SWTExtensions swtExtensions, extension PreperencePageHelper helper) {
		parent.newComposite [
			layout = newGridLayout
			newGroup[
				text = "Header && Border"
				layoutData = FILL_HORIZONTAL[]
				layout = newGridLayout[
					numColumns = 4
				]
				newLabel[text = "Background"]
				backgroundEdit = newGradientEdit[
					layoutData = FILL_HORIZONTAL
					onModified = [
						requestUpdatePreview()
					]
				]
				backgroundEdit.appendOrderLockButton [
					layoutData = newGridData[horizontalSpan = 2]
				]
				newLabel[text = "Border"]
				borderEdit = newGradientEdit[
					layoutData = FILL_HORIZONTAL
					onModified = [
						requestUpdatePreview()
					]
				]
				borderEdit.appendOrderLockButton[]
				hideBorderButton = newCheckbox[
					text = "Hide"
					onSelection = [requestUpdatePreview()]
				]
			]
			newTabFolder[
				layoutData = FILL_HORIZONTAL
				newTabItem[
					text = "Selected"
					newComposite[
						layout = newGridLayout[
							numColumns = 4
						]
						newLabel[text = "Background"]
						selectedBackgroundEdit = newGradientEdit[
							layoutData = FILL_HORIZONTAL
							onModified = [
								requestUpdatePreview()
							]
						]
						selectedBackgroundEdit.appendOrderLockButton [
							layoutData = newGridData[
								horizontalSpan = 2
							]
						]
						newLabel[text = "Border"]
						selectedBorderEdit = newGradientEdit[
							layoutData = FILL_HORIZONTAL
							onModified = [
								requestUpdatePreview()
							]
						]
						selectedBorderEdit.appendOrderLockButton[]
						hideSelectedBorderButton = newCheckbox[
							text = "Hide"
							onSelection = [requestUpdatePreview()]
						]
						newLabel[text = "Text"]
						selectedTextColorWell = newColorWell[
							onModified = [
								requestUpdatePreview()
							]
							layoutData = newGridData[
								horizontalSpan = 3
							]
						]
						newLabel[text = "Text Shadow"]
						selectedShadowEdit = new TextShadowEdit(it) => [
							control.layoutData = FILL_HORIZONTAL[
								horizontalSpan = 3
							]
							modifyHandler = [
								requestUpdatePreview()
							]
						]
					]
				] // selected
				newTabItem[
					text = "Unselected"
					newComposite[
						layout = newGridLayout[
							numColumns = 4
						]
						newLabel[text = "Background"]
						unselectedBackgroundEdit = newGradientEdit[
							layoutData = FILL_HORIZONTAL
							onModified = [
								requestUpdatePreview()
							]
						]
						unselectedBackgroundEdit.appendOrderLockButton[]
						hideUnselectedBackgroundButton = newCheckbox[
							text = "Hide"
							onSelection = [requestUpdatePreview()]
						]
						newLabel[text = "Border"]
						unselectedBorderEdit = newGradientEdit[
							layoutData = FILL_HORIZONTAL
							onModified = [
								requestUpdatePreview()
							]
						]
						unselectedBorderEdit.appendOrderLockButton[]
						hideUnselectedBorderButton = newCheckbox[
							text = "Hide"
							onSelection = [requestUpdatePreview()]
						]
						newLabel[text = "Text"]
						unselectedTextColorWell = newColorWell[
							onModified = [
								requestUpdatePreview()
							]
							layoutData = newGridData[
								horizontalSpan = 3
							]
						]
						newLabel[text = "Text Shadow"]
						unselectedShadowEdit = new TextShadowEdit(it) => [
							control.layoutData = FILL_HORIZONTAL[
								horizontalSpan = 3
							]
							modifyHandler = [
								requestUpdatePreview()
							]
						]
					]
				] // Unselected
				newTabItem[
					text = "Hover"
					newComposite[
						layout = newGridLayout[
							numColumns = 4
						]
						newLabel[text = "Background"]
						hoverBackgroundEdit = newGradientEdit[
							layoutData = FILL_HORIZONTAL
							onModified = [
								requestUpdatePreview()
							]
						]
						hoverBackgroundEdit.appendOrderLockButton[]
						hideHoverBackgroundButton = newCheckbox[
							text = "Hide"
							onSelection = [requestUpdatePreview()]
						]
						newLabel[text = "Border"]
						hoverBorderEdit = newGradientEdit[
							layoutData = FILL_HORIZONTAL
							onModified = [
								requestUpdatePreview()
							]
						]
						hoverBorderEdit.appendOrderLockButton[]
						hideHoverBorderButton = newCheckbox[
							text = "Hide"
							onSelection = [requestUpdatePreview()]
						]
						newLabel[text = "Text"]
						hoverTextColorWell = newColorWell[
							onModified = [
								requestUpdatePreview()
							]
							layoutData = newGridData[
								horizontalSpan = 3
							]
						]
						newLabel[text = "Text Shadow"]
						hoverShadowEdit = new TextShadowEdit(it) => [
							control.layoutData = FILL_HORIZONTAL[
								horizontalSpan = 3
							]
							modifyHandler = [
								requestUpdatePreview()
							]
						]
					]
				] // Hover
			] // Tabs
			newComposite[
				layoutData = FILL_HORIZONTAL
				layout = newGridLayout[
					numColumns = 4
					marginWidth = 0
					marginHeight = 0
				]
				newLabel[
					text = "Close Button Color (Normal, Hover, Active)"
					layoutData = FILL_HORIZONTAL
				]
				closeButtonColorWell = newColorWell[
					onModified = [requestUpdatePreview]
				]
				closeButtonHoverColorWell = newColorWell[
					onModified = [requestUpdatePreview]
				]
				closeButtonActiveColorWell = newColorWell[
					onModified = [requestUpdatePreview]
				]
			]
		]
	}

	override updatePreview(CTabFolder folder, JTabSettings renderSettings, extension SWTExtensions swtExtensions, extension PreperencePageHelper helper) {

		// SWT CTabFolder ignores same color arrays.
		if(!this.backgroundColors.matches(backgroundEdit.selection.asSWTSafeHSBArray)) {
			var newBackgroundColors = backgroundEdit.selection.asSWTSafeHSBArray.createColors
			folder.setBackground(newBackgroundColors, backgroundEdit.selection.asSWTSafePercentArray, true)
			this.backgroundColors.safeDispose()
			this.backgroundColors = newBackgroundColors
		} else {
			folder.setBackground(this.backgroundColors, backgroundEdit.selection.asSWTSafePercentArray, true)
		}

		if(hideBorderButton.selection == false) {
			renderSettings.borderColors = borderEdit.selection.asSWTSafeHSBArray
			renderSettings.borderPercents = borderEdit.selection.asSWTSafePercentArray
		} else {
			renderSettings.borderColors = null
			renderSettings.borderPercents = null
		}

		// unselected
		{
			if(this.hideUnselectedBackgroundButton.selection == false) {
				renderSettings.unselectedBackgroundColors = this.unselectedBackgroundEdit.selection.asSWTSafeHSBArray
				renderSettings.unselectedBackgroundPercents = this.unselectedBackgroundEdit.selection.asSWTSafePercentArray
			} else {
				renderSettings.unselectedBackgroundColors = null
				renderSettings.unselectedBackgroundPercents = null
			}

			if(this.hideUnselectedBorderButton.selection == false) {
				renderSettings.unselectedBorderColors = this.unselectedBorderEdit.selection.asSWTSafeHSBArray
				renderSettings.unselectedBorderPercents = this.unselectedBorderEdit.selection.asSWTSafePercentArray
			} else {
				renderSettings.unselectedBorderColors = null
				renderSettings.unselectedBorderPercents = null
			}
			var newUnselectedForeground = this.unselectedTextColorWell.selection.createColor()
			folder.foreground = newUnselectedForeground
			unselectedForeground.safeDispose()
			this.unselectedForeground = newUnselectedForeground

			renderSettings.unselectedTextShadowColor = this.unselectedShadowEdit.color
			renderSettings.unselectedTextShadowPosition = this.unselectedShadowEdit.shadowPosition
		}

		//selected
		{

			// SWT CTabFolder ignores same color arrays.
			if(!this.selectedBackgroundColors.matches(this.selectedBackgroundEdit.selection.asSWTSafeHSBArray)) {
				var newSelectedBackgroundColors = this.selectedBackgroundEdit.selection.asSWTSafeHSBArray.createColors()
				this.selectedBackgroundColors.safeDispose()
				folder.setSelectionBackground(newSelectedBackgroundColors, this.selectedBackgroundEdit.selection.asSWTSafePercentArray, true)
				this.selectedBackgroundColors = newSelectedBackgroundColors
			} else {
				folder.setSelectionBackground(this.selectedBackgroundColors, this.selectedBackgroundEdit.selection.asSWTSafePercentArray, true)
			}

			var newSelectedForeground = this.selectedTextColorWell.selection.createColor
			this.selectedForeground.safeDispose()
			folder.setSelectionForeground(newSelectedForeground)
			this.selectedForeground = newSelectedForeground

			if(this.hideSelectedBorderButton.selection) {
				renderSettings.selectedBorderColors = null
				renderSettings.selectedBorderPercents = null
			} else {
				renderSettings.selectedBorderColors = this.selectedBorderEdit.selection.asSWTSafeHSBArray
				renderSettings.selectedBorderPercents = this.selectedBorderEdit.selection.asSWTSafePercentArray
			}

			renderSettings.selectedTextShadowColor = this.selectedShadowEdit.color
			renderSettings.selectedTextShadowPosition = this.selectedShadowEdit.shadowPosition
		}

		// hover
		{
			if(this.hideHoverBackgroundButton.selection) {
				renderSettings.hoverBackgroundColors = null
				renderSettings.hoverBackgroundPercents = null

			} else {
				renderSettings.hoverBackgroundColors = this.hoverBackgroundEdit.selection.asSWTSafeHSBArray
				renderSettings.hoverBackgroundPercents = this.hoverBackgroundEdit.selection.asSWTSafePercentArray
			}

			if(this.hideHoverBorderButton.selection) {
				renderSettings.hoverBorderColors = null
			} else {
				renderSettings.hoverBorderColors = this.hoverBorderEdit.selection.asSWTSafeHSBArray
				renderSettings.hoverBorderPercents = this.hoverBorderEdit.selection.asSWTSafePercentArray
			}
			renderSettings.hoverForgroundColor = this.hoverTextColorWell.selection

			renderSettings.hoverTextShadowColor = this.hoverShadowEdit.color
			renderSettings.hoverTextShadowPosition = this.hoverShadowEdit.shadowPosition
		}
		
		// close button
		{
			renderSettings.closeButtonColor = this.closeButtonColorWell.selection
			renderSettings.closeButtonActiveColor = this.closeButtonActiveColorWell.selection
			renderSettings.closeButtonHotColor = this.closeButtonHoverColorWell.selection
		}
		
	}

	override load(JThemePreferenceStore store, extension SWTExtensions swtExtensions, extension PreperencePageHelper helper) {
		store.withContext(this.context) [
			var borderColor = getGradient(JTPConstants.PartStack.BORDER_COLOR)
			if(borderColor != null) {
				this.borderEdit.selection = borderColor
			}
			var background = getGradient(JTPConstants.PartStack.BACKGROUND_COLOR)
			if(background != null) {
				this.backgroundEdit.selection = background
			}
			this.hideBorderButton.selection = !getBoolean(JTPConstants.PartStack.BORDER_SHOW)
			// selected
			{
				var selectedBackground = getGradient(JTPConstants.PartStack.SELECTED_FILL_COLOR)
				if(selectedBackground != null) {
					this.selectedBackgroundEdit.selection = selectedBackground
				}

				var selectedBorder = getGradient(JTPConstants.PartStack.SELECTED_BORDER_COLOR)
				if(selectedBorder != null) {
					this.selectedBorderEdit.selection = selectedBorder
				}
				this.hideSelectedBorderButton.selection = !getBoolean(JTPConstants.PartStack.SELECTED_BORDER_SHOW)
				var selectionForeground = getHSB(JTPConstants.PartStack.SELECTED_TEXT_COLOR)
				if(selectionForeground != null) {
					this.selectedTextColorWell.selection = selectionForeground
				}

				var selectedShadowColor = getHSB(JTPConstants.PartStack.SELECTED_TEXT_SHADOW_COLOR)
				if(selectedShadowColor != null)
					this.selectedShadowEdit.color = selectedShadowColor

				var selectedShadowPosition = getPoint(JTPConstants.PartStack.SELECTED_TEXT_SHADOW_POSITION)
				if(selectedShadowPosition != null)
					this.selectedShadowEdit.shadowPosition = selectedShadowPosition
			}
			// unselected
			{
				var unselectedBackground = getGradient(JTPConstants.PartStack.UNSELECTED_FILL_COLOR)
				if(unselectedBackground != null) {
					this.unselectedBackgroundEdit.selection = unselectedBackground
				}

				this.hideUnselectedBackgroundButton.selection = !getBoolean(JTPConstants.PartStack.UNSELECTED_FILL)
				var unselectedBorder = getGradient(JTPConstants.PartStack.UNSELECTED_BORDER_COLOR)
				if(unselectedBorder != null) {
					this.unselectedBorderEdit.selection = unselectedBorder
				}
				this.hideUnselectedBorderButton.selection = !getBoolean(JTPConstants.PartStack.UNSELECTED_BORDER_SHOW)
				var foreground = getHSB(JTPConstants.PartStack.UNSELECTED_TEXT_COLOR)
				if(foreground != null) {
					this.unselectedTextColorWell.selection = foreground
				}

				var unselectedShadowColor = getHSB(JTPConstants.PartStack.UNSELECTED_TEXT_SHADOW_COLOR)
				if(unselectedShadowColor != null)
					this.unselectedShadowEdit.color = unselectedShadowColor

				var unselectedShadowPosition = getPoint(JTPConstants.PartStack.UNSELECTED_TEXT_SHADOW_POSITION)
				if(unselectedShadowPosition != null)
					this.unselectedShadowEdit.shadowPosition = unselectedShadowPosition
			}
			// hover
			{
				var hoverBackground = getGradient(JTPConstants.PartStack.HOVER_FILL_COLOR)
				if(hoverBackground != null) {
					this.hoverBackgroundEdit.selection = hoverBackground
				}

				this.hideHoverBackgroundButton.selection = !getBoolean(JTPConstants.PartStack.HOVER_FILL)
				var hoverBorder = getGradient(JTPConstants.PartStack.HOVER_BORDER_COLOR)
				if(hoverBorder != null) {
					this.hoverBorderEdit.selection = hoverBorder
				}
				this.hideHoverBorderButton.selection = !getBoolean(JTPConstants.PartStack.HOVER_BORDER_SHOW)
				var foreground = getHSB(JTPConstants.PartStack.HOVER_TEXT_COLOR)
				if(foreground != null) {
					this.hoverTextColorWell.selection = foreground
				}

				var hoverShadowColor = getHSB(JTPConstants.PartStack.HOVER_TEXT_SHADOW_COLOR)
				if(hoverShadowColor != null)
					this.hoverShadowEdit.color = hoverShadowColor

				var hoverShadowPosition = getPoint(JTPConstants.PartStack.HOVER_TEXT_SHADOW_POSITION)
				if(hoverShadowPosition != null)
					this.hoverShadowEdit.shadowPosition = hoverShadowPosition
			}
			
			// close button
			{
				var normal = getHSB(JTPConstants.PartStack.CLOSE_BUTTON_COLOR)
				if(normal != null){
					this.closeButtonColorWell.selection = normal
				}
				
				var hot = getHSB(JTPConstants.PartStack.CLOSE_BUTTON_HOVER_COLOR)
				if(hot != null){
					this.closeButtonHoverColorWell.selection = hot
				}
				
				var active = getHSB(JTPConstants.PartStack.CLOSE_BUTTON_ACTIVE_COLOR)
				if(active != null){
					this.closeButtonActiveColorWell.selection = active
				}
			}
		]

	}

	override save(JThemePreferenceStore store, extension SWTExtensions swtExtensions, extension PreperencePageHelper helper) {
		store.withContext(this.context) [
			setValue(JTPConstants.PartStack.BORDER_COLOR, borderEdit.selection)
			setValue(JTPConstants.PartStack.BACKGROUND_COLOR, backgroundEdit.selection)
			setValue(JTPConstants.PartStack.BORDER_SHOW, !this.hideBorderButton.selection)
			setValue(JTPConstants.PartStack.SELECTED_FILL_COLOR, this.selectedBackgroundEdit.selection)
			setValue(JTPConstants.PartStack.SELECTED_BORDER_COLOR, this.selectedBorderEdit.selection)
			setValue(JTPConstants.PartStack.SELECTED_BORDER_SHOW, !this.hideSelectedBorderButton.selection)
			setValue(JTPConstants.PartStack.SELECTED_TEXT_COLOR, this.selectedTextColorWell.selection)
			setValue(JTPConstants.PartStack.SELECTED_TEXT_SHADOW_COLOR, this.selectedShadowEdit.color)
			setValue(JTPConstants.PartStack.SELECTED_TEXT_SHADOW_POSITION, this.selectedShadowEdit.shadowPosition)
			setValue(JTPConstants.PartStack.UNSELECTED_FILL_COLOR, this.unselectedBackgroundEdit.selection)
			setValue(JTPConstants.PartStack.UNSELECTED_BORDER_COLOR, this.unselectedBorderEdit.selection)
			setValue(JTPConstants.PartStack.UNSELECTED_BORDER_SHOW, !this.hideUnselectedBorderButton.selection)
			setValue(JTPConstants.PartStack.UNSELECTED_FILL, !this.hideUnselectedBackgroundButton.selection)
			setValue(JTPConstants.PartStack.UNSELECTED_TEXT_COLOR, this.unselectedTextColorWell.selection)
			setValue(JTPConstants.PartStack.UNSELECTED_TEXT_SHADOW_COLOR, this.unselectedShadowEdit.color)
			setValue(JTPConstants.PartStack.UNSELECTED_TEXT_SHADOW_POSITION, this.unselectedShadowEdit.shadowPosition)
			setValue(JTPConstants.PartStack.HOVER_FILL_COLOR, this.hoverBackgroundEdit.selection)
			setValue(JTPConstants.PartStack.HOVER_BORDER_COLOR, this.hoverBorderEdit.selection)
			setValue(JTPConstants.PartStack.HOVER_BORDER_SHOW, !this.hideHoverBorderButton.selection)
			setValue(JTPConstants.PartStack.HOVER_FILL, !this.hideHoverBackgroundButton.selection)
			setValue(JTPConstants.PartStack.HOVER_TEXT_COLOR, this.hoverTextColorWell.selection)
			setValue(JTPConstants.PartStack.HOVER_TEXT_SHADOW_COLOR, this.hoverShadowEdit.color)
			setValue(JTPConstants.PartStack.HOVER_TEXT_SHADOW_POSITION, this.hoverShadowEdit.shadowPosition)
			setValue(JTPConstants.PartStack.CLOSE_BUTTON_COLOR, this.closeButtonColorWell.selection)
			setValue(JTPConstants.PartStack.CLOSE_BUTTON_ACTIVE_COLOR, this.closeButtonActiveColorWell.selection)
			setValue(JTPConstants.PartStack.CLOSE_BUTTON_HOVER_COLOR, this.closeButtonHoverColorWell.selection)
		]
	}

	override dispose(extension SWTExtensions swtExtensions, extension PreperencePageHelper helper) {
		this.unselectedForeground.safeDispose
		this.selectedForeground.safeDispose
		this.backgroundColors.safeDispose
		this.selectedBackgroundColors.safeDispose
	}
}
