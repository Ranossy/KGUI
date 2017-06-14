function Apply(dwCharacterID)
	local tnpc = GetNpc(dwCharacterID)
	if not tnpc then
		return
	end
		tnpc.PlaySfx(203, tnpc.nX, tnpc.nY, tnpc.nZ)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com