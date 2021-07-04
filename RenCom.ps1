function ren-com {
	param (
		[parameter(mandatory)] [string} $NewName
	)
}

$(gwmi win32_computersystem).Rename("$NewName")
