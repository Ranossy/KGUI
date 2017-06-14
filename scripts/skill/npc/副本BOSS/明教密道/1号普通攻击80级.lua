function Apply(dwCharacterID)
	local tnpc = GetNpc(dwCharacterID)
	if not tnpc then
		return
	end
	local targetTP,targetID = tnpc.GetTarget()
	if IsPlayer(targetID) then
		target = GetPlayer(targetID)
	else
		target = GetNpc(targetID)
	end
	if target.nMoveState == MOVE_STATE.ON_HALT or target.nMoveState == MOVE_STATE.ON_KNOCKED_DOWN then
		tnpc.CastSkill(4165,4)
	else
		tnpc.CastSkill(4165,3)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com