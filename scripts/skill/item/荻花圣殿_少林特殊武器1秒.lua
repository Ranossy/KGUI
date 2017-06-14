function Apply(dwCharacterID)
	local tnpc = GetNpc(dwCharacterID)
	if not tnpc then
		return
	end
	--tnpc.PlaySfx(201, tnpc.nX, tnpc.nY, tnpc.nZ)
	if tnpc.nMoveState == MOVE_STATE.ON_HALT and tnpc.nTouchRange <120 then
		tnpc.SetPosition(tnpc.nX, tnpc.nY, tnpc.nZ + 2.8*8*64)
		tnpc.DoAction(0,10030)
		tnpc.CastSkill(4106,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com