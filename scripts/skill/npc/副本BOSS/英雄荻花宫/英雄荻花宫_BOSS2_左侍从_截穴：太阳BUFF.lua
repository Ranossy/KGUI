function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local BossNpc = scene.GetNpcByNickName("zuoshicong")
	if BossNpc and BossNpc.nMoveState ~= MOVE_STATE.ON_DEATH then
		BossNpc.FireAIEvent(2003, 0, dwCharacterID)
	end
end


	--local BossNameTab = {"zuoshicong", "youshicong", "rujiaozhujisi"}

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com