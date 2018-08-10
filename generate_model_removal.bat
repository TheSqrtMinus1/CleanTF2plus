:: go through entire modelremoval.txt list
for /F "tokens=*" %%A in (dev\lists\modelremoval.txt) do (
	:: do the first if it's a file, second if it's a folder
	Echo.%%A | findstr /c:".">nul && (
		mkdir %%A\..\
		copy dev\ref\null.vtx %%A
	) || (
		mkdir %%A
		dev\HLExtract.exe -p "../../tf2_textures_dir.vpk" -d %%A\..\ -e %%A -m -v -s
		for %%f in (%%A\*.vtx) do copy dev\ref\null.vtx %%f
	)
)